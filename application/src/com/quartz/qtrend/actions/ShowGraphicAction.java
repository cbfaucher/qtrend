/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions;

import com.quartz.qtrend.QTrendConstants;
import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.dom.services.StockQuoteService;
import com.quartz.qtrend.graphs.GraphicFactoryException;
import com.quartz.qtrend.graphs.ui.GraphicFrame2;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;
import com.quartz.qutilities.util.QUserProperties;
import com.quartz.qutilities.util.Output;

import javax.swing.*;
import java.util.EventObject;
import java.util.List;

/**
 * Shows graphics using JChart.
 *
 * @author Christian
 * @since Quartz...
 */
public class ShowGraphicAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(ShowGraphicAction.class);

    private static final String USERPROP_PERIODS_BACK = "graphics.period.back";

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private QUserProperties userProperties;
    private StockQuoteService       stockQuoteService;
    private StockQuoteListService   stockQuotesService;

    private QTrendFrame  parent;
    private Output  output;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public ShowGraphicAction()
    {
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

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

    public void setFrame(QTrendFrame pQTrendFrame)
    {
        parent = pQTrendFrame;
        output = parent.getOutput();
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        String selectedText = output.getSelectedText();

        if (selectedText == null)
        {
            selectedText = JOptionPane.showInputDialog(parent, "What is the ticker?", userProperties.getUserProperty(
                    QTrendConstants.UserPropertyNames.USERPROP_LAST_TICKER, ""));
            if (selectedText == null) return;
            userProperties.setUserProperty(QTrendConstants.UserPropertyNames.USERPROP_LAST_TICKER, selectedText);
        }

        final Ticker ticker = new Ticker(selectedText);

        final String periodStr = JOptionPane.showInputDialog(parent, "For how many periods in the past (~20 per month)?", userProperties.getUserPropertyAsInt(
                USERPROP_PERIODS_BACK, 20));
        if (periodStr == null) return;

        try
        {
            final Integer periodBack = new Integer(periodStr);
            userProperties.setUserProperty(USERPROP_PERIODS_BACK, periodStr);
            final List<StockQuote> quotes = stockQuotesService.loadQuotes(ticker, false, periodBack);

            if (quotes.isEmpty())
            {
                LOG.error("\nNo data found for " + ticker + ".");
                return;
            }

            final StockQuote stockQuote = quotes.get(0);
            final GraphicFrame2 frame = new GraphicFrame2(
                    stockQuote.getStockExchange(),
                    ticker,
                    stockQuoteService.getTickerName(ticker),
                    quotes, parent.getEventManager());
            frame.setVisible(true);
        }
        catch (NumberFormatException e1)
        {
            LOG.error("You did not enter a valid number: " + periodStr);
        }
        catch (StockException e1)
        {
            LOG.error("Could not display the graph!", e1);
        }
        catch (GraphicFactoryException e1)
        {
            LOG.error("Could not display the graph!", e1);
        }
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
