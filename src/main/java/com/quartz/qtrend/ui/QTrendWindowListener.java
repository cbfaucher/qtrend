/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.ui;

import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
class QTrendWindowListener extends WindowAdapter
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final private QTrendFrame frame;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    QTrendWindowListener(QTrendFrame pFrame)
    {
        frame = pFrame;
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void windowClosing(WindowEvent e)
    {
        frame.setVisible(false);
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
