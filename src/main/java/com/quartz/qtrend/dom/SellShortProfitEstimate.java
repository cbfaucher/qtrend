/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom;



/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class SellShortProfitEstimate extends ProfitEstimate
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public SellShortProfitEstimate(StockQuote pOss, StockQuote pObs)
    {
        super(pObs, pOss);
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    protected float calculatePercentProfit()
    {
        return (profit / ossPrice) * 100;
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
