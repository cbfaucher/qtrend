/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions;

import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;

import java.util.EventObject;

/**
 * Selects all on the currnet output
 *
 * @author Christian
 * @since Quartz...
 */
public class SelectAllAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private QTrendFrame frame;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public SelectAllAction()
    {
    }         

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setFrame(QTrendFrame pQTrendFrame)
    {
        frame = pQTrendFrame;
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        frame.getOutput().selectAll();
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
