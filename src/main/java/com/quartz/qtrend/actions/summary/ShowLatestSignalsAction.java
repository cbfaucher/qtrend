/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.summary;

import com.quartz.qtrend.QTrendConstants;
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
import com.quartz.qutilities.util.Output;

import java.util.Collection;
import java.util.EventObject;
import java.util.List;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class ShowLatestSignalsAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    static private final ILog LOG = LogManager.getLogger(ShowLatestSignalsAction.class);

    private StockQuoteListService stockQuotesService;
    private SelectExchangesDialog selectExchangeDialog;
    private JobRunner jobRunner;

    private Output output;

    public ShowLatestSignalsAction()
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

    public void setFrame(QTrendFrame pFrame)
    {
        output = pFrame.getOutput();
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        jobRunner.runJob(new DefaultJob() {
            public Object runJob() throws Exception
            {
                selectExchangeDialog.setVisible(true);
                if (selectExchangeDialog.isCancelled()) return null;

                final Collection<Ticker> exchanges = selectExchangeDialog.getSelectedTickers();

                output.clear();
                output.writeln("LATEST SIGNALS");
                output.writeln("==============");
                output.writeln(QTrendConstants.Formats.DEFAULT_FORMAT.formatTitle(true));

                for (Ticker e : exchanges)
                {
                    final List<StockQuote> quotes = stockQuotesService.findLatestSignals(e);
                    output.writeln(QTrendConstants.Formats.DEFAULT_FORMAT.format(quotes));
                }

                return null;  //To change body of implemented methods use File | Settings | File Templates.
            }

            public void onException(Exception e)
            {
                LOG.error("Could not retrieve information", e);
            }
        });
    }
}
