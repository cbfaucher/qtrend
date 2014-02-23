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
import org.springframework.beans.factory.InitializingBean;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.ArrayList;
import java.util.Collection;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class SelectSingleWatchListDialog extends JDialog implements InitializingBean
{
    private WatchListService watchListService;
    private boolean isCancelled = true;
    private WatchListsPanel watchListsPanel;

    public SelectSingleWatchListDialog()
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

    public String select()
    {
        isCancelled = true;

        watchListsPanel.refreshList();

        pack();
        SwingUtils.centerWindow(this);

        setVisible(true);

        return isCancelled ? null : watchListsPanel.getSelectedWatchListName();
    }

    public void afterPropertiesSet() throws Exception
    {
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
        final private ButtonGroup buttonGroup = new ButtonGroup();
        final private java.util.List<JRadioButton> radiobuttons = new ArrayList<JRadioButton>();

        WatchListsPanel()
        {
            setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));

        }

        void refreshList()
        {
            this.removeAll();
            radiobuttons.clear();

            final Collection<String> names = watchListService.getWatchListNames();

            if (names.size() > 0)
            {
                for (String s : names)
                {
                    final JRadioButton watchlistRB = new JRadioButton(s);
                    watchlistRB.setToolTipText(watchListService.getDescription(s));
                    buttonGroup.add(watchlistRB);
                    radiobuttons.add(watchlistRB);
                    add(watchlistRB);
                }

                radiobuttons.get(0).setSelected(true);
            }
            else
            {
                add(new JLabel("No Watchlist defined!"));
            }
        }

        String getSelectedWatchListName()
        {
            for (JRadioButton rb : radiobuttons)
            {
                if (rb.isSelected()) return rb.getText();
            }

            return null;
        }
    }
}
