/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.about;

import com.quartz.qtrend.ui.about.AboutDialog;
import com.quartz.qtrend.ui.about.VersionInformationNotFoundException;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;

import java.util.EventObject;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class AboutAction implements QEventHandler
{
    static private final ILog LOG = LogManager.getLogger(AboutAction.class);

    public AboutAction()
    {
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        try
        {
            final AboutDialog dialog = new AboutDialog();
            dialog.setVisible(true);
        }
        catch (VersionInformationNotFoundException e)
        {
            LOG.error("Could not display About dialog", e);
        }
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
