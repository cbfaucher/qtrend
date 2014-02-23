/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.ui;

import com.quartz.qutilities.swing.SwingUtils;
import com.quartz.qutilities.util.MessageHandler;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import org.apache.commons.lang.exception.ExceptionUtils;

import javax.swing.*;
import java.awt.*;


/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class QTrendMessageHandler extends JTextArea implements MessageHandler
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(QTrendMessageHandler.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public QTrendMessageHandler()
    {
        setEditable(false);
        setFont(new Font("Courier New", Font.PLAIN, 9));

        setText("Welcome to QTrend!");
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void info(final String pMsg)
    {
        LOG.info(pMsg);
        SwingUtils.invokeLaterIfNeeded(new Runnable() {
            public void run()
            {
                QTrendMessageHandler.this.append(pMsg + "\n");
            }
        });
    }

    public void error(String pMsg)
    {
        error(pMsg, null);
    }

    public void error(final String pMsg, final Throwable pThrowable)
    {
        LOG.error(pMsg, pThrowable);
        SwingUtils.invokeLaterIfNeeded(new Runnable() {
            public void run()
            {
                append("ERROR: ");
                append(pMsg);

                if (pThrowable != null)
                {
                    append(ExceptionUtils.getFullStackTrace(pThrowable));
                }
            }
        });

    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
