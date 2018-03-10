/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.stockcharts;

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
public class ShowStockchartGraphicsAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(ShowStockchartGraphicsAction.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private QProperties properties;
    private QUserProperties userProperties;

    private QTrendFrame parent;
    private Output output;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public ShowStockchartGraphicsAction()
    {

    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setProperties(QProperties pProperties)
    {
        properties = pProperties;
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
        final String url = properties.getProperty("graphics.url");
        final String browser = properties.getProperty("browser.command");

        String ticker = output.getSelectedText();

        if (ticker == null)
        {
            ticker = JOptionPane.showInputDialog(parent, "What is the ticker?", userProperties.getProperty(
                    QTrendConstants.UserPropertyNames.USERPROP_LAST_TICKER, ""));
            if (ticker == null) return;
            userProperties.setProperty(QTrendConstants.UserPropertyNames.USERPROP_LAST_TICKER, ticker);
        }

        final String monthstr = JOptionPane.showInputDialog(parent, "For how many months back?", userProperties.getPropertyAsInt(
                QTrendConstants.UserPropertyNames.USERPROP_MONTHS_BACK, 3));
        if (monthstr == null) return;
        userProperties.setProperty(QTrendConstants.UserPropertyNames.USERPROP_MONTHS_BACK, monthstr);

        final String theUrl = url.replaceAll("#TICKER#", ticker).replaceAll("#MONTH#", monthstr);

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
