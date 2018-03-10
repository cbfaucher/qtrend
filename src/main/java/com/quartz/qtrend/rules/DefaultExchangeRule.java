/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.rules;

import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.helpers.Ticker;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public abstract class DefaultExchangeRule implements IExchangeRule
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final protected Ticker exchange;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    protected DefaultExchangeRule(Ticker pExchange)
    {
        exchange = pExchange;
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public boolean isForExchange(Ticker pExchange)
    {
        return pExchange.equals(exchange);
    }

    public Ticker getExchangeName()
    {
        return exchange;
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
