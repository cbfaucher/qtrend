/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.watchlists;

import com.quartz.qtrend.dom.watchlists.DuplicateWatchlistNameException;
import com.quartz.qtrend.dom.watchlists.WatchList;
import com.quartz.qtrend.dom.watchlists.WatchListService;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qtrend.ui.watchlists.EditWatchListDialog;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;
import org.apache.commons.lang.StringUtils;

import javax.swing.*;
import java.util.EventObject;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class AddWatchListAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    static private final ILog LOG = LogManager.getLogger(AddWatchListAction.class);

    //  set by spring
    private WatchListService watchListService;
    private EditWatchListDialog editWatchListDialog;

    //  set from frame
    private QTrendFrame frame;

    public AddWatchListAction()
    {
    }

    public void setFrame(QTrendFrame pFrame)
    {
        frame = pFrame;
    }

    public void setWatchListService(WatchListService pWatchListService)
    {
        watchListService = pWatchListService;
    }

    public void setEditWatchListDialog(EditWatchListDialog pEditWatchListDialog)
    {
        editWatchListDialog = pEditWatchListDialog;
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        final String newWatchListName = JOptionPane.showInputDialog(frame,
                                                                    "What is the new WatchList name?",
                                                                    "Add new WatchList",
                                                                    JOptionPane.QUESTION_MESSAGE);
        if (StringUtils.isBlank(newWatchListName)) return;

        //  createSqlParameterValue
        try
        {
            final WatchList watchList = watchListService.create(newWatchListName);

            if (editWatchListDialog.edit(watchList) == true)
            {
                watchListService.save(watchList);

                LOG.info("New WatchList ADDED successfully: " + newWatchListName + "!");
            }
            else
            {
                watchListService.delete(watchList);
                LOG.info("WatchList NOT added (and deleted): " + newWatchListName);
            }
        }
        catch (DuplicateWatchlistNameException e)
        {
            LOG.error("WatchList already exists with that name: " + newWatchListName);
        }
    }
}
