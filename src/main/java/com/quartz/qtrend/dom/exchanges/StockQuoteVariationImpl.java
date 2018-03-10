/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.exchanges;

import com.quartz.qtrend.dom.AbstractStockQuoteImpl;


/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class StockQuoteVariationImpl extends AbstractStockQuoteImpl implements StockQuoteVariation
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final private float closeVariation1day;
    final private float closeVariation3days;
    final private float closeVariation7days;

    final private float diffEma7;
    final private float diffEma28;
    final private float diffEma56;
    final private float diffEma112;

    final private float rsi;
    final private String langfordSignal;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public StockQuoteVariationImpl(String pStockExchange, String pTicker, float pCloseVariation1, float pCloseVariation3, float pCloseVariation7, float pDiffEma7, float pDiffEma28, float pDiffEma56, float pDiffEma112, float pRsi, String pSignal)
    {
        super(pStockExchange, pTicker);

        closeVariation1day = pCloseVariation1;
        closeVariation3days = pCloseVariation3;
        closeVariation7days = pCloseVariation7;

        diffEma7 = pDiffEma7;
        diffEma28 = pDiffEma28;
        diffEma56 = pDiffEma56;
        diffEma112 = pDiffEma112;

        rsi = pRsi;
        langfordSignal = pSignal;
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public float getCloseVariation1day()
    {
        return closeVariation1day;
    }

    public float getCloseVariation3days()
    {
        return closeVariation3days;
    }

    public float getCloseVariation7days()
    {
        return closeVariation7days;
    }

    public float getDiffEma7()
    {
        return diffEma7;
    }

    public float getDiffEma28()
    {
        return diffEma28;
    }

    public float getDiffEma56()
    {
        return diffEma56;
    }

    public float getDiffEma112()
    {
        return diffEma112;
    }

    public float getRsi()
    {
        return rsi;
    }

    public String getLangfordSignal()
    {
        return langfordSignal;
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
