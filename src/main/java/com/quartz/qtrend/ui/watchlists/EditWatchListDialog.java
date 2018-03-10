/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.ui.watchlists;

import com.quartz.qtrend.dom.watchlists.WatchList;
import com.quartz.qutilities.swing.SwingUtils;
import org.springframework.beans.factory.InitializingBean;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class EditWatchListDialog extends JDialog implements InitializingBean
{
    final private EditWatchListPanel editWatchListPanel = new EditWatchListPanel();

    private boolean isCancelled = true;
    private WatchList watchList;

    public EditWatchListDialog()
            throws HeadlessException
    {
        super();
    }

    public boolean isCancelled()
    {
        return isCancelled;
    }

    public boolean edit(WatchList pWatchList)
    {
        watchList = pWatchList;

        editWatchListPanel.setWatchList(watchList);

        setVisible(true);

        return !isCancelled();
    }

    public void afterPropertiesSet() throws Exception
    {
        getContentPane().setLayout(new BorderLayout(5, 5));

        getContentPane().add(BorderLayout.CENTER, editWatchListPanel);

        final JPanel buttons = new JPanel(new FlowLayout(FlowLayout.RIGHT));
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
        //  delete
        final JButton deleteBtn = new JButton("Cancel");
        deleteBtn.setMnemonic('C');
        deleteBtn.addActionListener(new ActionListener()
        {
            public void actionPerformed(ActionEvent e)
            {
                doCancel();
            }
        });
        buttons.add(deleteBtn);
        getContentPane().add(BorderLayout.SOUTH, buttons);

        pack();
        SwingUtils.centerWindow(this);
    }

    private void doOk()
    {
        editWatchListPanel.saveChanges();

        isCancelled = false;

        setVisible(false);
    }

    private void doCancel()
    {
        isCancelled = true;

        setVisible(false);
    }
}

