/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.helpers;

import com.quartz.qtrend.QTrendConstants;
import com.quartz.qtrend.Signal;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qtrend.ui.exchanges.SelectExchangesDialog;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.jobrunner.DefaultJob;
import com.quartz.qutilities.jobrunner.JobRunner;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;

import java.util.Collection;
import java.util.EventObject;
import java.util.List;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class FindLastSignalAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    static private final ILog LOG = LogManager.getLogger(FindLastSignalAction.class);

    private StockQuoteListService stockQuotesService;
    private SelectExchangesDialog selectExchangeDialog;
    private Signal signal;
    private JobRunner jobRunner;

    private Output output;

    public FindLastSignalAction()
    {
    }

    public void setStockQuotesService(StockQuoteListService pStockQuotesService)
    {
        stockQuotesService = pStockQuotesService;
    }

    public void setSelectExchangeDialog(SelectExchangesDialog pSelectExchangeDialog)
    {
        selectExchangeDialog = pSelectExchangeDialog;
    }

    public void setJobRunner(JobRunner pJobRunner)
    {
        jobRunner = pJobRunner;
    }

    public void setSignal(String pSignal)
    {
        signal = Signal.fromCode(pSignal);
    }

    public void setFrame(QTrendFrame pFrame)
    {
        output = pFrame.getOutput();
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        jobRunner.runJob(new DefaultJob() {
            public Object runJob() throws Exception
            {
                output.clear();
                output.writeln("Last " + signal + "s\n\n");

                selectExchangeDialog.setVisible(true);
                if (selectExchangeDialog.isCancelled()) return null;

                final Collection<Ticker> exchanges = selectExchangeDialog.getSelectedTickers();

                LOG.info("Looking for last " + signal + "s for " + exchanges);

                output.writeln(QTrendConstants.Formats.DEFAULT_FORMAT.formatTitle(true));

                for (Ticker e : exchanges)
                {
                    final List<StockQuote> quotes = stockQuotesService.findLastSignals(e, signal);
                    output.writeln(QTrendConstants.Formats.DEFAULT_FORMAT.format(quotes));
                }

                return null;
            }

            public void onException(Exception e)
            {
                LOG.error("Could not retrieve information", e);
            }
        });
    }
}
