/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.exchanges;

import com.quartz.qtrend.dom.AbstractStockQuote;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public interface StockQuoteVariation extends AbstractStockQuote
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    float getCloseVariation1day();
    float getCloseVariation3days();
    float getCloseVariation7days();

    float getDiffEma7();

    float getDiffEma28();

    float getDiffEma56();

    float getDiffEma112();
    
    float getRsi();
    String getLangfordSignal();

    ///////////////////////////////////////
    ////    INNER CLASSES
}
