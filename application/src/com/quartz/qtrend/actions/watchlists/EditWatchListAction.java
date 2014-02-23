/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.watchlists;

import com.quartz.qtrend.dom.watchlists.WatchList;
import com.quartz.qtrend.dom.watchlists.WatchListDoesNotExistException;
import com.quartz.qtrend.dom.watchlists.WatchListService;
import com.quartz.qtrend.ui.watchlists.EditWatchListDialog;
import com.quartz.qtrend.ui.watchlists.SelectSingleWatchListDialog;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;

import java.util.EventObject;

/**
 * Displays tickers information for selected watchlists.
 *
 * @author Christian
 * @since Quartz...
 */
public class EditWatchListAction implements QEventHandler
{
    static private final ILog LOG = LogManager.getLogger(EditWatchListAction.class);

    //  from spring
    private WatchListService            watchListService;
    private SelectSingleWatchListDialog selectSingleWatchListDialog;
    private EditWatchListDialog         editWatchListDialog;

    public EditWatchListAction()
    {
    }

    public void setWatchListService(WatchListService pWatchListService)
    {
        watchListService = pWatchListService;
    }

    public void setSelectSingleWatchListDialog(SelectSingleWatchListDialog pSelectSingleWatchListDialog)
    {
        selectSingleWatchListDialog = pSelectSingleWatchListDialog;
    }

    public void setEditWatchListDialog(EditWatchListDialog pEditWatchListDialog)
    {
        editWatchListDialog = pEditWatchListDialog;
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        final String watchlistName = selectSingleWatchListDialog.select();

        if (watchlistName == null) return;

        LOG.info("Editing watchlistName: " + watchlistName);

        try
        {
            final WatchList watchList = watchListService.load(watchlistName);

            if (editWatchListDialog.edit(watchList))
            {
                LOG.info("Saving WatchList " + watchlistName + " after edition...");
                watchListService.save(watchList);
            }
        }
        catch (WatchListDoesNotExistException e)
        {
            LOG.error("Watchlist not found: " + watchlistName);
        }
    }
}
