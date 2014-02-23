/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom;

import com.quartz.qtrend.dom.helpers.Price;
import com.quartz.qtrend.dom.helpers.Ticker;
import org.joda.time.YearMonthDay;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public interface AbstractStockQuote
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    Ticker getStockExchange();

    Ticker getTicker();

    YearMonthDay getDate();

    void setDate(YearMonthDay pDate);

    Price getClose();

    void setClose(Price pClose);

    ///////////////////////////////////////
    ////    INNER CLASSES
    long getVolume();

    void setVolume(long pVolume);

    Price getMininumClose();

    void setMininumClose(Price pMininumClose);

    Price getMaximumClose();

    void setMaximumClose(Price pMaximumClose);

    long getAverageVolume();

    void setAverageVolume(long pAverageVolume);

    void setStockExchange(Ticker pStockExchange);

    void setTicker(Ticker pTicker);

}
