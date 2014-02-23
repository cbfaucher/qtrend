/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.watchlists;

import com.quartz.qtrend.dom.watchlists.WatchListService;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qtrend.ui.watchlists.SelectWatchListsDialog;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;

import java.util.EventObject;
import java.util.List;

/**
 * Displays tickers information for selected watchlists.
 *
 * @author Christian
 * @since Quartz...
 */
public class DeleteWatchListsAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    static private final ILog LOG = LogManager.getLogger(DeleteWatchListsAction.class);
    
    //  from spring
    private WatchListService        watchListService;
    private SelectWatchListsDialog  selectWatchListsDialog;

    //  from frame
    private QTrendFrame frame;
    private Output output;

    public DeleteWatchListsAction()
    {
    }

    public void setWatchListService(WatchListService pWatchListService)
    {
        watchListService = pWatchListService;
    }

    public void setSelectWatchListsDialog(SelectWatchListsDialog pSelectWatchListsDialog)
    {
        selectWatchListsDialog = pSelectWatchListsDialog;
    }

    public void setFrame(QTrendFrame pFrame)
    {
        frame = pFrame;
        output = frame.getOutput();
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        final List<String> watchlists = selectWatchListsDialog.select();

        if (watchlists == null || watchlists.isEmpty()) return;

        LOG.info("Showing watchlists: " + watchlists);

        output.clear();

        for (String s : watchlists)
        {
            LOG.info("Deleting WatchList: " + s);
            watchListService.delete(s);
        }
    }
}
