/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.rules;

import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.rules.imports.PriceVsVolumeRatioRule;

/**
 * A rule associated to a given exchange
 *
 * @author Christian
 * @since Quartz...
 */
public interface IExchangeRule extends IRule
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    /**
     *
     * @param pExchange Exchange
     * @return True if the rule can be applied to the given exchange
     */
    public boolean isForExchange(Ticker pExchange);

    

    ///////////////////////////////////////
    ////    INNER CLASSES
    PriceVsVolumeRatioRule getPriceVsRatioRule();
}
