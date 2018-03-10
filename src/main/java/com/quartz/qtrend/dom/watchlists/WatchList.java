/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.watchlists;

import com.quartz.qtrend.dom.helpers.Ticker;

import java.util.Collection;
import java.util.List;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public interface WatchList
{
    String getName();

    String getDescription();

    void setDescription(String pDescription);

    void add(Ticker pTicker);

    boolean remove(Ticker pTicker);

    List<Ticker> getTickers();

    long getId();

    void setName(String pNewName);
}
