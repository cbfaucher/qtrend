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
import org.apache.commons.lang.StringUtils;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public abstract class AbstractStockQuoteImpl implements AbstractStockQuote
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    protected Ticker    stockExchange;
    protected Ticker    ticker;
    protected String    tickerName;
    protected YearMonthDay    date;
    protected Price           close;
    protected Price           mininumClose;
    protected Price           maximumClose;
    protected long            volume;
    protected long            averageVolume;
    protected int             tickerCount;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    protected AbstractStockQuoteImpl()
    {
    }

    protected AbstractStockQuoteImpl(String pStockExchange, String pTicker)
    {
        this(StringUtils.isNotBlank(pStockExchange) ? new Ticker(pStockExchange) : null,
             StringUtils.isNotBlank(pTicker) ? new Ticker(pTicker) : null);
    }

    protected AbstractStockQuoteImpl(Ticker pStockExchange, Ticker pTicker)
    {
        stockExchange = pStockExchange;
        ticker = pTicker;
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public Ticker getStockExchange()
    {
        return stockExchange;
    }

    public Ticker getTicker()
    {
        return ticker;
    }

    public void setStockExchange(Ticker pStockExchange)
    {
        stockExchange = pStockExchange;
    }

    public void setTicker(Ticker pTicker)
    {
        ticker = pTicker;
    }

    public YearMonthDay getDate()
    {
        return date;
    }

    public void setDate(YearMonthDay pDate)
    {
        date = pDate;
    }

    public long getVolume()
    {
        return volume;
    }

    public void setVolume(long pVolume)
    {
        volume = pVolume;
    }

    public Price getClose()
    {
        return close;
    }

    public void setClose(Price pClose)
    {
        close = pClose;
    }

    public Price getMininumClose()
    {
        return mininumClose;
    }

    public void setMininumClose(Price pMininumClose)
    {
        mininumClose = pMininumClose;
    }

    public Price getMaximumClose()
    {
        return maximumClose;
    }

    public void setMaximumClose(Price pMaximumClose)
    {
        maximumClose = pMaximumClose;
    }

    public long getAverageVolume()
    {
        return averageVolume;
    }

    public void setAverageVolume(long pAverageVolume)
    {
        averageVolume = pAverageVolume;
    }

    public String toString()
    {
        final StringBuffer buffer = new StringBuffer(100);
        if (stockExchange != null) buffer.append(stockExchange).append("/");
        buffer.append(ticker != null ? ticker.toString() : "???");
        if (date != null) buffer.append(" ").append(date);
        if (close != null) buffer.append(" ").append(close);
        buffer.append(" Volume=").append(volume);
        return buffer.toString().trim();
    }

    ///////////////////////////////////////
    ////    INNER CLASSES

}
