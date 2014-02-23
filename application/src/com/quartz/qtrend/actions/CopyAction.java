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

import java.awt.*;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.StringSelection;
import java.util.EventObject;

/**
 * The 'copy' action.
 *
 * @author Christian
 * @since Quartz...
 */
public class CopyAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private QTrendFrame frame = null;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public CopyAction()
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
        final String selection = frame.getOutput().getSelectedText();
        if (selection == null) return;

        final Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
        final StringSelection contents = new StringSelection(selection);
        clipboard.setContents(contents, contents);
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
