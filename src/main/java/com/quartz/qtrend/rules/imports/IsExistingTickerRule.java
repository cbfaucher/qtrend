/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.rules.imports;

import com.quartz.qtrend.QTrendBeanNames;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.rules.IRule;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * It loads the existing tickers for the current exchange,
 * which are automatically included.
 *
 * @author Christian
 * @since Quartz...
 */
public class IsExistingTickerRule implements IRule
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(IsExistingTickerRule.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final private Ticker   exchangeName;
    final private StockQuoteListService stockQuotesService;


    private Set<Ticker> existingTickers = new HashSet<Ticker>();

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public IsExistingTickerRule(Ticker pExchangeName)
    {
        super();

        exchangeName = pExchangeName;
        stockQuotesService = QTrendBeanNames.STOCK_QUOTE_LIST_SERVICE.getBean();
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    //  for unit tests!
    void setExistingTickers(Set<Ticker> pExistingTickers)
    {
        existingTickers = pExistingTickers;
    }

    public boolean accept(StockQuote pQuote)
    {
        try
        {
            loadTickersIfNeeded();

            assert existingTickers != null;

            final boolean result = existingTickers.contains(pQuote.getTicker());
            if (result)
            {
                LOG.info("Ticker " + pQuote.getTicker() + "@" + pQuote.getStockExchange() + " already existing.  UPDATED");
            }
            return result;
        }
        catch (StockException e)
        {
            LOG.error("Could not retrieve list of tickers for " + pQuote.getStockExchange() , e);

            return false;
        }
    }

    private void loadTickersIfNeeded() throws StockException
    {
        if (existingTickers == null)
        {
            synchronized (this)
            {
                if (existingTickers == null)
                {
                    //  synchronized the updates
                    LOG.info("Thread " + Thread.currentThread().getName() + ": Loading Tickers for exchange: " + exchangeName);
                    final List<Ticker> tickersForExchange = stockQuotesService.findTickersForExchange(exchangeName);
                    existingTickers.clear();
                    existingTickers.addAll(tickersForExchange);
                }
            }
        }
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
