/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.rsi;

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
import com.quartz.qutilities.util.QUserProperties;
import com.quartz.qutilities.util.Output;

import javax.swing.*;
import java.util.Collection;
import java.util.EventObject;
import java.util.List;

import static com.quartz.qtrend.QTrendConstants.Formats.DEFAULT_FORMAT_WITH_EMA56_EMA112;

/**
 * Finds stocks that are overbought (high RSI)
 *
 * @author Christian
 * @since Quartz...
 */
public class FindOverboughtAction implements QEventHandler, JFrameAware<QTrendFrame>, QTrendConstants.UserPropertyNames
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(FindOverboughtAction.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    //  set by spring
    private QUserProperties         userProperties;
    private StockQuoteListService   stockQuotesService;
    private JobRunner               jobRunner;
    private SelectExchangesDialog   selectExchangeDialog;

    //  set by frame
    private QTrendFrame  frame = null;
    private Output output;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public FindOverboughtAction()
    {
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setSelectExchangeDialog(SelectExchangesDialog pSelectExchangeDialog)
    {
        selectExchangeDialog = pSelectExchangeDialog;
    }

    public void setUserProperties(QUserProperties pUserProperties)
    {
        userProperties = pUserProperties;
    }

    public void setStockQuotesService(StockQuoteListService pStockQuotesService)
    {
        stockQuotesService = pStockQuotesService;
    }

    public void setJobRunner(JobRunner pJobRunner)
    {
        jobRunner = pJobRunner;
    }

    public void setFrame(QTrendFrame pQTrendFrame)
    {
        frame = pQTrendFrame;
        output = frame.getOutput();
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        selectExchangeDialog.setVisible(true);
        if (selectExchangeDialog.isCancelled()) return;

        final Collection<Ticker> exchanges = selectExchangeDialog.getSelectedTickers();

        final String minimumPriceStr = JOptionPane.showInputDialog(frame, "Minimum price?", userProperties.getUserPropertyAsFloat(USERPROP_MINIMUM_PRICE, 1.00f));
        if (minimumPriceStr == null) return;
        final float minimumPrice = new Float(minimumPriceStr).floatValue();
        userProperties.setUserProperty(USERPROP_MINIMUM_PRICE, String.valueOf(minimumPrice));

        final String volumeStr = JOptionPane.showInputDialog(frame, "Minimum volume?", userProperties.getUserPropertyAsInt(USERPROP_MINIMUM_VOLUME, 100000));
        if (volumeStr == null) return;
        final int minimumVolume = Integer.parseInt(volumeStr.trim());
        userProperties.setUserProperty(USERPROP_MINIMUM_VOLUME, String.valueOf(minimumVolume));

        final String rsiStr = JOptionPane.showInputDialog(frame, "RSI above?", userProperties.getUserPropertyAsInt(USERPROP_OSS_MINIMUM_RSI, 70));
        if (rsiStr == null) return;
        final int minRsi = Integer.parseInt(rsiStr.trim());
        userProperties.setUserProperty(USERPROP_OSS_MINIMUM_RSI, String.valueOf(minRsi));

        output.clear();
        output.writeln("OVERSOLD STOCKS for Exchange: " + exchanges + "\n");

        jobRunner.runJob(new DefaultJob() {
            public Object runJob() throws Exception
            {
                output.writeln(DEFAULT_FORMAT_WITH_EMA56_EMA112.formatTitle(true));

                for (Ticker exchange : exchanges)
                {
                    final List<StockQuote> quotes = stockQuotesService.findOverboughtQuotes(exchange, minimumPrice, minimumVolume, minRsi);

                    output.writeln(DEFAULT_FORMAT_WITH_EMA56_EMA112.format(quotes));
                }

                return null;
            }

            public void onException(Exception e)
            {
                LOG.error("could not retrieve the overbought stocks", e);
            }
        });
    }


    ///////////////////////////////////////
    ////    INNER CLASSES
}
