/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.services;

import com.quartz.qtrend.dom.*;
import com.quartz.qtrend.dom.aroon.services.AroonService;
import com.quartz.qtrend.dom.dao.StockQuoteDAO;
import com.quartz.qtrend.dom.dao.StockQuoteLoadContext;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.langford.LangfordDataImpl;
import com.quartz.qtrend.dom.langford.services.ILangfordDataService;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.spring.transactions.QTransactionCallback;
import com.quartz.qutilities.spring.transactions.QTransactionTemplate;
import com.quartz.qutilities.util.DateUtilities;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.val;
import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
@NoArgsConstructor
@Component("QTrend.StockQuoteService")
public class StockQuoteService implements IStockQuoteService {
    static private final ILog LOG = LogManager.getLogger(StockQuoteService.class);

    //  todo: SQL
    private static final String SQL_GET_PREVIOUS_STOCK =
            "SELECT * " +
            "FROM STOCKQUOTES JOIN Langford ON StockQuotes.ID=Langford.REFID " +
            "WHERE TICKER=? AND PERIODSEQUENCE=?;";

    @Autowired private StockQuoteDAO stockQuoteDao;
    @Autowired private ILangfordDataService langfordDataService;
    @Autowired private AroonService aroonService;
    @Autowired private JdbcTemplate jdbcTemplate;
    @Autowired private QTransactionTemplate transactionTemplate;

    public int deleteTicker(Ticker pTicker) throws StockException {
        return jdbcTemplate.update("DELETE FROM stockquotes WHERE ticker=?;",
                                   pTicker.toString());
    }

    public void recalculate(StockQuote pStockQuote) throws StockException {
        calculatePriceDifference(pStockQuote);

        if (pStockQuote.hasLangfordData() == false) pStockQuote.setLangfordData(new LangfordDataImpl(pStockQuote));
        langfordDataService.calculate(pStockQuote.getLangfordData());
        calculateAverageVolume(pStockQuote);

        pStockQuote.setAroonShortTerm(aroonService.create(pStockQuote, 7));
        pStockQuote.setAroonLongTerm(aroonService.create(pStockQuote, 28));
    }

    public StockQuote load(ResultSet pResultSet, StockQuoteLoadContext pContext)
            throws StockException {
        try {
            return new LoadFullQuoteRowMapper(pContext).mapRow(pResultSet, 1);
        } catch (SQLException e) {
            throw new StockException(e);
        }
    }

    private void calculateAverageVolume(StockQuote pStockQuote) throws StockException {
        //       if (periodSequence < 1) throw new StockException("Invalid period sequence: " + periodSequence);

        val previousQuote = getPreviousQuote(pStockQuote);

        if (previousQuote == null) {
            //  if no pervious quote, this means this quote is the first.
            assert pStockQuote.getPeriodSequence() < 1;

            pStockQuote.setAverageVolume(pStockQuote.getVolume());
        } else {

            val previousPeriodSequence = previousQuote.getPeriodSequence();

            val divider = (previousPeriodSequence < 29 ? previousPeriodSequence : 29);

            long total = previousQuote.getAverageVolume() * divider;
            total += pStockQuote.getVolume();
            pStockQuote.setAverageVolume(total / (divider + 1));
        }


//        final Collection<StockQuote> previousStocks = getPreviousQuotesIncludingMe(AVG_VOLUME_PERIODS);
//
//        long totalVolume = 0;
//        for (StockQuote s : previousStocks)
//        {
//            totalVolume += s.getVolume();
//        }
//
//        averageVolume = (totalVolume / AVG_VOLUME_PERIODS);
    }

    public void calculatePriceDifference(StockQuote pStockQuote) throws StockException {
        val previous = getPreviousQuote(pStockQuote);
        if (previous == null) {
            pStockQuote.setPriceDifference(0.0f);
            return;
        }

        pStockQuote.setPriceDifference(pStockQuote.getClose().price - previous.getClose().price);
    }

    @Override
    public void saveQuoteAndIndicators(final StockQuote pStockQuote) throws StockException {
        transactionTemplate.execute((QTransactionCallback<Integer>) status -> {
            final boolean isInsert = stockQuoteDao.saveQuoteOnly(pStockQuote);

            //  langford
            if (pStockQuote.hasLangfordData()) {
                langfordDataService.saveLangfordDataOnly(pStockQuote, isInsert);
            } else {
                //  failure on insert if langford not calculated
                if (isInsert) throw new StockException("Inserting new Quote without Langford data present!");
            }

            //  aroon short & long terms
            if (pStockQuote.hasAroonShortTerm()) {
                aroonService.save(pStockQuote.getAroonShortTerm());
            } else {
                //  failure on insert if no aroon short term
                if (isInsert) throw new StockException("Inserting a new Quote without Aroon short term.");
            }

            if (pStockQuote.hasAroonLongTerm()) {
                aroonService.save(pStockQuote.getAroonLongTerm());
            } else {
                //  failure on insert if no aroon long term
                if (isInsert) throw new StockException("Inserting a new Quote without Aroon long term.");
            }

            return 1;
        });
    }

    private StockQuote getPreviousQuote(StockQuote pStockQuote, StockQuoteNavigator pNavigator) throws StockException {
        //  first if previous is set in stock quote.  If yes, use it.
        StockQuote previous = pStockQuote.getPreviousStockQuote();
        if (previous != null) return previous;

        if (pNavigator != null && pNavigator.supportsGetPreviousQuote()) {
            previous = pNavigator.getPreviousQuote(pStockQuote);
        } else {
            try {
                final StockQuoteLoadContext context = new StockQuoteLoadContext();
                context.setRowContainsLangford(true);

                return jdbcTemplate.queryForObject(SQL_GET_PREVIOUS_STOCK,
                                                   new LoadFullQuoteRowMapper(context),
                                                   pStockQuote.getTicker().toString(),
                                                   pStockQuote.getPeriodSequence() - 1);
            } catch (IncorrectResultSizeDataAccessException e) {
                //  find a better way to detect no previous quote than an exception...
                return null;
            }
        }

        pStockQuote.setPreviousStockQuote(previous);

        return previous;
    }

    @Override
    public StockQuote getPreviousQuote(StockQuote pStockQuote) throws StockException {
        return getPreviousQuote(pStockQuote, pStockQuote.getStockQuoteNavigator());
    }

    @Override
    public StockQuote getLatestQuote(final Ticker pTicker) {
        //  todo: SQL
        final String SQL =
                "SELECT stockquotes.*, langford.* " +
                "FROM   stockquotes " +
                "       INNER JOIN " +
                "       langford " +
                "       ON refid=id " +
                "WHERE ticker=? " +
                "AND date=(SELECT max(date) FROM stockquotes WHERE ticker=?);";

        final StockQuoteLoadContext context = new StockQuoteLoadContext(true, false, false);

        return transactionTemplate.execute((QTransactionCallback<StockQuote>) status -> {
            final List<StockQuote> info = jdbcTemplate.query(SQL,
                                                             new LoadFullQuoteRowMapper(context),
                                                             pTicker.toString(), pTicker.toString());
            if (info.isEmpty()) return null;
            if (info.size() == 1) return info.get(0);
            throw new StockException("Many records found for latest, for ticker " + pTicker);
        });
    }

    public String getTickerName(Ticker pTicker) {
        if (pTicker == null) return null;

        try {
            return jdbcTemplate.queryForObject("SELECT name FROM names WHERE ticker=?;", String.class, pTicker.toString().replaceAll("/", "."));
        } catch (EmptyResultDataAccessException e) {
            return pTicker.toString();
        }
    }

    private Map<Ticker, FullTickerName> loadTickerNames() {
        //  todo: SQL
        val loaded = jdbcTemplate.query("SELECT stockexchange,ticker, name FROM Names;",
                                        new FullTickerNameRowMapper());

        val tickerNames = new HashMap<Ticker, FullTickerName>();

        for (final FullTickerName n : loaded) {
            tickerNames.put(n.ticker, n);
        }

        return tickerNames;
    }

    public void saveTickerNames(Map<Ticker, FullTickerName> pNames) {
        val currentNames = loadTickerNames();

        //  update names
        currentNames.putAll(pNames);

        transactionTemplate.execute(new TransactionCallbackWithoutResult() {
            protected void doInTransactionWithoutResult(TransactionStatus status) {
                //  delete current names
                jdbcTemplate.update("DELETE FROM Names;");

                for (FullTickerName fullTickerName : currentNames.values()) {
                    jdbcTemplate.update("INSERT INTO Names (stockexchange,ticker, name) VALUES (?, ?, ?);",
                                        fullTickerName.exchange.toString(),
                                        fullTickerName.ticker.toString(),
                                        fullTickerName.name);
                }
            }
        });
    }

    public void deleteQuote(Ticker pTicker, LocalDate pEndDate) {
        if (jdbcTemplate.update("DELETE FROM stockquotes WHERE ticker=? AND date=?;", pTicker.toString(), DateUtilities.toJavaSqlDate(pEndDate)) != 1) {
            LOG.warn("No quote found for ticker " + pTicker + " on " + pEndDate);
        }
    }
}
