/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.rules.imports;

import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.rules.IRule;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class EnoughVolumeRule implements IRule
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(EnoughVolumeRule.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private long minimumVolume = 0l;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public EnoughVolumeRule()
    {
        this(0l);
    }

    public EnoughVolumeRule(long pMinimumVolume)
    {
        super();
        minimumVolume = pMinimumVolume;
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public long getMinimumVolume()
    {
        return minimumVolume;
    }

    public void setMinimumVolume(long pMinimumVolume)
    {
        minimumVolume = pMinimumVolume;
    }

    public boolean accept(StockQuote pQuote)
    {
        final boolean v = minimumVolume <= pQuote.getVolume();

        if (v == false)
        {
            LOG.info(pQuote.getTicker() + "@" + pQuote.getStockExchange() + " below minimum volume: IGNORED");
        }

        return v;
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
