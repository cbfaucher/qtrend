/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom;

import com.quartz.qtrend.dom.helpers.Ticker;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class FullTickerName
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final public Ticker exchange;
    final public Ticker ticker;
    final public String name;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public FullTickerName(Ticker pExchange, Ticker pTicker, String pName)
    {
        exchange = pExchange;
        ticker = pTicker;
        name = pName;
    }
    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public boolean equals(Object o)
    {
        if (this == o) return true;
        if (!(o instanceof FullTickerName)) return false;

        final FullTickerName fullTickerName = (FullTickerName) o;

        if (exchange != null ? !exchange.equals(fullTickerName.exchange) : fullTickerName.exchange != null) return false;
        if (name != null ? !name.equals(fullTickerName.name) : fullTickerName.name != null) return false;
        if (ticker != null ? !ticker.equals(fullTickerName.ticker) : fullTickerName.ticker != null) return false;

        return true;
    }

    public int hashCode()
    {
        int result;
        result = (exchange != null ? exchange.hashCode() : 0);
        result = 29 * result + (ticker != null ? ticker.hashCode() : 0);
        result = 29 * result + (name != null ? name.hashCode() : 0);
        return result;
    }

    public String toString()
    {
        return exchange + "/" + ticker + " (" + name + ")";
    }
    ///////////////////////////////////////
    ////    INNER CLASSES
}
