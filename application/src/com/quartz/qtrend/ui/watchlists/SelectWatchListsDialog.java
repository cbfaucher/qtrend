/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.ui.watchlists;

import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.watchlists.WatchListService;
import com.quartz.qutilities.swing.SwingUtils;
import com.quartz.qutilities.util.QUserProperties;
import org.springframework.beans.factory.InitializingBean;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.*;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class SelectWatchListsDialog extends JDialog implements InitializingBean
{
    private QUserProperties  userProperties;
    private WatchListService watchListService;
    private boolean isCancelled = true;
    private WatchListsPanel watchListsPanel;
    private static final String USERPROP_LAST_SELECTED_WATCHLISTS = "selected.watchlists";

    public SelectWatchListsDialog()
            throws HeadlessException
    {
        super();

        setModal(true);
        setTitle("Select WatchLists...");

        addWindowListener(new WindowAdapter()
        {
            public void windowClosing(WindowEvent e)
            {
                doCancel();
            }
        });
    }

    public boolean isCancelled()
    {
        return isCancelled;
    }

    public void setWatchListService(WatchListService pWatchListService)
    {
        watchListService = pWatchListService;
    }

    public void setUserProperties(QUserProperties pUserProperties)
    {
        userProperties = pUserProperties;
    }

    public java.util.List<String> select()
    {
        isCancelled = true;

        watchListsPanel.refreshList(Arrays.asList(userProperties.getUserPropertyAsArray(USERPROP_LAST_SELECTED_WATCHLISTS, new String[0])));

        pack();
        SwingUtils.centerWindow(this);

        setVisible(true);

        if (isCancelled == false)
        {
            final java.util.List<String> selectedLists = watchListsPanel.getSelectedWatchListNames();

            userProperties.setUserProperty(USERPROP_LAST_SELECTED_WATCHLISTS, selectedLists.toArray(new String[0]));

            return selectedLists;
        }
        else
        {
            return null;
        }
    }

    public void afterPropertiesSet() throws Exception
    {
        if (userProperties == null) throw new StockException("UserProperties not set.");
        if (watchListService == null) throw new StockException("WatchListService not set.");

        getContentPane().setLayout(new BorderLayout(5, 5));

        watchListsPanel = new WatchListsPanel();
        getContentPane().add(BorderLayout.CENTER, watchListsPanel);

        //  buttons
        final JPanel buttons = new JPanel(new FlowLayout(FlowLayout.RIGHT, 5, 5));
        //  ok
        final JButton okBtn = new JButton("Ok");
        okBtn.setMnemonic('O');
        okBtn.addActionListener(new ActionListener()
        {
            public void actionPerformed(ActionEvent e)
            {
                doOk();
            }
        });
        buttons.add(okBtn);
        //  cancel
        final JButton cancelBtn = new JButton("Cancel");
        cancelBtn.setMnemonic('C');
        cancelBtn.addActionListener(new ActionListener()
        {
            public void actionPerformed(ActionEvent e)
            {
                doCancel();
            }
        });
        buttons.add(cancelBtn);
        getContentPane().add(BorderLayout.SOUTH, buttons);
    }

    private void doOk()
    {
        isCancelled = false;

        setVisible(false);
    }

    private void doCancel()
    {
        isCancelled = true;

        setVisible(false);
    }

    class WatchListsPanel extends JPanel
    {
        final private java.util.List<JCheckBox> checkboxes = new ArrayList<JCheckBox>();

        WatchListsPanel()
        {
            setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));

        }

        void refreshList(java.util.List<String> pStrings)
        {
            this.removeAll();
            checkboxes.clear();

            final Collection<String> names = watchListService.getWatchListNames();

            if (names.size() > 0)
            {
                for (String s : names)
                {
                    final JCheckBox checkbox = new JCheckBox(s);

                    if (pStrings.contains(s)) checkbox.setSelected(true);

                    checkbox.setToolTipText(watchListService.getDescription(s));
                    checkboxes.add(checkbox);
                    add(checkbox);
                }
            }
            else
            {
                add(new JLabel("No Watchlist defined!"));
            }
        }

        java.util.List<String> getSelectedWatchListNames()
        {
            final java.util.List<String> selected = new ArrayList<String>();

            for (JCheckBox cb : checkboxes)
            {
                if (cb.isSelected()) selected.add(cb.getText());
            }

            return selected;
        }
    }
}
