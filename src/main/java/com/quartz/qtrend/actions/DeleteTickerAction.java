/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions;

import com.quartz.qtrend.actions.helpers.ActionHelper;
import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.services.StockQuoteService;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;

import java.util.EventObject;

/**
 * Deletes a given ticker, by asking the user.
 *
 * @author Christian
 * @since Quartz...
 */
public class DeleteTickerAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    static private final ILog LOG = LogManager.getLogger(DeleteTickerAction.class);

    private StockQuoteService stockQuoteService;
    private QTrendFrame parent = null;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public DeleteTickerAction()
    {

    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setStockQuoteService(StockQuoteService pStockQuoteService)
    {
        stockQuoteService = pStockQuoteService;
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        final Ticker ticker = ActionHelper.askTicker(parent);
        if (ticker == null) return;

        final Output output = parent.getOutput();

        try
        {
            final int nbRows = stockQuoteService.deleteTicker(ticker);

            output.clear();
            output.writeln("Ticker " + ticker + " was removed successfully!");
            output.writeln(nbRows + " rows were removed.");
        }
        catch (StockException e)
        {
            LOG.error("Could not delete ticker: " + ticker + ".", e);
        }
    }

    public void setFrame(QTrendFrame pQTrendFrame)
    {
        parent = pQTrendFrame;
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
