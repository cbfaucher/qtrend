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
import com.quartz.qtrend.dom.exchanges.StockQuoteVariation;
import com.quartz.qtrend.dom.exchanges.services.ExchangesService;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qtrend.ui.exchanges.SelectExchangesDialog;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.formatter.FormatException;
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
import java.util.Collection;

import static com.quartz.qtrend.QTrendConstants.Formats.PRICE_DROP_FORMAT;

/**
 * Finds stocks that had a significat price drops.
 *
 * @author Christian
 * @since Quartz...
 */
public class FindPriceDropsAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(FindPriceDropsAction.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    //  set by spring
    private ExchangesService exchangesService;
    private QUserProperties userProperties;
    private SelectExchangesDialog   selectExchangeDialog;

    private QTrendFrame     parent = null;
    private Output          output = null;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public FindPriceDropsAction()
    {
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setSelectExchangeDialog(SelectExchangesDialog pSelectExchangeDialog)
    {
        selectExchangeDialog = pSelectExchangeDialog;
    }

    public void setExchangesService(ExchangesService pExchangesService)
    {
        exchangesService = pExchangesService;
    }

    public void setUserProperties(QUserProperties pUserProperties)
    {
        userProperties = pUserProperties;
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
            output.clear();

            selectExchangeDialog.setVisible(true);
            if (selectExchangeDialog.isCancelled()) return;

            final Collection<Ticker> exchanges = selectExchangeDialog.getSelectedTickers();

//            final Ticker exchangeName = ActionHelper.askExchange(parent);
//            if (exchangeName == null) return;

            final YearMonthDay fromDate = ActionHelper.askDate(parent, "Since Date?", new YearMonthDay().toString());
//            final List<YearMonthDay> existingDates = exchangesService.findExistingDates(exchangeName, 20);
//            final YearMonthDay[] dates = existingDates.toArray(new YearMonthDay[0]);
//            final YearMonthDay fromDate = (YearMonthDay) JOptionPane.showInputDialog(parent, "Since?", "Date?",
//                                                            JOptionPane.QUESTION_MESSAGE,
//                                                            null,
//                                                            dates,
//                                                            (dates.length > 0 ? dates[0] : null));
            if (fromDate == null) return;

            final Object[] closeAvgPeriods = new Object[] {1, 3, 7};

            final Integer avgPeriod = (Integer) JOptionPane.showInputDialog(
                    parent, "For period", "Last Days",
                    JOptionPane.QUESTION_MESSAGE,
                    null,
                    closeAvgPeriods,
                    closeAvgPeriods[1]);
            if (avgPeriod == null) return;

            final String minPriceDropStr = JOptionPane.showInputDialog(
                    parent, "Drop for at least x %?", userProperties.getUserPropertyAsFloat(QTrendConstants.UserPropertyNames.USERPROP_LAST_MINIMUM_DROP, 10.0f));
            if (minPriceDropStr == null) return;
            final float minPriceDrop = new Float(minPriceDropStr.trim()).floatValue();
            userProperties.setUserProperty(QTrendConstants.UserPropertyNames.USERPROP_LAST_MINIMUM_DROP, String.valueOf(minPriceDrop));

            final String minimumPriceStr = JOptionPane.showInputDialog(parent, "Minimum price?", userProperties.getUserPropertyAsFloat(QTrendConstants.UserPropertyNames.USERPROP_MINIMUM_PRICE, 1.00f));
            if (minimumPriceStr == null) return;
            final float minimumPrice = new Float(minimumPriceStr).floatValue();
            userProperties.setUserProperty(QTrendConstants.UserPropertyNames.USERPROP_MINIMUM_PRICE, String.valueOf(minimumPrice));

            final String volumeStr = JOptionPane.showInputDialog(parent, "Minimum volume?", userProperties.getUserPropertyAsInt(QTrendConstants.UserPropertyNames.USERPROP_MINIMUM_VOLUME, 100000));
            if (volumeStr == null) return;
            final int minimumVolume = Integer.parseInt(volumeStr.trim());
            userProperties.setUserProperty(QTrendConstants.UserPropertyNames.USERPROP_MINIMUM_VOLUME, String.valueOf(minimumVolume));

            output.writeln(PRICE_DROP_FORMAT.formatTitle(true));

            for (Ticker exchangeName : exchanges)
            {
                final List<StockQuoteVariation> quotes = exchangesService.findPriceDrops(exchangeName, fromDate, avgPeriod.intValue(), minPriceDrop, minimumPrice, minimumVolume);
                output.writeln(PRICE_DROP_FORMAT.format(quotes));
            }
        }
        catch (StockException e1)
        {
            LOG.error("Could not get price drops.", e1);
        }
        catch (FormatException e1)
        {
            LOG.error("Could not get price drops.", e1);
        }
    }


    ///////////////////////////////////////
    ////    INNER CLASSES
}
