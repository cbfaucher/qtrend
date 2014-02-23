--  THOSE ARE FUNCTIONS THAT ARE USED BY THE VIEWS

DROP TYPE EMAs CASCADE;
CREATE TYPE EMAs AS (
    STEMA REAL,
    LTEMA REAL
);

DROP FUNCTION GetPreviousClose(VARCHAR, int, int);
CREATE FUNCTION GetPreviousClose(VARCHAR, int, int)
    RETURNS REAL
    AS $$
        SELECT COALESCE((SELECT CLOSE FROM STOCKQUOTES WHERE ticker=$1 and periodsequence=($2 - $3)), CAST(0 AS REAL));
    $$
    LANGUAGE SQL;

DROP FUNCTION CalculateEmas(CHAR(20), REAL, INT, INT, INT, INT);
CREATE OR REPLACE FUNCTION CalculateEmas(ticker CHAR(20), close REAL, periodseq int, delta int, stEmaPeriod int, ltEmaPeriod INT)
    RETURNS EMAs
    AS $$
        SELECT $2, $2;
    $$
    LANGUAGE SQL;


DROP FUNCTION CalculateStEma(CHAR(20), REAL, int, int, INT);
CREATE OR REPLACE FUNCTION CalculateStEma(ticker CHAR(20), close REAL, periodseq int, delta int, emaFactor int)
    RETURNS REAL
    AS $$
        SELECT $2;
    $$
    LANGUAGE SQL;

DROP FUNCTION CalculateLtEma(CHAR(20), REAL, int, int, INT);
CREATE OR REPLACE FUNCTION CalculateLtEma(ticker CHAR(20), close REAL, periodseq int, delta int, emaFactor int)
    RETURNS REAL
    AS $$
        SELECT $2;
    $$
    LANGUAGE SQL;

DROP VIEW V_LANGFORD_EMA;
CREATE VIEW V_LANGFORD_EMA
    AS
       SELECT ID, TICKER, PERIODSEQUENCE, CLOSE, VOLUME, (EMAs).STEMA, (EMAs).LTEMA
       FROM
           (   SELECT ID, TICKER, PERIODSEQUENCE, CLOSE, VOLUME, CalculateEmas(TICKER, CLOSE, PERIODSEQUENCE, 1, 7, 28) as EMAs
               FROM STOCKQUOTES
               OFFSET 0
           ) AS T
       ORDER BY TICKER, PERIODSEQUENCE;

-- NEXT ARE FUNCTION REDEFINITIONS, 'CAUSE THERE IS A CIRCULAR DEPS BETWEEN THE VIEWS AND THE FUNCTIONS

CREATE OR REPLACE FUNCTION CalculateStEma(ticker CHAR(20), close REAL, periodseq int, delta int, emaFactor int)
    RETURNS REAL
    AS $$
        -- EMA(current) = ( (Price(current) - EMA(prev) ) x Multiplier) + EMA(prev)
        SELECT CAST(  (($2 - T.PREVSTEMA) * (2.0 / (1.0+$5)) + T.PREVSTEMA) AS REAL) AS STEMA
        FROM
            (SELECT COALESCE((SELECT STEMA FROM V_LANGFORD_EMA WHERE ticker=$1 and periodsequence=($3 - $4)), CAST($2 AS REAL)) AS PREVSTEMA) AS T;
    $$
    LANGUAGE SQL;

CREATE OR REPLACE FUNCTION CalculateEmas(ticker CHAR(20), close REAL, periodseq int, delta int, stEmaFactor int, ltEmaFactor int)
    RETURNS EMAs
    LANGUAGE SQL
    IMMUTABLE
    AS $$
        -- EMA(current) = ( (Price(current) - EMA(prev) ) x Multiplier) + EMA(prev)
        SELECT  CAST(  (($2 - T.PREVSTEMA) * (2.0 / (1.0+$5)) + T.PREVSTEMA) AS REAL),
                CAST(  (($2 - T.PREVLTEMA) * (2.0 / (1.0+$6)) + T.PREVLTEMA) AS REAL)
        FROM
            (SELECT
                COALESCE((SELECT STEMA FROM V_LANGFORD_EMA WHERE ticker=$1 and periodsequence=($3 - $4)), CAST($2 AS REAL)) AS PREVSTEMA,
                COALESCE((SELECT LTEMA FROM V_LANGFORD_EMA WHERE ticker=$1 and periodsequence=($3 - $4)), CAST($2 AS REAL)) AS PREVLTEMA) AS T;
    $$;

