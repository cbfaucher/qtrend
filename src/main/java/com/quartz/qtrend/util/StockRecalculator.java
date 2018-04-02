/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.util;

import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.dom.services.StockQuoteService;
import com.quartz.qutilities.util.Output;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * @deprecated Move this as a sercice method in StockQuoteListService.
 */
public class StockRecalculator
{
    final private StockQuoteListService stockQuotesService;
    final private StockQuoteService stockQuoteService;
    @Getter @Setter private Ticker ticker = null;

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

    public void recalculate(Output pOutput) throws StockException
    {
        //  get all stock quotes by date
        final List<StockQuote> stocks = stockQuotesService.loadQuotes(ticker, false, null);

        //  resequence, recalculate
        int i = 0;
        for (StockQuote s : stocks)
        {
            s.setPeriodSequence(++i);

            s.setStockQuoteNavigator(new SimpleStockQuoteNavigator(stocks));

            stockQuoteService.recalculate(s);
        }

        //  saveQuoteOnly all stock quotes
        final int nbSaved = stockQuotesService.save(stocks);

        pOutput.writeln(ticker +  " resequenced (" + nbSaved + " quotes).");
    }
}
