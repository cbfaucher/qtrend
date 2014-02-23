/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.rules;

import com.quartz.qtrend.dom.StockQuote;

/**
 * A generic rule (not exchange specific.
 * <p>
 * A rule can be an inclusion or exclusion rule.
 *
 * @see IExchangeRule
 *
 * @author Christian
 * @since Quartz...
 */
public interface IRule
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    /**
     *
     * @param pQuote
     * @return true if ticker is accepted, false otherwise
     */
    boolean accept(StockQuote pQuote);

    ///////////////////////////////////////
    ////    INNER CLASSES
}
