/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom;

import com.quartz.qtrend.dom.helpers.Price;
import com.quartz.qtrend.dom.helpers.Ticker;


/**
 * Basic stock info: exchange, ticker, tickerName, close, volume, that's it.
 *
 * @author Christian
 * @since Quartz...
 */
public class BasicStockInfo extends AbstractStockQuoteImpl implements Comparable
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final private String name;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public BasicStockInfo(Ticker pStockExchange, Ticker pTicker, String pName, Price pClose, long pVolume)
    {
        super(pStockExchange, pTicker);

        setClose(pClose);
        setVolume(pVolume);

        name = pName;
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public int compareTo(Object o)
    {
        final BasicStockInfo other = (BasicStockInfo) o;
        return this.ticker.compareTo(other.ticker);
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
