/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is 
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.ui.menus;

import com.quartz.qutilities.swing.events.QEventActionListener;
import com.quartz.qutilities.swing.events.QEventFrame;
import com.quartz.qtrend.QTrendEvents;

import javax.swing.*;
import java.awt.event.KeyEvent;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class MenuFactory
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    ///////////////////////////////////////
    ////    CONSTRUCTORS
    
    private MenuFactory()
    {
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    static public JMenuItem createMenuItem(QEventFrame pFrame, String pLabel, Integer pMnemonic, String pEventId)
    {
        final JMenuItem menuItem = new JMenuItem(pLabel);
        if (pMnemonic != null) menuItem.setMnemonic(pMnemonic);
        menuItem.addActionListener(new QEventActionListener(pFrame, pEventId));
        return menuItem;
    }

    static public JMenuItem createNewWindowMenuItem(QEventFrame pFrame)
    {
        final JMenuItem menuItem = new JMenuItem("New Window");

        menuItem.setMnemonic(KeyEvent.VK_N);
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_N, KeyEvent.CTRL_MASK));
        menuItem.addActionListener(new QEventActionListener(pFrame, QTrendEvents.NEW_WINDOW));

        return menuItem;
    }

    static public JMenuItem createImportEodDataMenuItem(QEventFrame pFrame)
    {
        final JMenuItem menuItem = new JMenuItem("Import...");

        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_I, KeyEvent.CTRL_MASK));
        menuItem.setMnemonic(KeyEvent.VK_I);
        menuItem.addActionListener(new QEventActionListener(pFrame, QTrendEvents.IMPORT_EOD_DATA));

        return menuItem;
    }

    static public JMenuItem createImportTickerHistoryMenuItem(QEventFrame pFrame)
    {
        final JMenuItem menuItem = new JMenuItem("Import Ticker History...");

        menuItem.addActionListener(new QEventActionListener(pFrame, QTrendEvents.IMPORT_TICKER_HISTORY));
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_M, KeyEvent.CTRL_MASK));
        menuItem.setMnemonic(KeyEvent.VK_M);

        return menuItem;
    }

    static public JMenuItem createImportTickersNamesMenuItem(QEventFrame pFrame)
    {
        final JMenuItem menuItem = new JMenuItem("Import Ticker Names...");

        menuItem.addActionListener(new QEventActionListener(pFrame, QTrendEvents.IMPORT_TICKER_NAMES));
        menuItem.setMnemonic(KeyEvent.VK_N);
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_I, KeyEvent.SHIFT_MASK));

        return menuItem;
    }

    static public JMenuItem createShowHistoryMenuItem(QEventFrame pFrame)
    {
        final JMenuItem menuItem = new JMenuItem("Show History");

        menuItem.setMnemonic(KeyEvent.VK_Y);
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_Y, KeyEvent.CTRL_MASK));
        menuItem.addActionListener(new QEventActionListener(pFrame, QTrendEvents.SHOW_HISTORY));

        return menuItem;
    }

    static public JMenuItem createCloseWindowMenuItem(QEventFrame pFrame)
    {
        final JMenuItem menuItem = new JMenuItem("Close");

        menuItem.addActionListener(new QEventActionListener(pFrame, QTrendEvents.CLOSE_WINDOW));
        menuItem.setMnemonic(KeyEvent.VK_C);
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_F4, KeyEvent.CTRL_MASK));

        return menuItem;
    }

    static public JMenuItem createExitMenuItem(QEventFrame pFrame)
    {
        final JMenuItem menuItem = new JMenuItem("Exit");

        menuItem.setMnemonic(KeyEvent.VK_X);
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_F4, KeyEvent.ALT_MASK));
        menuItem.addActionListener(new QEventActionListener(pFrame, QTrendEvents.EXIT));

        return menuItem;
    }

    static public JMenuItem createCopyMenuItem(QEventFrame pFrame)
    {
        final JMenuItem menuItem = new JMenuItem("Copy");

        menuItem.setMnemonic(KeyEvent.VK_C);
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_C, KeyEvent.CTRL_MASK));
        menuItem.addActionListener(new QEventActionListener(pFrame));

        return menuItem;
    }

    static public JMenuItem createShowGraphicMenuItem(QEventFrame pFrame)
    {
        final JMenuItem menuItem = new JMenuItem("Show Graphics...");

        menuItem.setMnemonic(KeyEvent.VK_G);
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_G, KeyEvent.CTRL_MASK));
        menuItem.addActionListener(new QEventActionListener(pFrame, QTrendEvents.SHOW_GRAPHIC));

        return menuItem;
    }

    static public JMenuItem createFindIncomingObsMenuItem(QEventFrame pFrame)
    {
        final JMenuItem menuItem = new JMenuItem("Find possible incoming OBS...");

        menuItem.setMnemonic(KeyEvent.VK_P);
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_B, KeyEvent.SHIFT_MASK|KeyEvent.CTRL_MASK));

        menuItem.addActionListener(new QEventActionListener(pFrame, QTrendEvents.FIND_INCOMING_OBS_SIGNALS));

        return menuItem;
    }

    static public JMenuItem createFindIncomingOssMenuItem(QEventFrame pFrame)
    {
        final JMenuItem menuItem = new JMenuItem("Find possible incoming OSS...");

        menuItem.setMnemonic(KeyEvent.VK_P);
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_S, KeyEvent.SHIFT_MASK|KeyEvent.CTRL_MASK));

        menuItem.addActionListener(new QEventActionListener(pFrame, QTrendEvents.FIND_INCOMING_OSS_SIGNALS));

        return menuItem;
    }

    static public JMenuItem createFindPriceDropsMenuItem(QEventFrame pFrame)
    {
        final JMenuItem menuItem = new JMenuItem("Find Price Drops...");

        menuItem.setMnemonic(KeyEvent.VK_D);
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_D, KeyEvent.CTRL_MASK));
        menuItem.addActionListener(new QEventActionListener(pFrame, QTrendEvents.FIND_PRICE_DROPS));

        return menuItem;
    }

    static public JMenuItem createFindOversoldStocksMenuItem(QEventFrame pFrame)
    {
        final JMenuItem menuItem = new JMenuItem("Find Oversold Stocks (low RSI)...");

        menuItem.setMnemonic(KeyEvent.VK_V);
        menuItem.addActionListener(new QEventActionListener(pFrame, QTrendEvents.FIND_OVERSOLD_STOCKS));

        return menuItem;
    }

    static public JMenuItem createFindOverboughtStocksMenuItem(QEventFrame pFrame)
    {
        final JMenuItem menuItem = new JMenuItem("Find Overbought Stocks (high RSI)...");

        menuItem.setMnemonic(KeyEvent.VK_B);
        menuItem.addActionListener(new QEventActionListener(pFrame, QTrendEvents.FIND_OVERBOUGHT_STOCKS));

        return menuItem;
    }

    static public JMenuItem createCalculateProfitOrLossMenuItem(QEventFrame pFrame)
    {
        final JMenuItem menuItem = new JMenuItem("Estimate Profit or Loss...");

        menuItem.setMnemonic(KeyEvent.VK_E);
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_E, KeyEvent.CTRL_MASK));
        menuItem.addActionListener(new QEventActionListener(pFrame, QTrendEvents.ESTIMATE_PROFIT_OR_LOSS));

        return menuItem;
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
