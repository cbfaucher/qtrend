/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.alerts;

import com.quartz.qtrend.dom.watchlists.WatchListService;
import com.quartz.qutilities.spring.BeanFactorySingleton;

import java.util.Collection;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
class WatchListNamesRetriever implements IChoiceRetriever
{
    public WatchListNamesRetriever()
    {
    }

    public Collection getChoices()
    {
        final WatchListService watchListService = BeanFactorySingleton.getBean("QTrend.WatchListsService");

        return watchListService.getWatchListNames();
    }
}
