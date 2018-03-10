/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.configuration;

import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventManager;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qtrend.ui.configuration.ConfigurationDialog;

import java.util.EventObject;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class ShowConfigurationAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    //   from spring
    private ConfigurationDialog configurationDialog;

    //  from frame
    private QTrendFrame frame;

    public ShowConfigurationAction()
    {
    }

    public void setConfigurationDialog(ConfigurationDialog pConfigurationDialog)
    {
        configurationDialog = pConfigurationDialog;
    }

    public void setFrame(QTrendFrame pFrame)
    {
        frame = pFrame;
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        configurationDialog.setVisible(true);
    }
}
