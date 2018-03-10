/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.rules.imports;

import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.rules.IRule;
import com.quartz.qtrend.rules.ITickerRule;

import java.util.HashSet;
import java.util.Set;

/**
 * Includes specified tickers
 *
 * @author Christian
 * @since Quartz...
 */
public class ExcludeTickersRule implements IRule, ITickerRule
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private boolean all = false;
    final private Set<Ticker> tickersToExclude = new HashSet<Ticker>();

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public ExcludeTickersRule()
    {
        super();
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setAll(boolean pAll)
    {
        all = pAll;

        if (all == true) tickersToExclude.clear();
    }

    public boolean accept(StockQuote pQuote)
    {
        if (pQuote == null) return false;

        final Ticker ticker = pQuote.getTicker();

        //  if all tickers excluded, then return true
        if (all == true) return false;

        //  if in set, then refuse
        return !tickersToExclude.contains(ticker);
    }

    public void addTicker(String pTicker)
    {
        if (pTicker == null) return;

        all = false;

        tickersToExclude.add(new Ticker(pTicker));
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
