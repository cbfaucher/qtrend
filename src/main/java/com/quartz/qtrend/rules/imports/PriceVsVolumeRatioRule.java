/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
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
public class PriceVsVolumeRatioRule implements IRule
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(PriceVsVolumeRatioRule.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private int   capitalInvested;
    private float threshold;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public PriceVsVolumeRatioRule()
    {
    }

    public int getCapitalInvested()
    {
        return capitalInvested;
    }

    public void setCapitalInvested(int pCapitalInvested)
    {
        capitalInvested = pCapitalInvested;
    }

    public float getThreshold()
    {
        return threshold;
    }

    public void setThreshold(float pThreshold)
    {
        threshold = pThreshold;
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public boolean accept(StockQuote pQuote)
    {
        //  calculate the current ratio
        final float volumeBought = capitalInvested / pQuote.getClose().price;
        final float actualRatio = volumeBought / pQuote.getVolume();

        LOG.info(pQuote.getTicker() + ": " + pQuote.getClose() + "$ / Vol.=" + pQuote.getVolume() + " / Actual Ratio / Ratio=" + actualRatio + " / " + threshold);

        return actualRatio <= threshold;
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
