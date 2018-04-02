/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend;

import com.quartz.qtrend.dom.BasicStockInfo;
import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.StockQuoteList;
import com.quartz.qtrend.dom.dao.IStockQuoteDAO;
import com.quartz.qtrend.dom.helpers.Ticker;
import lombok.AccessLevel;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import java.util.ArrayList;
import java.util.List;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
@NoArgsConstructor
public class SimpleStockDAO implements IStockQuoteDAO
{
    final public List<StockQuote> stocks = new ArrayList<>();
    public static final int UNSAVED_PK = -1;

    public StockQuote getStockByPeriodSequence(int pPeriod)
    {
        for (StockQuote s : stocks)
        {
            if (s.getPeriodSequence() == pPeriod) return s;
        }

        return null;
    }

    public StockQuote insert(StockQuote pStockQuote) {
        try {
            save(pStockQuote);
            return pStockQuote;
        } catch (StockException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * Does nothing.
     */
    public long save(StockQuote pStock) throws StockException
    {
        stocks.add(pStock);
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

    @EqualsAndHashCode
    @RequiredArgsConstructor(access = AccessLevel.PACKAGE)
    static class TickerKey
    {
        final private Ticker exchange;
        final private Ticker ticker;

        public String toString()
        {
            return exchange + "." + ticker;
        }
    }
}
