/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.yahoo;

import com.quartz.qtrend.QTrendConstants;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;
import com.quartz.qutilities.util.QProperties;
import com.quartz.qutilities.util.QUserProperties;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;

import javax.swing.*;
import java.io.IOException;
import java.util.EventObject;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class ShowYahooSummaryAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(ShowYahooSummaryAction.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private QProperties properties;
    private QUserProperties userProperties;
    private QTrendFrame frame;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public ShowYahooSummaryAction()
    {
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setFrame(QTrendFrame pFrame)
    {
        frame = pFrame;
    }

    public void setProperties(QProperties pProperties)
    {
        properties = pProperties;
    }

    public void setUserProperties(QUserProperties pUserProperties)
    {
        userProperties = pUserProperties;
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        final Output output = frame.getOutput();

        String ticker = output.getSelectedText();

        if (ticker == null)
        {
            ticker = JOptionPane.showInputDialog(frame, "What is the ticker?", userProperties.getUserProperty(
                    QTrendConstants.UserPropertyNames.USERPROP_LAST_TICKER, ""));
            if (ticker == null) return;
            userProperties.setUserProperty(QTrendConstants.UserPropertyNames.USERPROP_LAST_TICKER, ticker);
        }

        final String url = properties.getProperty("yahoo.summary.url");
        final String browser = properties.getProperty("browser.command");

        final String theUrl = url.replaceAll("#TICKER#", ticker);

        try
        {
            final Process process = Runtime.getRuntime().exec(browser + " \"" + theUrl + "\"");
        }
        catch (IOException e1)
        {
            LOG.error("Error opening browser: " + browser + " " + theUrl, e1);
        }


    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
