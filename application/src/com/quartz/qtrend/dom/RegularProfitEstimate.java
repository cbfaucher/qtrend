/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom;



/**
 * Profit estimation fo buy low/sell high
 *
 * @author Christian
 * @since Quartz...
 */
public class RegularProfitEstimate extends ProfitEstimate
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public RegularProfitEstimate(StockQuote pObs, StockQuote pOss)
    {
        super(pObs, pOss);
    }

    protected float calculatePercentProfit()
    {
        return (profit / obsPrice) * 100;
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    ///////////////////////////////////////
    ////    INNER CLASSES
}
