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
import com.quartz.qutilities.util.QUserProperties;
import org.joda.time.LocalDate;
import org.joda.time.YearMonthDay;

import javax.swing.*;
import java.util.Collection;
import java.util.EventObject;
import java.util.List;
import java.util.TreeSet;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class AbstractFindObsAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    static private final ILog LOG = LogManager.getLogger(AbstractFindObsAction.class);

    //  those are set by spring
    protected QUserProperties userProperties;
    private StockQuoteListService stockQuotesService;
    private SelectExchangesDialog selectExchangeDialog;
    private JobRunner jobRunner;

    //  those are set from parent frame
    protected QTrendFrame     parent = null;
    protected Output          output = null;

    //  those are set from questions
    private Collection<Ticker> exchanges = new TreeSet<Ticker>();
    private Float minimumPrice;
    private Integer minimumVolume;
    private LocalDate fromDate;
    protected Integer maximumRsi = 100;


    //  this is set from ctor.
    private final Signal signal;

    public AbstractFindObsAction(final Signal pWantedSignal)
    {
        signal = pWantedSignal;
    }

    public void setStockQuotesService(StockQuoteListService pStockQuotesService)
    {
        stockQuotesService = pStockQuotesService;
    }

    public void setSelectExchangeDialog(SelectExchangesDialog pSelectExchangeDialog)
    {
        selectExchangeDialog = pSelectExchangeDialog;
    }

    public QUserProperties getUserProperties()
    {
        return userProperties;
    }

    public void setUserProperties(QUserProperties pUserProperties)
    {
        userProperties = pUserProperties;
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

    protected boolean findExchanges()
    {
        final Ticker selectedExchange = ActionHelper.getSelectedTickerName(output);
        if (selectedExchange != null)
        {
            exchanges.add(selectedExchange);
        }
        else
        {
            selectExchangeDialog.setVisible(true);
            if (selectExchangeDialog.isCancelled()) return false;
            exchanges.addAll(selectExchangeDialog.getSelectedTickers());
        }

        if (exchanges.isEmpty())
        {
            LOG.error("No selected exchange!");
            return false;
        }

        return true;
    }

    protected boolean askQuestions()
    {
        fromDate = ActionHelper.askDate(parent, "Since what date?", userProperties.getProperty(QTrendConstants.UserPropertyNames.USERPROP_LAST_SINCE_DATE,
                                                                                                      new LocalDate().toString()));
        if (fromDate == null) return false;
        userProperties.setProperty(QTrendConstants.UserPropertyNames.USERPROP_LAST_SINCE_DATE, fromDate);

        //  other parameters
        final String minimumPriceStr = JOptionPane.showInputDialog(parent, "Minimum price?", userProperties.getPropertyAsFloat(QTrendConstants.UserPropertyNames.USERPROP_MINIMUM_PRICE, 1.00f));
        if (minimumPriceStr == null) return false;
        minimumPrice = new Float(minimumPriceStr).floatValue();
        userProperties.setProperty(QTrendConstants.UserPropertyNames.USERPROP_MINIMUM_PRICE, String.valueOf(minimumPrice));

        final String volumeStr = JOptionPane.showInputDialog(parent, "Minimum volume?", userProperties.getPropertyAsInt(QTrendConstants.UserPropertyNames.USERPROP_MINIMUM_VOLUME, 100000));
        if (volumeStr == null) return false;
        minimumVolume = Integer.parseInt(volumeStr.trim());
        userProperties.setProperty(QTrendConstants.UserPropertyNames.USERPROP_MINIMUM_VOLUME, String.valueOf(minimumVolume));

        return true;
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommandWhichIsExchangeNameOrNull)
    {
        output.clear();

        //  get the excnage(s) for, either from selection or from question

        if (findExchanges() == false) return;
        if (askQuestions() == false) return;

        jobRunner.runJob(new DefaultJob() {
            public Object runJob() throws Exception
            {
                output.writeln(signal + " 'BUY' SIGNALS\n");
                output.writeln(QTrendConstants.Formats.DEFAULT_FORMAT_WITH_EMA56_EMA112.formatTitle(true));

                for (Ticker e : exchanges)
                {
                    final List<StockQuote> stockQuotes = stockQuotesService.findObsSignals(
                            e, minimumPrice, minimumVolume, maximumRsi, fromDate, signal);

                    if (!stockQuotes.isEmpty())
                    {
                        output.writeln(QTrendConstants.Formats.DEFAULT_FORMAT_WITH_EMA56_EMA112.format(stockQuotes));
                    }
                }

                return null;
            }

            public void onException(Exception e)
            {
                LOG.error("Could not find OBSs", e);
            }
        });
    }
}
