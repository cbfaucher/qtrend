/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.graphs.ui;

import org.jfree.chart.JFreeChart;
import org.jfree.chart.ChartPanel;

import javax.swing.*;
import java.awt.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
class SubFrameDialog extends JDialog
{
    SubFrameDialog(JFrame pParent, String pTitle, JFreeChart pChart) throws HeadlessException
    {
        super(pParent, pTitle, true);

        getContentPane().setLayout(new BorderLayout(5, 5));

        getContentPane().add(BorderLayout.CENTER, new ChartPanel(pChart));

        addWindowListener(new WindowAdapter()
        {
            public void windowClosing(WindowEvent e)
            {
                close();
            }
        });
    }

    private void close()
    {
        setVisible(false);

        dispose();
    }
}
