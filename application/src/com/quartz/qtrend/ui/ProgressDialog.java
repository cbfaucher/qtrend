/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.ui;

import com.quartz.qtrend.util.Progress;
import com.quartz.qutilities.swing.SwingUtils;
import com.quartz.qutilities.util.MessageHandler;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;

import javax.swing.*;
import java.awt.*;

/**
 * A progres dialog on screen
 *
 * @author Christian
 * @since Quartz...
 */
public class ProgressDialog extends JDialog implements Progress
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(ProgressDialog.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final private JProgressBar      progressBar = new JProgressBar();
    final private JLabel            status = new JLabel();

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public ProgressDialog(JFrame pParent)
            throws HeadlessException
    {
        super(pParent, "Progress...", true);

        getContentPane().setLayout(new BorderLayout(5, 5));

        getContentPane().add(progressBar, BorderLayout.NORTH);
        getContentPane().add(status, BorderLayout.SOUTH);

        setSize(300, 100);

        progressBar.setIndeterminate(true);
        progressBar.setStringPainted(true);
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public JProgressBar getProgressBar()
    {
        return progressBar;
    }

    public void setVisible(final boolean b)
    {
        SwingUtils.invokeLaterIfNeeded(new Runnable() {
            public void run()
            {
                SwingUtils.centerWindow(ProgressDialog.this);

                ProgressDialog.super.setVisible(b);
            }
        });
    }

    public void setText(final String pText)
    {
        SwingUtils.invokeLaterIfNeeded(new Runnable() {
            public void run()
            {
                status.setText(pText);
                LOG.info(pText);
            }
        });

    }

    public void setMinMax(final int pMin, final int pMax)
    {
        SwingUtils.invokeLaterIfNeeded(new Runnable() {
            public void run()
            {
                progressBar.setMinimum(pMin);
                progressBar.setMaximum(pMax);
                progressBar.setIndeterminate(false);
                LOG.info("Min=" + pMin + "/Max=" + pMax);
            }
        });
    }

    public void reset()
    {
        SwingUtils.invokeLaterIfNeeded(new Runnable() {
            public void run()
            {
                progressBar.setValue(progressBar.getMinimum());
            }
        });
    }


    ///////////////////////////////////////
    ////    INNER CLASSES
    public void increment()
    {
        SwingUtils.invokeLaterIfNeeded(new Runnable() {
            public void run()
            {
                progressBar.setValue(progressBar.getValue() + 1);
            }
        });

    }
}
