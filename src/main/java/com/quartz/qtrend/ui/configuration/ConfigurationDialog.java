/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.ui.configuration;

import org.springframework.beans.factory.InitializingBean;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import com.quartz.qutilities.swing.SwingUtils;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class ConfigurationDialog extends JDialog implements InitializingBean
{
    final private JTabbedPane tabbedPane = new JTabbedPane();

    //  from spring
    private AlertsPanel alertsPanel = null;
    private final JButton okButton = new JButton("Ok");
    private final JButton cancelButton = new JButton("Cancel");
    private final JButton applyButton = new JButton("Apply");

    public ConfigurationDialog()
            throws HeadlessException
    {
        super();

        addWindowListener(new WindowAdapter()
        {
            public void windowClosing(WindowEvent e)
            {
                close();
            }
        });
    }

    public void setAlertsPanel(AlertsPanel pAlertsPanel)
    {
        alertsPanel = pAlertsPanel;
    }

    public void afterPropertiesSet() throws Exception
    {
        if (alertsPanel == null) throw new IllegalStateException("Alerts Panel not set.");

        getContentPane().add(BorderLayout.CENTER, tabbedPane);

        tabbedPane.add("Alerts", alertsPanel);

        buildButtonPanel();

        pack();
        SwingUtils.centerWindow(this);
    }

    private void buildButtonPanel()
    {
        final JPanel buttons = new JPanel(new FlowLayout(FlowLayout.RIGHT));

        okButton.setMnemonic('O');
        okButton.addActionListener(new ActionListener()
        {
            public void actionPerformed(ActionEvent e)
            {
                save();
                close();
            }
        });
        buttons.add(okButton);

        cancelButton.setMnemonic('C');
        cancelButton.addActionListener(new ActionListener()
        {
            public void actionPerformed(ActionEvent e)
            {
                close();
            }
        });
        buttons.add(cancelButton);

        applyButton.setMnemonic('A');
        applyButton.addActionListener(new ActionListener()
        {
            public void actionPerformed(ActionEvent e)
            {
                save();
            }
        });
        buttons.add(applyButton);

        getContentPane().add(BorderLayout.SOUTH, buttons);
    }

    private void close()
    {
        setVisible(false);
    }

    private void save()
    {
        alertsPanel.save();
    }


}

