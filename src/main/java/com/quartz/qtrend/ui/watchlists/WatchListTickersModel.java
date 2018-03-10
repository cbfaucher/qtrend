/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.ui.watchlists;

import com.quartz.qtrend.dom.watchlists.WatchList;
import com.quartz.qtrend.dom.helpers.Ticker;

import javax.swing.*;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
class WatchListTickersModel extends AbstractListModel
{
    private WatchList watchList = null;

    WatchListTickersModel()
    {
    }

    void setWatchList(WatchList pNewWatchList)
    {
        if (watchList != null)
        {
            fireIntervalRemoved(this, 0, getSize());
        }

        watchList = pNewWatchList;

        fireIntervalAdded(this, 0, getSize());
    }

    public int getSize()
    {
        return (watchList != null ? watchList.getTickers().size() : 0);
    }

    public Object getElementAt(int index)
    {
        return (watchList != null ? watchList.getTickers().get(index) : null);
    }

    void add(Ticker pTicker)
    {
        watchList.add(pTicker);

        fireIntervalAdded(this, getSize(), getSize());
    }

    void remove(Ticker pTicker)
    {
        fireIntervalRemoved(this, 0, getSize());

        watchList.remove(pTicker);

        fireIntervalAdded(this, 0, getSize());
    }
}
