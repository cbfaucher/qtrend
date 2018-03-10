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

import javax.swing.*;
import java.awt.*;
import java.util.EventObject;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class NewWindowAction implements QEventHandler, JFrameAware
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private JFrame parent;
    private QTrendFrame newFrame;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public NewWindowAction()
    {
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setNewFrame(QTrendFrame pNewFrame)
    {
        newFrame = pNewFrame;
    }

    public void setFrame(JFrame pJFrame)
    {
        parent = pJFrame;
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        newFrame.setVisible(true);

        final Point parentLocation = parent.getLocation();
        newFrame.setLocation((int) (parentLocation.getX() + 10), (int) (parentLocation.getY() + 10));
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
