/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions;

import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;

import java.util.EventObject;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class ExitAction implements QEventHandler
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public ExitAction()
    {
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        //  need an array to avoid conurrent modifications
        final QTrendFrame[] frames = QTrendFrame.getAllFrames().toArray(new QTrendFrame[0]);
        for (QTrendFrame f : frames)
        {
            f.setVisible(false);
        }
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
