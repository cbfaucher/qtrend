/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.helpers;

/**
 * A Ticker-Name key, e.g. the {@link #ticker} as CAPS
 *
 * @author Christian
 * @since Quartz...
 */
public class Ticker implements Comparable
{
    final private String ticker;

    public Ticker(String pTicker)
    {
        ticker = pTicker.toUpperCase().replace('-', '/');
    }

    public String asYahooTicker()
    {
        return ticker.replace('/', '-');
    }

    public int compareTo(Object o)
    {
        final Ticker other = (Ticker) o;

        return ticker.compareTo(other.ticker);
    }

    public boolean equals(Object o)
    {
        if (this == o) return true;
        if (!(o instanceof Ticker)) return false;

        final Ticker ticker = (Ticker) o;

        if (!this.ticker.equals(ticker.ticker)) return false;

        return true;
    }

    public int hashCode()
    {
        return ticker.hashCode();
    }

    public String toString()
    {
        return ticker;
    }

}
