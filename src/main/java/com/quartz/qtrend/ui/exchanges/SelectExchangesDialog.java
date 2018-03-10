/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.ui.exchanges;

import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.SwingUtils;
import com.quartz.qtrend.dom.helpers.Ticker;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.util.Collection;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class SelectExchangesDialog extends JDialog implements ActionListener
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(SelectExchangesDialog.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private SelectTickersPanel  panel;
    private boolean             cancelled = true;
    private Collection<Ticker> selectedTickers = null;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public SelectExchangesDialog()
            throws HeadlessException
    {
        super();
    }

    public void setSubTitle(JComponent pComponent)
    {
        getContentPane().add(BorderLayout.NORTH, pComponent);
    }

    public void setExchangePanel(SelectTickersPanel pPanel)
    {
        panel = pPanel;
        getContentPane().add(BorderLayout.CENTER, pPanel);
    }

    public void setButtonPanel(ButtonPanel pPanel)
    {
        pPanel.setActionListener(this);
        getContentPane().add(BorderLayout.SOUTH, pPanel);
    }

    public void actionPerformed(ActionEvent e)
    {
        if ("ExchangeDialog.OkEvent".equalsIgnoreCase(e.getActionCommand()))
        {
            selectedTickers = panel.getSelectedTickers();

            cancelled = false;
            setVisible(false);
        }
        else if ("ExchangeDialog.CancelEvent".equalsIgnoreCase(e.getActionCommand()))
        {
            cancelled = true;
            setVisible(false);
        }
        else
        {
            LOG.warn("Unknown ActionCommand:  " + e.getActionCommand());
        }
    }

    public boolean isCancelled()
    {
        return cancelled;
    }

    public Collection<Ticker> getSelectedTickers()
    {
        return selectedTickers;
    }

    public void setVisible(boolean b)
    {
        if (b)
        {
            pack();
            SwingUtils.centerWindow(this);
        }
        else
        {
            panel.saveSelectionState();
        }

        super.setVisible(b);
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    ///////////////////////////////////////
    ////    INNER CLASSES
}
