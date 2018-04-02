/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.watchlists;

import com.quartz.qtrend.QTrendConstants;
import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.services.IStockQuoteListService;
import com.quartz.qtrend.dom.watchlists.IWatchListService;
import com.quartz.qtrend.dom.watchlists.WatchListDoesNotExistException;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qtrend.ui.watchlists.SelectWatchListsDialog;
import com.quartz.qutilities.formatter.FormatException;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;
import com.quartz.qutilities.util.Output;
import lombok.NoArgsConstructor;
import lombok.val;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.EventObject;

/**
 * Displays tickers information for selected watchlists.
 *
 * @author Christian
 * @since Quartz...
 */
@NoArgsConstructor
@Component("Event.ViewWatchLists")
public class ViewWatchListsAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    static private final ILog LOG = LogManager.getLogger(ViewWatchListsAction.class);

    //  from spring
    @Autowired private IStockQuoteListService stockQuotesService;
    @Autowired private IWatchListService watchListService;
    @Autowired private SelectWatchListsDialog  selectWatchListsDialog;

    //  from frame
    private QTrendFrame frame;
    private Output output;

    public void setFrame(QTrendFrame pFrame)
    {
        frame = pFrame;
        output = frame.getOutput();
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        val watchlists = selectWatchListsDialog.select();

        if (watchlists == null || watchlists.isEmpty()) return;

        LOG.info("Showing watchlists: " + watchlists);

        output.clear();

        for (String s : watchlists)
        {
            try
            {
                val wl = watchListService.load(s);

                val tickerQuotes = stockQuotesService.loadQuotes(wl.getTickers());

                output.writeln(QTrendConstants.Formats.DEFAULT_FORMAT.formatTitle(true, " (" + wl.getName() + ")"));

                if (!tickerQuotes.isEmpty())
                {
                    output.writeln(QTrendConstants.Formats.DEFAULT_FORMAT.format(tickerQuotes));
                }
                else
                {
                    output.writeln("No tickers to watch...");
                }

                output.writeln();
                output.writeln();
            }
            catch (WatchListDoesNotExistException e)
            {
                LOG.error("WatchList does NOT exists: " + s);
            }
            catch (StockException | FormatException e)
            {
                LOG.error("Could not format output.", e);
            }
        }
    }
}
