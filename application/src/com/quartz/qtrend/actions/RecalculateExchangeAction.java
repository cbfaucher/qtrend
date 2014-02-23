/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions;

import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.dom.services.StockQuoteService;
import com.quartz.qtrend.ui.ProgressDialog;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qtrend.ui.exchanges.SelectExchangesDialog;
import com.quartz.qutilities.util.Output;
import com.quartz.qtrend.util.StockRecalculator;
import com.quartz.qutilities.jobrunner.DefaultJob;
import com.quartz.qutilities.jobrunner.JobRunner;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;

import java.util.Collection;
import java.util.EventObject;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class RecalculateExchangeAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    static private final ILog LOG = LogManager.getLogger(RecalculateExchangeAction.class);

    //  by spring
    private StockQuoteListService   stockQuotesService;
    private StockQuoteService       stockQuoteService;
    private JobRunner               jobRunner;
    private SelectExchangesDialog   selectExchangeDialog;


    //  by frame
    private QTrendFrame     parent = null;
    private Output          output = null;


    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public RecalculateExchangeAction()
    {

    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setSelectExchangeDialog(SelectExchangesDialog pSelectExchangeDialog)
    {
        selectExchangeDialog = pSelectExchangeDialog;
    }

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

        selectExchangeDialog.setVisible(true);
        if (selectExchangeDialog.isCancelled()) return;

        final Collection<Ticker> exchanges = selectExchangeDialog.getSelectedTickers();

        final ProgressDialog progressDialog = new ProgressDialog(parent);

        jobRunner.runJob(new DefaultJob() {
            public Object runJob() throws Exception
            {
                for (Ticker exchange : exchanges)
                {
                    final Collection<Ticker> tickers = stockQuotesService.findTickersForExchange(exchange);

                    progressDialog.setVisible(true);
                    progressDialog.setText("Initialising Import...");

                    progressDialog.reset();
                    progressDialog.setMinMax(0, tickers.size());

                    for (Ticker ticker : tickers)
                    {
                        progressDialog.setText("Recalculating " + ticker + "...");
                        resequence(ticker);
                        progressDialog.increment();
                    }
                }

                return null;  //To change body of implemented methods use File | Settings | File Templates.
            }

            public void onException(Exception e)
            {
                LOG.error("Could not recalculate the exchange.", e);
            }

            public void onFinally()
            {
                progressDialog.setVisible(false);
            }
        });
    }

    private void resequence(Ticker pTicker) throws StockException
    {
        new StockRecalculator(stockQuotesService, stockQuoteService, pTicker).recalculate(output);
    }

    ///////////////////////////////////////
    ////    INNER CLASSES

}
