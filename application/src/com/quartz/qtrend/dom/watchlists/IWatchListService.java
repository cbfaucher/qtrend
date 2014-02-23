/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.watchlists;

import org.springframework.transaction.annotation.Transactional;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public interface IWatchListService
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    ///////////////////////////////////////
    ////    INNER CLASSES
    WatchList create(String pName) throws DuplicateWatchlistNameException;

    @Transactional(
            readOnly = true,
            rollbackFor = WatchListDoesNotExistException.class) WatchList load(String pName) throws WatchListDoesNotExistException;

    @Transactional(readOnly = true) boolean exists(String pWatchListName);

    void save(WatchList pWatchList);

    void delete(String pName);
}
