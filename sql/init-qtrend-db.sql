CREATE USER qtrend PASSWORD 'getrich';

DROP SEQUENCE qtrendseq;
DROP INDEX tickerIdx;
DROP INDEX exchangeIdx;
DROP INDEX refIdIdx;
DROP TABLE Langford;
DROP TABLE StockQuotes;
DROP TABLE Names;

CREATE SEQUENCE qtrendseq;
GRANT ALL ON qtrendseq TO qtrend;

CREATE TABLE StockQuotes
(
    id              BIGINT PRIMARY KEY,
    stockExchange   CHAR(10) NOT NULL,
    ticker          CHAR(20) NOT NULL,
    periodSequence  INTEGER NOT NULL,
    date            DATE NOT NULL,
    time            TIME,

    open            REAL,
    high            REAL,
    low             REAL,
    close           REAL NOT NULL,
    priceDifference REAL NOT NULL,

    volume          BIGINT NOT NULL,
    averagevolume   BIGINT NOT NULL
);
GRANT ALL ON StockQuotes TO qtrend;

DROP TABLE Aroon;
CREATE TABLE Aroon
(
    refid           BIGINT NOT NULL,
    period          BIGINT NOT NULL,
    aroonup         REAL NOT NULL,
    aroondown       REAL NOT NULL,

    FOREIGN KEY (refid) REFERENCES StockQuotes(ID) on delete cascade on update cascade
);
GRANT ALL ON Aroon to qtrend;

CREATE SEQUENCE watchlistseq;
GRANT ALL ON watchlistseq TO qtrend;

DROP TABLE WatchLists;
CREATE TABLE WatchLists
(
    id          BIGINT PRIMARY KEY,
    name        CHAR(40) NOT NULL,
    description CHAR(250)
);
GRANT ALL ON WatchLists TO qtrend;

DROP TABLE WatchListTickers;
CREATE TABLE WatchListTickers
(
    refid       BIGINT NOT NULL,
    ticker      CHAR(20),

    FOREIGN KEY (refid) REFERENCES WatchLists(ID) on delete cascade on update cascade
);
GRANT ALL ON WatchListTickers TO qtrend;

CREATE TABLE Langford
(
    refid BIGINT NOT NULL,
    rsi             REAL,

    stema           REAL,
    ltema           REAL,
    ema56           REAL,
    ema112          REAL,

    macdstema       REAL,
    macdltema       REAL,
    emaDifference   REAL,
    macd            REAL,

    variation       CHAR,
    signal          CHAR(4),
    nextsignal      REAL,

    FOREIGN KEY (refid) REFERENCES StockQuotes (id) ON DELETE CASCADE ON UPDATE CASCADE
);
GRANT ALL ON Langford TO qtrend;

CREATE TABLE Names
(
    stockexchange   CHAR(10),
    ticker          CHAR(20) ,
    name            VARCHAR NOT NULL,

    PRIMARY KEY (stockexchange, ticker)
);
GRANT ALL ON Names TO qtrend;

CREATE INDEX tickerIdx ON StockQuotes (Ticker);
CREATE INDEX exchangeIdx ON StockQuotes (StockExchange);
CREATE INDEX refIdIdx ON Langford (refid);

DROP FUNCTION GetPreviousClose(VARCHAR, VARCHAR, int, int) CASCADE;
CREATE FUNCTION GetPreviousClose(exchange VARCHAR, ticker VARCHAR, thisPeriodSeq int, delta int)
    RETURNS REAL
    AS $$
        SELECT COALESCE((SELECT CLOSE FROM STOCKQUOTES WHERE ticker=$2 and stockexchange=$1 and periodsequence=($3 - $4)), CAST(1.0 AS REAL));
    $$
    LANGUAGE SQL;
GRANT ALL ON FUNCTION GetPreviousClose(VARCHAR, VARCHAR, int, int) TO qtrend;

DROP VIEW V_TICKERS;
CREATE VIEW V_TICKERS
    AS
        SELECT  *,
                ROUND ( CAST( (CLOSE - STEMA)/STEMA * 100 AS NUMERIC ), 2 ) AS DIFFSTEMA,
                ROUND ( CAST( (CLOSE - LTEMA)/LTEMA * 100 AS NUMERIC ), 2 ) AS DIFFLTEMA,
                ROUND ( CAST( (CLOSE - EMA56)/EMA56 * 100 AS NUMERIC ), 2 ) AS DIFFEMA56,
                ROUND ( CAST( (CLOSE - EMA112)/EMA112 * 100 AS NUMERIC ), 2 ) AS DIFFEMA112
        FROM
            (   SELECT  *,
                        ROUND( CAST(((T.CLOSE-PREVIOUSCLOSE1)/PREVIOUSCLOSE1) * 100 AS NUMERIC), 2) AS CLOSEVAR1,
                        ROUND( CAST(((T.CLOSE-PREVIOUSCLOSE3)/PREVIOUSCLOSE3) * 100 AS NUMERIC), 2) AS CLOSEVAR3,
                        ROUND( CAST(((T.CLOSE-PREVIOUSCLOSE7)/PREVIOUSCLOSE7) * 100 AS NUMERIC), 2) AS CLOSEVAR7
                FROM
                    (SELECT
                        T.ID, T.TICKER, T.STOCKEXCHANGE, N.NAME, T.PERIODSEQUENCE, T.DATE, T.TIME, T.OPEN, T.HIGH, T.LOW, T.CLOSE, T.PRICEDIFFERENCE, T.VOLUME, T.AVERAGEVOLUME, RSI, STEMA, LTEMA, EMA56, EMA112, MACDSTEMA, MACDLTEMA, EMADIFFERENCE, MACD, VARIATION, SIGNAL, NEXTSIGNAL,
                        GetPreviousClose(T.STOCKEXCHANGE, T.TICKER, T.PERIODSEQUENCE, 1) AS PREVIOUSCLOSE1,
                        GetPreviousClose(T.STOCKEXCHANGE, T.TICKER, T.PERIODSEQUENCE, 3) AS PREVIOUSCLOSE3,
                        GetPreviousClose(T.STOCKEXCHANGE, T.TICKER, T.PERIODSEQUENCE, 7) AS PREVIOUSCLOSE7
                    FROM
                        STOCKQUOTES AS T
                            INNER JOIN LANGFORD
                                ON REFID=ID
                            LEFT OUTER JOIN NAMES AS N
                                ON (T.TICKER = N.TICKER AND T.STOCKEXCHANGE=N.STOCKEXCHANGE)
                    ) AS T
            ) AS T2
        ORDER BY T2.TICKER, T2.PERIODSEQUENCE DESC;
GRANT ALL ON V_TICKERS TO qtrend;

