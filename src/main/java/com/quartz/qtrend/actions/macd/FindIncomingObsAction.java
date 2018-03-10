/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.macd;

import com.quartz.qtrend.QTrendConstants;
import com.quartz.qtrend.actions.helpers.FindIncomingSignalAction;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qutilities.jobrunner.DefaultJob;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.events.QEventManager;
import com.quartz.qutilities.util.Output;

import javax.swing.*;
import java.util.EventObject;
import java.util.List;

/**
 * Find incoming OBS (based on MACD)
 *
 * @author Christian
 * @since Quartz...
 */
public class FindIncomingObsAction extends FindIncomingSignalAction
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(FindIncomingObsAction.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public FindIncomingObsAction()
    {
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        final Output output = frame.getOutput();

        output.clear();

        try
        {
            final String manyDaysStr = JOptionPane.showInputDialog(
                    frame, "How many days ahead?", userProperties.getProperty(
                            QTrendConstants.UserPropertyNames.USERPROP_LAST_NEXT_SIGNAL_DAYS, "2"));
            if (manyDaysStr == null) return;
            final int manyDays = Integer.parseInt(manyDaysStr);
            userProperties.setProperty(QTrendConstants.UserPropertyNames.USERPROP_LAST_NEXT_SIGNAL_DAYS, "" + manyDays);

            final String rsiStr = JOptionPane.showInputDialog(frame, "RSI below?", userProperties.getPropertyAsInt(QTrendConstants.UserPropertyNames.USERPROP_OBS_MAX_RSI, 30));
            if (rsiStr == null) return;
            final int maxRsi = Integer.parseInt(rsiStr.trim());
            userProperties.setProperty(QTrendConstants.UserPropertyNames.USERPROP_OBS_MAX_RSI, String.valueOf(maxRsi));

            jobRunner.runJob(new DefaultJob()
            {
                public Object runJob() throws Exception
                {
                    final List<StockQuote> quotes = stockQuotesService.findIncomingObs(manyDays, maxRsi);

                    output.writeln(QTrendConstants.Formats.DEFAULT_FORMAT_WITH_EMA56_EMA112.formatTitle(true));
                    output.writeln(QTrendConstants.Formats.DEFAULT_FORMAT_WITH_EMA56_EMA112.format(quotes));

                    return null;
                }

                public void onException(Exception e)
                {
                    LOG.error("COuld not find incoming OBS", e);
                }
            });

        }
        catch(NumberFormatException e)
        {
            LOG.error("Could not read number from input value.", e);
        }
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
