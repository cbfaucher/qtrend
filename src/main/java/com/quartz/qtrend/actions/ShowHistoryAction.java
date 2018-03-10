/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions;

import com.quartz.qtrend.QTrendConstants;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.dom.services.StockQuoteService;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.formatter.FormatException;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;
import com.quartz.qutilities.util.QUserProperties;

import javax.swing.*;
import java.util.EventObject;
import java.util.List;

/**
 * Shows the history about a ticker
 *
 * @author Christian
 * @since Quartz...
 */
public class ShowHistoryAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(ShowHistoryAction.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private QUserProperties userProperties;
    private StockQuoteService stockQuoteService;
    private StockQuoteListService stockQuotesService;

    private QTrendFrame parent;
    private Output output;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public ShowHistoryAction()
    {
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setFrame(QTrendFrame pQTrendFrame)
    {
        parent = pQTrendFrame;
        output = parent.getOutput();
    }

    public void setUserProperties(QUserProperties pUserProperties)
    {
        userProperties = pUserProperties;
    }

    public void setStockQuoteService(StockQuoteService pStockQuoteService)
    {
        stockQuoteService = pStockQuoteService;
    }

    public void setStockQuotesService(StockQuoteListService pStockQuotesService)
    {
        stockQuotesService = pStockQuotesService;
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        String value = output.getSelectedText();

        if (value == null)
        {
            value = JOptionPane.showInputDialog(parent, "What is the ticker?", userProperties.getProperty(QTrendConstants.UserPropertyNames.USERPROP_LAST_TICKER, ""));
            if (value == null) return;
            userProperties.setProperty(QTrendConstants.UserPropertyNames.USERPROP_LAST_TICKER, value);
        }

        final Ticker ticker = new Ticker(value);

        try
        {
            final List<StockQuote> quotes = stockQuotesService.getHistory(ticker, true);

            output.clear();

            if (quotes.isEmpty())
            {
                LOG.error("\nTicker " + ticker + " has no data!") ;
                return;
            }

//            output.write("EXCHANGE: " + exchange);
            output.writeln("TICKER  : " + ticker);
            output.writeln("NAME    : " + stockQuoteService.getTickerName(ticker));
            output.writeln();
            output.writeln(QTrendConstants.Formats.TICKER_DEFAULT_FORMAT_WITH_EMA56_EMA112.formatTitle(true));
            output.writeln(QTrendConstants.Formats.TICKER_DEFAULT_FORMAT_WITH_EMA56_EMA112.format(quotes));

            output.setPosition(0);
        }
        catch (FormatException e1)
        {
            LOG.error("Could now retrieve the history for " + ticker, e1);
        }
        catch (StockException e1)
        {
            LOG.error("Could now retrieve the history for " + ticker, e1);
        }

    }


    ///////////////////////////////////////
    ////    INNER CLASSES
}
