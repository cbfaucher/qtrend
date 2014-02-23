/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.util;

import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.StockQuoteNavigator;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.dom.services.StockQuoteService;
import com.quartz.qutilities.util.Output;

import java.util.ArrayList;
import java.util.List;

/**
 * @deprecated Move this as a sercice method in StockQuoteListService.
 */
public class StockRecalculator
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final private StockQuoteListService stockQuotesService;
    final private StockQuoteService stockQuoteService;
    private Ticker ticker = null;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public StockRecalculator(StockQuoteListService pStockQuotesService, StockQuoteService pStockQuoteService, Ticker pTicker)
    {
        stockQuotesService = pStockQuotesService;
        stockQuoteService = pStockQuoteService;
        ticker = pTicker;
    }

    public StockRecalculator(StockQuoteListService pStockQuotesService, StockQuoteService pStockQuoteService)
    {
        stockQuotesService = pStockQuotesService;
        stockQuoteService = pStockQuoteService;
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public Ticker getTicker()
    {
        return ticker;
    }

    public void setTicker(Ticker pTicker)
    {
        ticker = pTicker;
    }

    public void recalculate(Output pOutput) throws StockException
    {
        //  get all stock quotes by date
        final List<StockQuote> stocks = stockQuotesService.loadQuotes(ticker, false, null);

        //  resequence, recalculate
        int i = 0;
        for (StockQuote s : stocks)
        {
            s.setPeriodSequence(++i);

            s.setStockQuoteNavigator(new MyNavigator(stocks));

            stockQuoteService.recalculate(s);
        }

        //  saveQuoteOnly all stock quotes
        final int nbSaved = stockQuotesService.save(stocks);

        pOutput.writeln(ticker +  " resequenced (" + nbSaved + " quotes).");
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
    public static class MyNavigator implements StockQuoteNavigator
    {
        final private java.util.List<StockQuote> quotes;

        public MyNavigator(java.util.List<StockQuote> pQuotes)
        {
            quotes = pQuotes;
        }

        public boolean supportsGetPreviousQuote()
        {
            return true;
        }

        public boolean supportsGetPreviousQuotes()
        {
            return true;
        }

        public StockQuote
                getPreviousQuote(StockQuote pThisStock) throws StockException
        {
            final int index = pThisStock.getPeriodSequence() - 1;
            return (index > 0 ? quotes.get(index - 1) : null);
        }

        public List<StockQuote> getPreviousQuotes(StockQuote pThisQuote, int pNbPrevious, boolean pIncludeMe) throws StockException
        {
            final int index = pThisQuote.getPeriodSequence() - 1;
            final java.util.List<StockQuote> previousQuotes = new ArrayList<StockQuote>();

            if (index == 0)
            {
                if (pIncludeMe) previousQuotes.add(pThisQuote);
                return previousQuotes;
            }

            final int begin;
            final int end;

            begin = (index < pNbPrevious
                    ? 0
                    : (pIncludeMe ? index - pNbPrevious + 1 : index - pNbPrevious));
            end = (pIncludeMe ? index : index - 1);

            for (int i = begin; i <= end; i++)
            {
                previousQuotes.add(quotes.get(i));
            }

            return previousQuotes;
        }
    }
}
