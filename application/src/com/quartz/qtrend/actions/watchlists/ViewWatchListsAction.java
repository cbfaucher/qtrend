/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.watchlists;

import com.quartz.qtrend.QTrendConstants;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.dom.watchlists.WatchList;
import com.quartz.qtrend.dom.watchlists.WatchListDoesNotExistException;
import com.quartz.qtrend.dom.watchlists.WatchListService;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qtrend.ui.watchlists.SelectWatchListsDialog;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.formatter.FormatException;
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
public class ViewWatchListsAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    static private final ILog LOG = LogManager.getLogger(ViewWatchListsAction.class);

    //  from spring
    private StockQuoteListService       stockQuotesService;
    private WatchListService        watchListService;
    private SelectWatchListsDialog  selectWatchListsDialog;

    //  from frame
    private QTrendFrame frame;
    private Output output;

    public ViewWatchListsAction()
    {
    }

    public void setStockQuotesService(StockQuoteListService pStockQuotesService)
    {
        stockQuotesService = pStockQuotesService;
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
            try
            {
                final WatchList wl = watchListService.load(s);

                final List<StockQuote> tickerQuotes = stockQuotesService.loadQuotes(wl.getTickers());

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
            catch (FormatException e)
            {
                LOG.error("Could not format output.", e);
            }
        }
    }
}
