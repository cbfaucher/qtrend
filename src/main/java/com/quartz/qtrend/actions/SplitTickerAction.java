/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions;

import com.quartz.qtrend.QTrendConstants;
import com.quartz.qtrend.actions.helpers.ActionHelper;
import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.exchanges.services.ExchangesService;
import com.quartz.qtrend.dom.helpers.Price;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.dom.services.StockQuoteService;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qutilities.util.Output;
import com.quartz.qtrend.util.StockRecalculator;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;
import com.quartz.qutilities.util.QUserProperties;
import org.joda.time.YearMonthDay;

import javax.swing.*;
import java.util.EventObject;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class SplitTickerAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(SplitTickerAction.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    //  by spring
    private QUserProperties         userProperties;
    private StockQuoteService       stockQuoteService;
    private StockQuoteListService   stockQuotesService;
    private ExchangesService        exchangesService;

    //  from frame
    private QTrendFrame     parent = null;
    private Output          output = null;
    private static final ILog SPLIT_LOG = LogManager.getLogger("Split");


    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public SplitTickerAction()
    {
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setExchangesService(ExchangesService pExchangesService)
    {
        exchangesService = pExchangesService;
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

    public void setFrame(QTrendFrame pQTrendFrame)
    {
        parent = pQTrendFrame;
        output = parent.getOutput();
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        try
        {
            final Ticker exchange = ActionHelper.askExchange(parent);
            if (exchange == null) return;

            //  ticker
            final String value = JOptionPane.showInputDialog(parent, "What is the ticker?", userProperties.getProperty(QTrendConstants.UserPropertyNames.USERPROP_LAST_TICKER, ""));
            if (value == null) return;
            userProperties.setProperty(QTrendConstants.UserPropertyNames.USERPROP_LAST_TICKER, value);
            final Ticker ticker = new Ticker(value);

            //  split date
            final List<YearMonthDay> existingDates = exchangesService.findExistingDates(exchange, null);
            final YearMonthDay[] dates = existingDates.toArray(new YearMonthDay[0]);
            final YearMonthDay splitDate = (YearMonthDay)
                    JOptionPane.showInputDialog(parent, "Date of Split?", "Split Date",
                                                JOptionPane.QUESTION_MESSAGE,
                                                null,
                                                dates,
                                                dates[0]);
            if (splitDate == null) return;

            //  split factor
            final String splitFactor = JOptionPane.showInputDialog(parent, "What is the split factor (e.g. 3:1)?");
            if (splitFactor == null) return;

            final Pattern splitPattern = Pattern.compile("^([0-9]+):([0-9]+)$");
            final Matcher matcher = splitPattern.matcher(splitFactor);
            if (matcher.matches() == false)
            {
                throw new StockException("Split pattern does not match nn:nn pattern.");
            }
            //  3:1
            final int leftFactor = Integer.valueOf(matcher.group(1));
            final int rightFactor = Integer.valueOf(matcher.group(2));
            final float splitMultiplicator = (float) rightFactor / (float) leftFactor;

            splitPrices(ticker, splitMultiplicator, splitDate);

            new StockRecalculator(stockQuotesService, stockQuoteService, ticker).recalculate(output);

            SPLIT_LOG.info("Split " + splitFactor + " applied on " + ticker + "(" + exchange + ").  Split Date=" + splitDate.toString() + ".");
        }
        catch (StockException e1)
        {
            LOG.error("Could not apply split.", e1);
        }
    }

    private void splitPrices(final Ticker pTicker, final float pSplitMultiplicator, final YearMonthDay pSplitDate)
            throws StockException
    {
        final List<StockQuote> quotes = stockQuotesService.getHistory(pTicker, false);
        for (StockQuote sq : quotes)
        {
            if (pSplitDate.compareTo(sq.getDate()) <= 0) break;

            sq.setOpen(split(sq.getOpen(), pSplitMultiplicator));
            sq.setHigh(split(sq.getHigh(), pSplitMultiplicator));
            sq.setLow(split(sq.getLow(), pSplitMultiplicator));
            sq.setClose(split(sq.getClose(), pSplitMultiplicator));
        }

        stockQuotesService.save(quotes);
    }

    private Price split(Price pActualPrice, float pSplitMultiplicator)
    {
        if (pActualPrice == null) return null;
        return new Price(pActualPrice.price * pSplitMultiplicator);
    }


    ///////////////////////////////////////
    ////    INNER CLASSES
}
