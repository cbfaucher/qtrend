/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.services;

import com.quartz.qtrend.Signal;
import com.quartz.qtrend.StockRuntimeException;
import com.quartz.qtrend.dom.*;
import com.quartz.qtrend.dom.alerts.Alert;
import com.quartz.qtrend.dom.alerts.IAlertAction;
import com.quartz.qtrend.dom.dao.StockQuoteLoadContext;
import com.quartz.qtrend.dom.helpers.Price;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.watchlists.IWatchListService;
import com.quartz.qtrend.dom.watchlists.StringRowMapper;
import com.quartz.qtrend.dom.yahoo.UpdateInformation;
import com.quartz.qutilities.formatter.FormatException;
import com.quartz.qutilities.formatter.RowFormat;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.sql.YearMonthDayByTimeMillisRowMapper;
import com.quartz.qutilities.util.DateUtilities;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.util.QProperties;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.val;
import org.joda.time.LocalDate;
import org.joda.time.YearMonthDay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;


import javax.annotation.PostConstruct;
import java.util.*;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
@Component("QTrend.StockQuoteListService")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class StockQuoteListService implements IStockQuoteListService {
    static private final ILog LOG = LogManager.getLogger(StockQuoteListService.class);

    //  todo: SQL
    static public final String SQL_LOAD_UPDATE_INFORMATION = "SELECT stockexchange, ticker, max(date) AS LASTDATE, max(periodsequence) AS LASTSEQUENCE FROM stockquotes WHERE stockexchange != 'OBB' GROUP BY stockexchange, ticker;";

    private static final String SQL_FIND_OVERSOLD_STOCKS = "SELECT * FROM v_tickers WHERE stockexchange=? AND close>=? AND volume>=? AND rsi<=? AND rsi>0 AND date=(SELECT max(date) FROM stockquotes WHERE stockexchange=?) ORDER BY rsi, ticker;";
    private static final String SQL_FIND_OVERBOUGHT_STOCKS = "SELECT * FROM v_tickers WHERE stockexchange=? AND close>=? AND volume>=? AND rsi>=? AND date=(SELECT max(date) FROM stockquotes WHERE stockexchange=?) ORDER BY rsi DESC, ticker;";

    private static final String SQL_FIND_INCOMING_OBS =
            "SELECT * " +
            "FROM V_TICKERS " +
            "WHERE date = (SELECT max(date) FROM stockquotes) " +
            "AND variation='-' AND nextsignal>0 AND nextsignal <= ? " +
            "AND rsi>0 AND rsi<=? " +
            "ORDER BY nextsignal, stockexchange, ticker;";
    private static final String SQL_FIND_INCOMING_OSS =
            "SELECT * " +
            "FROM V_TICKERS " +
            "WHERE date = (SELECT max(date) FROM stockquotes) " +
            "AND variation='+' AND nextsignal>0 AND nextsignal <= ? " +
            "AND rsi>=? " +
            "ORDER BY nextsignal, stockexchange, ticker;";

    private static final String SQL_GET_HISTORY_NEWEST_TO_OLDEST = "select * from V_TICKERS where ticker=? order by date desc;";
    private static final String SQL_GET_HISTORY_OLDEST_TO_NEWEST = "select * from V_TICKERS where ticker=? order by date;";

    private static final String SQL_TICKERS_FOR_EXCHANGE = "SELECT DISTINCT ticker FROM STOCKQUOTES WHERE STOCKEXCHANGE=? ORDER BY ticker";

    //    private static final String SQL_SELECT_ALL_QUOTES_FOR_TICKER_EXCHANGE_WITH_LIMIT =
//            "select * from v_tickers, " +
//            "   (select max(periodsequence) as MAX from stockquotes where ticker=?) AS T " +
//            "WHERE ticker=? and periodsequence > (MAX - ?) " +
//            "ORDER BY date;";
    private static final String SQL_SELECT_ALL_QUOTES_FOR_TICKER_EXCHANGE_WITH_LIMIT =
            "SELECT * " +
            "FROM stockquotes INNER JOIN langford ON refid=id " +
            "WHERE ticker=? " +
            "ORDER BY date DESC " +
            "LIMIT ?;";

    private static final String SQL_SELECT_ALL_QUOTES_FOR_TICKER_EXCHANGE =
            "SELECT * FROM V_TICKERS WHERE TICKER=? ORDER BY DATE;";


    static public final String SQL_EXCHANGE_SUMMARY_FOR_EXCHANGE =
            "SELECT stockquotes.*, langford.* " +
            "FROM   stockquotes " +
            "       INNER JOIN " +
            "       langford " +
            "       ON refid=id " +
            "WHERE  stockexchange=? " +
            "       AND date=(SELECT max(date) FROM stockquotes WHERE stockexchange=?) " +
            "ORDER BY ticker;";

    static public final String SQL_FIND_LATEST_SIGNALS_FOR_EXCHANGE =
            "SELECT * " +
            "FROM (stockquotes INNER JOIN langford ON (refid=id AND signal!='')) AS T " +
            "WHERE  stockexchange=? " +
            "       AND date = (SELECT Max(date) " +
            "                   FROM (stockquotes INNER JOIN langford ON (refid=id AND signal!='')) AS V " +
            "                   WHERE V.ticker=T.Ticker) " +
            "ORDER BY ticker;";

    static public final String SQL_FIND_LAST_SIGNALS_FOR_EXCHANGE =
            "SELECT * " +
            "FROM (stockquotes INNER JOIN langford ON refid=id) AS T\n" +
            "WHERE stockexchange=?  " +
            "   AND DATE = (SELECT max(date) " +
            "              FROM (stockquotes " +
            "                    INNER JOIN langford " +
            "                    ON id=refid) AS V " +
            "              WHERE V.ticker=T.Ticker AND signal=?) " +
            "ORDER BY date DESC, ticker;";

    static private final String SQL_TICKERS_BUY_SIGNALS =
            "SELECT stockquotes.*, langford.*  " +
            "FROM stockquotes INNER JOIN langford ON refid=id " +
            "WHERE ticker=? " +
            "AND rsi <= ? " +
            "AND rsi>0 AND signal=?;";

    static private final String SQL_TICKERS_SALE_SIGNALS =
            "SELECT stockquotes.*, langford.* " +
            "FROM stockquotes INNER JOIN langford ON refid=id " +
            "WHERE ticker=? " +
            "AND rsi >= ? " +
            "AND signal=?;";

    private static final String SQL_FIND_OBS_FOR_EXCHANGE = "SELECT * " +
                                                            "FROM V_TICKERS " +
                                                            "WHERE stockexchange=? AND date>=? AND rsi>0 AND rsi<=? AND volume>=? AND close>=? AND signal=? " +
                                                            "ORDER BY date DESC, stockexchange, ticker;";
    private static final String SQL_FIND_OSS_FOR_EXCHANGE = "SELECT * " +
                                                            "FROM v_tickers " +
                                                            "WHERE stockexchange=? AND rsi>=? AND volume>=? AND close>=? AND date>=? AND signal=? ORDER BY date DESC, stockexchange, ticker;";

    private static final String SQL_FIND_TICKERS_WITH_NON_INCREMENTAL_PERIODSEQUENCES = "SELECT DISTINCT ticker FROM stockquotes GROUP BY ticker, periodsequence HAVING count(periodsequence) > 1;";
    private static final String SQL_FIND_TICKERS_WITH_DUPLICATE_DATES = "SELECT DISTINCT ticker " +
                                                                        "FROM stockquotes " +
                                                                        "GROUP BY ticker, date HAVING count(date) > 1 " +
                                                                        "ORDER BY ticker;";
    private static final String SQL_SELECT_STOCKS_WITHIN_PERIODS =
            "SELECT STOCKQUOTES.*, LANGFORD.* " +
            "FROM STOCKQUOTES JOIN Langford ON StockQuotes.ID=Langford.REFID " +
            "WHERE TICKER=? AND PERIODSEQUENCE >= ? AND PERIODSEQUENCE <= ? " +
            "ORDER BY PERIODSEQUENCE;";


    //  brand new way!
    private final JdbcTemplate jdbcTemplate;
    private final QProperties properties;
    private final IStockQuoteService stockQuoteService;
    @Getter private final IWatchListService watchListService;

    @PostConstruct
    public void init() throws Exception {
        if (jdbcTemplate == null) throw new IllegalStateException("JDBC Template not set.");
        if (properties == null) throw new IllegalStateException("Properties not set.");
        if (stockQuoteService == null) throw new IllegalStateException("StockQuoteService not set.");
        if (watchListService == null) throw new IllegalStateException("WatchListService not set.");
    }

    public List<StockQuote> loadQuotes(Ticker pTicker, boolean pLoadVariations, Integer pNbQuotesBack) throws StockException {
        final StockQuoteLoadContext context = new StockQuoteLoadContext();
        context.setRowContainsLangford(true);
        context.setRowContainsVariations(pLoadVariations);

        if (pNbQuotesBack != null) {
            return jdbcTemplate.query(SQL_SELECT_ALL_QUOTES_FOR_TICKER_EXCHANGE_WITH_LIMIT,
                                      new LoadFullQuoteRowMapper(context),
                                      pTicker.toString(), pNbQuotesBack);
        } else {
            return jdbcTemplate.query(SQL_SELECT_ALL_QUOTES_FOR_TICKER_EXCHANGE,
                                      new LoadFullQuoteRowMapper(context),
                                      pTicker.toString());
        }
    }

    public int save(List<StockQuote> pStocks) throws StockException {
        for (StockQuote stockQuote : pStocks) {
            stockQuoteService.saveQuoteAndIndicators(stockQuote);
        }

        return pStocks.size();
    }

    public List<Ticker> findTickersForExchange(Ticker pExchange) throws StockException {
        return jdbcTemplate.query(SQL_TICKERS_FOR_EXCHANGE,
                                  new TickerOnlyRowMapper(),
                                  pExchange.toString());
    }

    public List<StockQuote> getHistory(Ticker pTicker, boolean pNewestToOldest) throws StockException {
        final StockQuoteLoadContext context = new StockQuoteLoadContext();
        context.setRowContainsLangford(true);
        context.setRowContainsVariations(true);

        return jdbcTemplate.query(pNewestToOldest ? SQL_GET_HISTORY_NEWEST_TO_OLDEST : SQL_GET_HISTORY_OLDEST_TO_NEWEST,
                                  new LoadFullQuoteRowMapper(context),
                                  pTicker.toString());
    }

    public Map<Ticker, UpdateInformation> getUpdateInformation() throws StockException {
        final List<UpdateInformation> updateInfos = jdbcTemplate.query(
                SQL_LOAD_UPDATE_INFORMATION,
                (rs, i) -> new UpdateInformation(
                        new Ticker(rs.getString("STOCKEXCHANGE").trim()),
                        new Ticker(rs.getString("TICKER").trim()),
                        rs.getInt("LASTSEQUENCE"),
                        new LocalDate(rs.getDate("LASTDATE").getTime())));

        val updates = new HashMap<Ticker, UpdateInformation>();

        for (UpdateInformation ui : updateInfos) {
            updates.put(ui.getTicker(), ui);
        }

        return updates;
    }

    public List<StockQuote> findObsSignals(Signal pObsSignal, final int pPeriodsBack, Integer pMaximumRsi) {
        final Integer maxRsi = (pMaximumRsi != null ? pMaximumRsi : new Integer(100));

        //  todo: SQL
        final String SQL =
                "SELECT * " +
                "FROM (stockquotes INNER JOIN langford ON refid=id) AS T " +
                "WHERE signal=? " +
                "   AND rsi<=? " +
                "   AND periodsequence > (SELECT (max(periodsequence) - ?) FROM stockquotes AS V WHERE T.TICKER=V.TICKER) " +
                "ORDER BY date DESC, stockexchange, ticker;";

        final StockQuoteLoadContext context = new StockQuoteLoadContext(true, false, false);
        return jdbcTemplate.query(SQL,
                                  new LoadFullQuoteRowMapper(context),
                                  pObsSignal.getSignal(),
                                  maxRsi,
                                  new Integer(pPeriodsBack));
    }

    public List<StockQuote> findOssSignals(Signal pOssSignal, final int pPeriodsBack, Integer pMinimumRsi) {
        final Integer minRsi = (pMinimumRsi != null ? pMinimumRsi : new Integer(0));

        final String SQL =
                "SELECT * " +
                "FROM (stockquotes INNER JOIN langford ON refid=id) AS T " +
                "WHERE signal=? " +
                "   AND rsi>=? AND rsi > 0" +
                "   AND periodsequence > (SELECT (max(periodsequence) - ?) FROM stockquotes AS V WHERE T.TICKER=V.TICKER) " +
                "ORDER BY date DESC, stockexchange, ticker;";

        final StockQuoteLoadContext context = new StockQuoteLoadContext(true, false, false);
        return jdbcTemplate.query(SQL,
                                  new LoadFullQuoteRowMapper(context),
                                  pOssSignal.getSignal(),
                                  minRsi,
                                  new Integer(pPeriodsBack));
    }

    public List<StockQuote> findObsSignals(Ticker pExchange, Float pMinimumPrice, Integer pMinimumVolume, Integer pMaximumRsi, LocalDate pFromDate, Signal pSignal) throws StockException {
        final StockQuoteLoadContext context = new StockQuoteLoadContext();
        context.setRowContainsLangford(true);
        context.setRowContainsVariations(true);

        return jdbcTemplate.query(SQL_FIND_OBS_FOR_EXCHANGE,
                                  new LoadFullQuoteRowMapper(context),
                                  pExchange.toString(),
                                  DateUtilities.toJavaSqlDate(pFromDate),
                                  pMaximumRsi,
                                  pMinimumVolume,
                                  pMinimumPrice,
                                  pSignal.getSignal());
    }

    public List<StockQuote> findOssSignals(Ticker pExchange, Float pMinimumPrice, Integer pMinimumVolume, Integer pMinimumRsi, LocalDate pFromDate, Signal pSignal) throws StockException {
        final StockQuoteLoadContext context = new StockQuoteLoadContext();
        context.setRowContainsLangford(true);
        context.setRowContainsVariations(true);

        return jdbcTemplate.query(SQL_FIND_OSS_FOR_EXCHANGE,
                                  new LoadFullQuoteRowMapper(context),
                                  pExchange.toString(),
                                  pMinimumRsi,
                                  pMinimumVolume,
                                  pMinimumPrice,
                                  DateUtilities.toJavaSqlDate(pFromDate),
                                  pSignal.getSignal());
    }

    public List<StockQuote> findAllObsSignals(Ticker pTicker, float pMaxRsi, Signal pObsSignal) throws StockException {
        final StockQuoteLoadContext context = new StockQuoteLoadContext();
        context.setRowContainsLangford(true);

        return jdbcTemplate.query(SQL_TICKERS_BUY_SIGNALS,
                                  new LoadFullQuoteRowMapper(context),
                                  pTicker.toString(), pMaxRsi, pObsSignal.toString());
    }

    public List<StockQuote> findAllOssSignals(Ticker pTicker, int pOssRsi, Signal pOssSignal) throws StockException {
        final StockQuoteLoadContext context = new StockQuoteLoadContext();
        context.setRowContainsLangford(true);

        return jdbcTemplate.query(SQL_TICKERS_SALE_SIGNALS,
                                  new LoadFullQuoteRowMapper(context),
                                  pTicker.toString(), pOssRsi, pOssSignal.toString());
    }

    public List<StockQuote> getLatestTickersInformation(Ticker pExchange) throws StockException {
        final StockQuoteLoadContext context = new StockQuoteLoadContext();
        context.setRowContainsLangford(true);

        return jdbcTemplate.query(SQL_EXCHANGE_SUMMARY_FOR_EXCHANGE,
                                  new LoadFullQuoteRowMapper(context),
                                  pExchange.toString(), pExchange.toString());
    }

    public List<StockQuote> findIncomingObs(int pManyDays, int pMaxRsi) throws StockException {
        final StockQuoteLoadContext context = new StockQuoteLoadContext();
        context.setRowContainsLangford(true);
        context.setRowContainsVariations(true);

        return jdbcTemplate.query(SQL_FIND_INCOMING_OBS,
                                  new LoadFullQuoteRowMapper(context),
                                  pManyDays, pMaxRsi);
    }

    public List<StockQuote> findIncomingOss(int pManyDays, int pMinRsi) throws StockException {
        final StockQuoteLoadContext context = new StockQuoteLoadContext();
        context.setRowContainsLangford(true);
        context.setRowContainsVariations(true);

        return jdbcTemplate.query(SQL_FIND_INCOMING_OSS,
                                  new LoadFullQuoteRowMapper(context),
                                  pManyDays, pMinRsi);
    }

    public List<StockQuote> findOverboughtQuotes(int pMinRsi) {
        final String SQL =
                "SELECT * " +
                "FROM (stockquotes INNER JOIN langford ON refid=id) AS T " +
                "WHERE rsi>=? AND periodsequence=(SELECT max(periodsequence) FROM stockquotes AS S WHERE S.ticker=T.ticker) " +
                "ORDER BY stockexchange, rsi DESC, ticker;";

        final StockQuoteLoadContext context = new StockQuoteLoadContext();
        context.setRowContainsLangford(true);

        return jdbcTemplate.query(SQL,
                                  new LoadFullQuoteRowMapper(context),
                                  pMinRsi);
    }

    public List<StockQuote> findOverboughtQuotes(Ticker pExchange, float pMinimumPrice, int pMinimumVolume, int pMinRsi) throws StockException {
        final StockQuoteLoadContext context = new StockQuoteLoadContext();
        context.setRowContainsLangford(true);
        context.setRowContainsVariations(true);

        return jdbcTemplate.query(SQL_FIND_OVERBOUGHT_STOCKS,
                                  new LoadFullQuoteRowMapper(context),
                                  pExchange.toString(),
                                  pMinimumPrice,
                                  pMinimumVolume,
                                  pMinRsi,
                                  pExchange.toString());
    }

    public List<StockQuote> findOversoldQuotes(int pMaxRsi) {
//        final String SQL =
//                "select * " +
//                "from (stockquotes inner join langford on refid=id) AS T " +
//                "where rsi<=? and rsi>0 and date=(select max(date) from stockquotes AS S where S.stockexchange=T.stockexchange) " +
//                "order by stockexchange, rsi, ticker;";
        final String SQL =
                "SELECT * " +
                "FROM (stockquotes INNER JOIN langford ON refid=id) AS T " +
                "WHERE rsi <= ? AND rsi>0 " +
                "   AND periodsequence=(SELECT max(periodsequence) FROM stockquotes AS S WHERE s.ticker=T.ticker) " +
                "ORDER BY stockexchange, rsi, ticker;";

        final StockQuoteLoadContext context = new StockQuoteLoadContext();
        context.setRowContainsLangford(true);

        return jdbcTemplate.query(SQL, new LoadFullQuoteRowMapper(context), pMaxRsi);
    }

    public List<StockQuote> findOversoldQuotes(Ticker pExchange, float pMinimumPrice, int pMinimumVolume, int pMaxRsi) throws StockException {
        final StockQuoteLoadContext context = new StockQuoteLoadContext();
        context.setRowContainsLangford(true);
        context.setRowContainsVariations(true);

        return jdbcTemplate.query(SQL_FIND_OVERSOLD_STOCKS,
                                  new LoadFullQuoteRowMapper(context),
                                  pExchange.toString(),
                                  pMinimumPrice,
                                  pMinimumVolume,
                                  pMaxRsi,
                                  pExchange.toString());
    }

    public List<StockQuote> findLatestSignals(Ticker pExchange) throws StockException {
        final StockQuoteLoadContext context = new StockQuoteLoadContext(true, false, false);
        return jdbcTemplate.query(SQL_FIND_LATEST_SIGNALS_FOR_EXCHANGE,
                                  new LoadFullQuoteRowMapper(context),
                                  pExchange.toString());
    }

    public List<StockQuote> findLastSignals(Ticker pExchange, Signal pWantedSignal) throws StockException {
        final StockQuoteLoadContext context = new StockQuoteLoadContext(true, false, false);
        return jdbcTemplate.query(SQL_FIND_LAST_SIGNALS_FOR_EXCHANGE,
                                  new LoadFullQuoteRowMapper(context),
                                  pExchange.toString(), pWantedSignal.toString());
    }

    @Override
    public Collection<StockQuote> getPreviousQuotesIncludingMe(StockQuote pStockQuote, int pNumberOfQuotes, StockQuoteNavigator pNavigator) throws StockException {
        //  in a cache first, use it.
        List<StockQuote> previousStocksIncludingMe = pStockQuote.getPreviousStocksIncludingMe();
        if (previousStocksIncludingMe != null) {
            //  make sure it's appropriate size.
            if (previousStocksIncludingMe.size() == pNumberOfQuotes) {
                return previousStocksIncludingMe;
            } else if (previousStocksIncludingMe.size() > pNumberOfQuotes) {
                final int size = previousStocksIncludingMe.size();
                final StockQuoteList sublist = new StockQuoteList();
                for (int i = size - pNumberOfQuotes; i < size; i++) {
                    sublist.add(previousStocksIncludingMe.get(i));
                }
                return sublist;
            }
        }

        if (pNavigator != null && pNavigator.supportsGetPreviousQuotes()) {
            previousStocksIncludingMe = pNavigator.getPreviousQuotes(pStockQuote, pNumberOfQuotes, true);
        } else {
            previousStocksIncludingMe = getPreviousQuotes(pStockQuote, pNumberOfQuotes, true);
        }


        pStockQuote.setPreviousStocksIncludingMe(previousStocksIncludingMe);

        return previousStocksIncludingMe;
    }

    private List<StockQuote> getPreviousQuotes(StockQuote pQuote, int pNumberOfStocks, boolean pIncludeThisQuote) {
        final int sequence = pQuote.getPeriodSequence();

        final int fromPeriod;

        if (sequence >= pNumberOfStocks) {
            fromPeriod = (pIncludeThisQuote ? sequence - pNumberOfStocks + 1 : sequence - pNumberOfStocks);
        } else {
            fromPeriod = 0;
        }

        final int toPeriod = pQuote.getPeriodSequence() - 1;

        final List<StockQuote> stockQuotes = jdbcTemplate.query(SQL_SELECT_STOCKS_WITHIN_PERIODS,
                                                                new LoadFullQuoteRowMapper(new StockQuoteLoadContext()),
                                                                pQuote.getTicker().toString(),
                                                                fromPeriod,
                                                                toPeriod);

        if (pIncludeThisQuote) stockQuotes.add(pQuote);

        return stockQuotes;
    }

    public List<ValidationMessage> validate() {
        final List<ValidationMessage> validationMessages = new ArrayList<ValidationMessage>();

        validateNonIncrementalPeriodSequences(validationMessages);
        validateDuplicateDates(validationMessages);

        final List<String> exchanges = jdbcTemplate.query("SELECT DISTINCT stockexchange FROM stockquotes ORDER BY stockexchange;",

                                                          new StringRowMapper("stockexchange"));
        for (final String s : exchanges) {
            final YearMonthDay maxDate = jdbcTemplate.queryForObject("SELECT max(date) FROM stockquotes WHERE stockexchange=?;",
                                                                     new YearMonthDayByTimeMillisRowMapper(),
                                                                     s);
            final List<Ticker> tickersMissingUpdates = jdbcTemplate.query("SELECT DISTINCT ticker FROM stockquotes WHERE stockexchange=? GROUP BY ticker HAVING max(date) < ?;",
                                                                          new TickerOnlyRowMapper("ticker"),
                                                                          s, DateUtilities.toJavaSqlDate(maxDate));
            for (final Ticker t : tickersMissingUpdates) {
                validationMessages.add(new ValidationMessage("Ticker " + t + " is missing update information.", "Update ticker", ValidationMessage.Level.WARNING));
            }
        }

        return validationMessages;
    }

    private void validateDuplicateDates(final List<ValidationMessage> pValidationMessages) {
        //  tickers with duplicate dates.
        final List<Ticker> tickersWithDuplicateDate = jdbcTemplate.query(
                SQL_FIND_TICKERS_WITH_DUPLICATE_DATES,
                new TickerOnlyRowMapper());
        for (Ticker t : tickersWithDuplicateDate) {
            pValidationMessages.add(new ValidationMessage("This ticker has quotes with duplicate dates: " + t,
                                                          "YOu should erase it and reimport it.",
                                                          ValidationMessage.Level.ERROR));
        }
    }

    private void validateNonIncrementalPeriodSequences(final List<ValidationMessage> pValidationMessages) {
        //  tickers with non incremental period sequences
        final List<Ticker> tickersWithNonIncrementalPeriodSequences = jdbcTemplate.query(
                SQL_FIND_TICKERS_WITH_NON_INCREMENTAL_PERIODSEQUENCES,
                new TickerOnlyRowMapper());
        for (Ticker t : tickersWithNonIncrementalPeriodSequences) {
            pValidationMessages.add(new ValidationMessage("This ticker has non-incremental period sequences: " + t,
                                                          "You should erase it and reimport it.",
                                                          ValidationMessage.Level.ERROR));
        }
    }


    public List<BasicStockInfo> findTickerByNames(String pNamePart) {
        //  todo: SQL
        final String SQL = "SELECT stockexchange, ticker, name FROM Names WHERE name ILIKE '%XXX%' ORDER BY stockexchange, name;".replaceAll("XXX", pNamePart);
        return jdbcTemplate.query(SQL, (rs, i) -> new BasicStockInfo(new Ticker(rs.getString("stockexchange")),
                                                                     new Ticker(rs.getString("ticker")),
                                                                     rs.getString("name"),
                                                                     new Price(0), 0));
    }

    public List<StockQuote> loadQuotes(List<Ticker> pTickers) {
        final List<StockQuote> tickerQuotes = new ArrayList<StockQuote>();
        for (Ticker t : pTickers) {
            final StockQuote latestQuote = stockQuoteService.getLatestQuote(t);
            if (latestQuote != null) {
                tickerQuotes.add(latestQuote);
            } else {
                LOG.info("No quote found for ticker " + t + ".");
            }
        }

        return tickerQuotes;
    }

    public void outputAlerts(final Collection<Alert> pAlerts, final Output pOutput, final RowFormat<List<StockQuote>, StockQuote> pFormat)
            throws FormatException, StockRuntimeException {
        for (Iterator iterator = pAlerts.iterator(); iterator.hasNext(); ) {
            Alert alert = (Alert) iterator.next();

            if (alert.getAlertAction() != null) {
                final IAlertAction action = alert.getAlertAction();
                action.execute(alert, this, pOutput, pFormat);
            } else {
                throw new StockRuntimeException("Alert " + alert.getAlertName() + " has no action!");
            }
        }
    }
}
