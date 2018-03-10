/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.graphs.ui;

import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventManager;

import java.util.EventObject;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class CloseAction implements QEventHandler, JFrameAware<GraphicFrame2>
{
    private GraphicFrame2 frame;

    public CloseAction()
    {
    }

    public void setFrame(GraphicFrame2 pGraphicFrame2)
    {
        frame = pGraphicFrame2;
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        frame.close();
    }
    ///////////////////////////////////////
    ////    INNER CLASSES
}
