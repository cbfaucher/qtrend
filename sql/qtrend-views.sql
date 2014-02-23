    DROP FUNCTION GetPreviousClose(VARCHAR, VARCHAR, int, int) CASCADE;
    CREATE FUNCTION GetPreviousClose(exchange VARCHAR, ticker VARCHAR, thisPeriodSeq int, delta int)
        RETURNS REAL
        AS $$
            SELECT COALESCE((SELECT CLOSE FROM STOCKQUOTES WHERE ticker=$2 and stockexchange=$1 and periodsequence=($3 - $4)), CAST(1.0 AS REAL));
        $$
        LANGUAGE SQL;

    DROP VIEW V_TICKERS;
    CREATE VIEW V_TICKERS
        AS
            SELECT T2.TICKER, NAME, T2.STOCKEXCHANGE, DATE, PERIODSEQUENCE, CLOSE, VOLUME, AVERAGEVOLUME, RSI, MACD, SIGNAL, CLOSEVAR1, CLOSEVAR3, CLOSEVAR7
            FROM
                (   SELECT T.TICKER, NAME, T.STOCKEXCHANGE, DATE, PERIODSEQUENCE, CLOSE, VOLUME, AVERAGEVOLUME, RSI, MACD, SIGNAL,
                            ROUND( CAST(((T.CLOSE-PREVIOUSCLOSE1)/PREVIOUSCLOSE1) * 100 AS NUMERIC), 2) AS CLOSEVAR1,
                            ROUND( CAST(((T.CLOSE-PREVIOUSCLOSE3)/PREVIOUSCLOSE3) * 100 AS NUMERIC), 2) AS CLOSEVAR3,
                            ROUND( CAST(((T.CLOSE-PREVIOUSCLOSE7)/PREVIOUSCLOSE7) * 100 AS NUMERIC), 2) AS CLOSEVAR7
                    FROM
                        (SELECT
                            T.TICKER, NAME, T.STOCKEXCHANGE, DATE, PERIODSEQUENCE, CLOSE, VOLUME, AVERAGEVOLUME, RSI, MACD, SIGNAL,
                            GetPreviousClose(T.STOCKEXCHANGE, T.TICKER, T.PERIODSEQUENCE, 1) AS PREVIOUSCLOSE1,
                            GetPreviousClose(T.STOCKEXCHANGE, T.TICKER, T.PERIODSEQUENCE, 3) AS PREVIOUSCLOSE3,
                            GetPreviousClose(T.STOCKEXCHANGE, T.TICKER, T.PERIODSEQUENCE, 7) AS PREVIOUSCLOSE7
                        FROM
                            STOCKQUOTES AS T
                                INNER JOIN LANGFORD
                                    ON REFID=ID
                                INNER JOIN NAMES AS N
                                    ON (T.TICKER = N.TICKER AND T.STOCKEXCHANGE=N.STOCKEXCHANGE)
                        ) AS T
                ) AS T2
            ORDER BY T2.TICKER, T2.PERIODSEQUENCE DESC;


