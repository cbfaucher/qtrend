/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend;

import com.quartz.qtrend.dom.*;
import com.quartz.qtrend.dom.helpers.Ticker;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class SimpleStockDAO<R> 
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final private Map<TickerKey, Integer> tickerSequences = new HashMap<TickerKey, Integer>();
    final public List<StockQuoteImpl> stocks = new ArrayList<StockQuoteImpl>();
    public static final int UNSAVED_PK = -1;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public SimpleStockDAO()
    {
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS


    public StockQuoteImpl getStockByPeriodSequence(int pPeriod)
    {
        for (StockQuoteImpl s : stocks)
        {
            if (s.getPeriodSequence() == pPeriod) return s;
        }

        return null;
    }

    /**
     * Does nothing.
     */
    public long save(StockQuote pStock) throws StockException
    {
        stocks.add((StockQuoteImpl) pStock);
        return stocks.size();
    }

    public int save(StockQuoteList pStocks) throws StockException
    {
        return 0;
    }


    public List<BasicStockInfo> findTickersWithDuplicateDates() throws StockException
    {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    ///////////////////////////////////////
    ////    INNER CLASSES

    ///////////////////////////////////////
    ////    INNER CLASSES

    static class TickerKey
    {
        final private Ticker exchange;
        final private Ticker ticker;

        TickerKey(Ticker pExchange, Ticker pTicker)
        {
            exchange = pExchange;
            ticker = pTicker;
        }

        public boolean equals(Object o)
        {
            if (this == o) return true;
            if (!(o instanceof TickerKey)) return false;

            final TickerKey tickerKey = (TickerKey) o;

            if (!exchange.equals(tickerKey.exchange)) return false;
            if (!ticker.equals(tickerKey.ticker)) return false;

            return true;
        }

        public int hashCode()
        {
            int result;
            result = exchange.hashCode();
            result = 29 * result + ticker.hashCode();
            return result;
        }


        public String toString()
        {
            return exchange + "." + ticker;
        }
    }
}
