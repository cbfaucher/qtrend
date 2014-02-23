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