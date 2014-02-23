/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.rules.imports;

import com.quartz.qtrend.rules.IRule;
import com.quartz.qtrend.rules.ITickerRule;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;

import java.util.HashSet;
import java.util.Set;

/**
 * Includes specified tickers
 *
 * @author Christian
 * @since Quartz...
 */
public class IncludeTickersRule implements ITickerRule, IRule
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(IncludeTickersRule.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private boolean all;
    final private Set<Ticker> tickersToInclude = new HashSet<Ticker>();

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public IncludeTickersRule()
    {
        this(true);
    }

    public IncludeTickersRule(boolean pAll)
    {
        all = pAll;
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setAll(boolean pAll)
    {
        all = pAll;

        if (all == true) tickersToInclude.clear();
    }

    public boolean accept(StockQuote pQuote)
    {
        if (pQuote == null)
        {
            LOG.warn("Unknown ticker:  REFUSED!");
            return false;
        }

        //  if all tickers included, then return true
        if (all == true)
        {
            LOG.info("ALL tickers include.  ACCEPTED");
            return true;
        }

        //  otherwise must be in set
        final Ticker ticker = pQuote.getTicker();
        final boolean b = tickersToInclude.contains(ticker);
        if (b) LOG.info("Ticker " + ticker + " is ACCEPTED");
        return b;
    }

    public void addTicker(String pTicker)
    {
        if (pTicker == null) return;

        all = false;

        tickersToInclude.add(new Ticker(pTicker));
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
