/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions;

import com.quartz.qtrend.actions.helpers.ActionHelper;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.dom.services.StockQuoteService;
import com.quartz.qtrend.ui.ProgressDialog;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qutilities.util.Output;
import com.quartz.qtrend.util.StockRecalculator;
import com.quartz.qutilities.jobrunner.DefaultJob;
import com.quartz.qutilities.jobrunner.JobRunner;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;
import com.quartz.qutilities.util.Output;

import java.util.EventObject;

/**
 * Recalculates the given ticker
 *
 * @author Christian
 * @since Quartz...
 */
public class RecalculateTickerAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(RecalculateTickerAction.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    //  from spring
    private StockQuoteListService   stockQuotesService;
    private StockQuoteService       stockQuoteService;
    private JobRunner       jobRunner = null;

    private QTrendFrame     parent = null;
    private Output          output = null;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public RecalculateTickerAction()
    {

    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setStockQuotesService(StockQuoteListService pStockQuotesService)
    {
        stockQuotesService = pStockQuotesService;
    }

    public void setStockQuoteService(StockQuoteService pStockQuoteService)
    {
        stockQuoteService = pStockQuoteService;
    }

    public void setJobRunner(JobRunner pJobRunner)
    {
        jobRunner = pJobRunner;
    }

    public void setFrame(QTrendFrame pQTrendFrame)
    {
        parent = pQTrendFrame;
        output = parent.getOutput();
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        output.clear();

        final Ticker ticker = ActionHelper.askTicker(parent);
        if (ticker == null) return;

        final ProgressDialog progressDialog = new ProgressDialog(parent);

        jobRunner.runJob(new DefaultJob() {
            public Object runJob() throws Exception
            {
                progressDialog.setVisible(true);
                progressDialog.setText("Recalculating ticker " + ticker + "...");

                progressDialog.reset();

                new StockRecalculator(stockQuotesService, stockQuoteService, ticker).recalculate(output);

                return null;
            }

            public void onException(Exception e)
            {
                LOG.error("Could not resequence.", e);
            }

            public void onFinally()
            {
                progressDialog.setVisible(false);
            }

        });
    }

    ///////////////////////////////////////
    ////    INNER CLASSES

}
