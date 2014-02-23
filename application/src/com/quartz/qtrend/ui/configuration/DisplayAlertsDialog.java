/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.ui.configuration;

import com.quartz.qutilities.swing.SwingUtils;
import com.quartz.qutilities.util.QUserProperties;
import com.quartz.qtrend.QTrendConstants;
import com.quartz.qtrend.dom.alerts.Alert;
import com.quartz.qtrend.dom.alerts.ToAlertConverter;
import org.springframework.beans.factory.InitializingBean;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;
import java.util.HashMap;

/**
 * Selection of alerts to display
 *
 * @author Christian
 * @since Quartz...
 */
public class DisplayAlertsDialog extends JDialog implements InitializingBean
{

    //  spring
    private QUserProperties userProperties;

    final private java.util.List<JCheckBox> favoriteAlertCheckboxes = new ArrayList<JCheckBox>();

    final private java.util.List<Alert> selectedAlertNames = new ArrayList<Alert>();
    private boolean isCancelled = false;
    private final JButton okButton = new JButton("Ok");
    private Map<String, Alert> alertsToNames = new HashMap<String, Alert>();

    public DisplayAlertsDialog()
            throws HeadlessException
    {
        super();
    }

    public void setUserProperties(QUserProperties pUserProperties)
    {
        userProperties = pUserProperties;
    }

    public void afterPropertiesSet() throws Exception
    {
        setTitle("Select Alerts to display...");
        setLayout(new BorderLayout(5, 5));
        setModal(true);
        addWindowListener(new WindowAdapter()
        {
            {
                onCancel();
            }
        });

        //  favorite alerts
        final Collection<Alert> favoriteAlerts = userProperties.getUserPropertyAsCollection(
                QTrendConstants.UserPropertyNames.USERPROP_ORDERED_ALERTS, new ToAlertConverter());

        final CheckboxPanel favoriteAlertsPanel = new CheckboxPanel("Favorite alerts:");
        for (Alert alert : favoriteAlerts)
        {
            alertsToNames.put(alert.getFullName(), alert);
            final JCheckBox cb = new JCheckBox(alert.getFullName());
            cb.setSelected(true);
            favoriteAlertCheckboxes.add(cb);
            favoriteAlertsPanel.add(cb);
        }
        add(BorderLayout.CENTER, favoriteAlertsPanel);

        //  buttons and panel
        final JPanel buttonsPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT));
        okButton.setMnemonic('O');
        okButton.addActionListener(new ActionListener()
        {
            public void actionPerformed(ActionEvent e)
            {
                onOk();
            }
        });
        buttonsPanel.add(okButton);
        final JButton cancelButton = new JButton("Cancel");
        cancelButton.setMnemonic('C');
        cancelButton.setDefaultCapable(true);
        cancelButton.addActionListener(new  ActionListener()
        {
            public void actionPerformed(ActionEvent e)
            {
                onCancel();
            }
        });
        buttonsPanel.add(cancelButton);
        add(BorderLayout.SOUTH, buttonsPanel);

        pack();
        SwingUtils.centerWindow(this);
    }

    private void onOk()
    {
        isCancelled = false;
        setVisible(false);
    }

    private void onCancel()
    {
        isCancelled = true;
        setVisible(false);
    }

    public boolean isCancelled()
    {
        return isCancelled;
    }

    public Collection<Alert> getSelectedAlertNames()
    {
        return selectedAlertNames;
    }

    public void setVisible(boolean b)
    {
        if (b == true)
        {
            selectedAlertNames.clear();
        }
        else
        {
            //  save selections
            for (JCheckBox cb : favoriteAlertCheckboxes)
            {
                if (cb.isSelected())
                {
                    final Alert alert = alertsToNames.get(cb.getText());
                    selectedAlertNames.add(alert);
                }
            }
        }

        super.setVisible(b);

        if (!b) dispose();
    }

    public boolean hasAlertsToDisplay()
    {
        return !favoriteAlertCheckboxes.isEmpty();    
    }

    private class CheckboxPanel extends JPanel
    {
        final private JPanel subPanel = new JPanel();
        public CheckboxPanel(final String title)
        {
            setLayout(new BorderLayout(5, 5));

            add(BorderLayout.NORTH, new JLabel(title));

            subPanel.setLayout(new BoxLayout(subPanel, BoxLayout.Y_AXIS));
            add(BorderLayout.CENTER, subPanel);

            setBorder(BorderFactory.createLineBorder(Color.LIGHT_GRAY));
        }

        public void add(JCheckBox pJCheckBox)
        {
            subPanel.add(pJCheckBox);
        }
    }
}
