/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.ui;

import com.quartz.qtrend.QTrendEvents;
import com.quartz.qtrend.ui.menus.MenuFactory;
import com.quartz.qutilities.swing.SwingUtils;
import com.quartz.qutilities.util.Output;

import javax.swing.*;
import java.awt.*;
import java.awt.event.KeyEvent;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class TextAreaOutput extends JTextArea implements Output
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

    public TextAreaOutput(QTrendFrame pQTrendFrame)
    {
        frame = pQTrendFrame;

        setEditable(false);

        final Font f = getFont();
        setFont(new Font("Courier New", Font.PLAIN, f.getSize()));

        final JPopupMenu popupMenu = new JPopupMenu();

        popupMenu.add(MenuFactory.createMenuItem(frame, "Show History", KeyEvent.VK_Y, QTrendEvents.SHOW_HISTORY));
        popupMenu.add(MenuFactory.createMenuItem(frame, "Estimate Profit or Loss...", KeyEvent.VK_E, QTrendEvents.ESTIMATE_PROFIT_OR_LOSS));
        popupMenu.addSeparator();
        popupMenu.add(MenuFactory.createMenuItem(frame, "Show Summary on Yahoo!", KeyEvent.VK_S, "Event.ShowYahooSummary"));
        popupMenu.addSeparator();
        popupMenu.add(MenuFactory.createMenuItem(frame, "Show Graphics...", KeyEvent.VK_G, QTrendEvents.SHOW_GRAPHIC));
        popupMenu.add(MenuFactory.createMenuItem(frame, "Show Graphics on StockCharts.com...", KeyEvent.VK_R, QTrendEvents.SHOW_STOCKCHART_GRAPHICS));
        popupMenu.addSeparator();
        popupMenu.add(MenuFactory.createMenuItem(frame, "Import Ticker History...", KeyEvent.VK_M, QTrendEvents.IMPORT_TICKER_HISTORY));

        setComponentPopupMenu(popupMenu);

        setText("Welcome to QTrend!");
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setPosition(final int pCharIndex)
    {
        SwingUtils.invokeLaterIfNeeded(new Runnable() {
            public void run()
            {
                setCaretPosition(pCharIndex);
            }
        });
    }

    public void writeln(String pText)
    {
        write(pText + "\n");
    }

    public void writeln()
    {
        write("\n");
    }

    public void write(final String pText)
    {
        SwingUtils.invokeLaterIfNeeded(new Runnable() {
                public void run()
                {
                    System.out.println(pText);
                    append(pText);
                }
            });
    }

    public void clear()
    {
        setText("");
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
