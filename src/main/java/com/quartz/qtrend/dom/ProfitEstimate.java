/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom;

import org.joda.time.LocalDate;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public abstract class ProfitEstimate
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    protected final StockQuote obs;
    protected final StockQuote oss;
    protected final float obsPrice;
    protected final float ossPrice;
    protected final float profit;
    protected final float percentProfit;
    protected final int periodLength;


    ///////////////////////////////////////
    ////    CONSTRUCTORS

    protected ProfitEstimate(StockQuote pObs, StockQuote pOss)
    {
        obs = pObs;
        oss = pOss;

        periodLength = Math.abs(oss.getPeriodSequence() - obs.getPeriodSequence());
        ossPrice = oss.getClose().price;
        obsPrice = obs.getClose().price;

        profit = calculateProfit();
        percentProfit = calculatePercentProfit();
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    abstract protected float calculatePercentProfit();

    final private float calculateProfit()
    {
        return ossPrice - obsPrice;
    }

    public StockQuote getObs()
    {
        return obs;
    }

    public StockQuote getOss()
    {
        return oss;
    }

    public LocalDate getObsDate()
    {
        return obs.getDate();
    }

    public LocalDate getOssDate()
    {
        return oss.getDate();
    }

    public float getObsPrice()
    {
        return obsPrice;
    }

    public float getOssPrice()
    {
        return ossPrice;
    }

    public float getProfit()
    {
        return profit;
    }

    public float getPercentProfit()
    {
        return percentProfit;
    }

    public int getPeriodLength()
    {
        return periodLength;
    }
}
