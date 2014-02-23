/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.watchlists;

import com.quartz.qtrend.dom.helpers.Ticker;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
class WatchListImpl implements WatchList
{
    final private long id;
    final private List<Ticker> tickers = new ArrayList<Ticker>();

    private String name;
    private String description;


    WatchListImpl(long pId, String pName)
    {
        this(pId, pName, "");
    }

    WatchListImpl(long pId, String pName, String pDescription)
    {
        id = pId;
        name = pName;
        description = pDescription;
    }

    public String getName()
    {
        return name;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String pDescription)
    {
        description = pDescription;
    }

    public void add(Ticker pTicker)
    {
        if (tickers.contains(pTicker)) return;

        tickers.add(pTicker);
    }

    public boolean remove(Ticker pTicker)
    {
        return tickers.remove(pTicker);
    }

    public List<Ticker> getTickers()
    {
        return tickers;
    }

    public long getId()
    {
        return id;
    }

    public void setName(String pNewName)
    {
        name = pNewName;
    }
}
