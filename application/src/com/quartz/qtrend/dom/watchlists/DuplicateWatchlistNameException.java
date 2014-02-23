/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.watchlists;

import com.quartz.qtrend.dom.StockException;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class DuplicateWatchlistNameException extends StockException
{
    final public String watchListName;

    public DuplicateWatchlistNameException(String pName)
    {
        super("Duplicate watchlist name: " + pName);
        watchListName = pName;
    }
}
