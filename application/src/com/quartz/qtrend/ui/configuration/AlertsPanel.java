/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.ui.configuration;

import com.quartz.qtrend.QTrendConstants;
import com.quartz.qtrend.dom.alerts.*;
import com.quartz.qtrend.dom.watchlists.WatchListService;
import com.quartz.qutilities.util.QUserProperties;
import org.springframework.beans.factory.InitializingBean;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.Collection;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class AlertsPanel extends JPanel implements InitializingBean
{

    final private DefaultListModel allAlertsModel = new DefaultListModel();
    final private DefaultListModel selectedAlertsModel = new DefaultListModel();

    final private JList            allAlertsList = new JList(allAlertsModel);
    final private JList            selectedAlertsList = new JList(selectedAlertsModel);

    final private JButton          addSelectedBtn = new JButton();
    final private JButton          removeSelectedBtn = new JButton();
    final private JButton          moveUpBtn = new JButton();
    final private JButton          moveDownBtn = new JButton();

    private QUserProperties   userProperties;
    private WatchListService  watchListService;

    public AlertsPanel()
    {
    }

    public void setUserProperties(QUserProperties pUserProperties)
    {
        userProperties = pUserProperties;
    }

    public void setWatchListService(WatchListService pWatchListService)
    {
        watchListService = pWatchListService;
    }

    public void afterPropertiesSet() throws Exception
    {
        if (userProperties == null) throw new IllegalStateException("UserProperties not set.");
        if (watchListService == null) throw new IllegalStateException("WatchListService not set.");

        this.setLayout(new GridLayout(1, 3));

        setupAllAlertsList();
        setupSwitchButtonsPanel();
        setupSelectedAlertsList();
    }

    private void setupSelectedAlertsList()
    {
        final JPanel panel = new JPanel(new BorderLayout());

        panel.add(BorderLayout.NORTH, new JLabel("Selected Alerts:"));

        final Collection<Alert> selectedAlerts = userProperties.getUserPropertyAsCollection(
                QTrendConstants.UserPropertyNames.USERPROP_ORDERED_ALERTS, new ToAlertConverter());

        for (Alert alert : selectedAlerts)
        {
            selectedAlertsModel.addElement(alert);

            if (alert.getAlertName().isMultipleSupported() == false) allAlertsModel.removeElement(alert.getAlertName());
        }

        panel.add(BorderLayout.CENTER, new JScrollPane(selectedAlertsList));
        add(/*BorderLayout.EAST, */panel);
    }

    private void setupSwitchButtonsPanel()
    {
        final JPanel panel = new JPanel();
        panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));

        moveUpBtn.setText("^");
        moveUpBtn.addActionListener(new ActionListener()
        {
            public void actionPerformed(ActionEvent e)
            {
                moveUp();
            }
        });
        panel.add(moveUpBtn);

        addSelectedBtn.setText("+");
        addSelectedBtn.addActionListener(new ActionListener()
        {
            public void actionPerformed(ActionEvent e)
            {
                selectAlert();
            }
        });
        panel.add(addSelectedBtn);

        removeSelectedBtn.setText("-");
        removeSelectedBtn.addActionListener(new ActionListener()
        {
            public void actionPerformed(ActionEvent e)
            {
                unselectAlert();
            }
        });
        panel.add(removeSelectedBtn);

        moveDownBtn.setText("v");
        moveDownBtn.addActionListener(new ActionListener()
        {
            public void actionPerformed(ActionEvent e)
            {
                moveDown();
            }
        });
        panel.add(moveDownBtn);

        add(/*BorderLayout.CENTER, */panel);
    }

    private void selectAlert()
    {
        final int index = allAlertsList.getSelectedIndex();

        if (index >= 0)
        {
            final AlertName alertName = (AlertName) allAlertsModel.getElementAt(index);

            final Alert alert = new Alert(alertName);

            for (IAlertParameter ap : alertName.getParameters())
            {
                final IChoiceRetriever retriever = ap.getChoiceRetriever();

                final Object value;
                if (retriever == null)
                {
                    value = JOptionPane.showInputDialog(
                            this,
                            "Enter value for " + ap.getDisplayName() + "(" + ap.getName() + "): ",
                            "Enter value...",
                            JOptionPane.QUESTION_MESSAGE);
                }
                else
                {
                    final Collection chcoies = retriever.getChoices();
                    value = JOptionPane.showInputDialog(
                            this,
                            "Enter value for " + ap.getDisplayName() + "(" + ap.getName() + "): ",
                            "Enter value...",
                            JOptionPane.QUESTION_MESSAGE,
                            null,
                            chcoies.toArray(),
                            null);
                }

                if (value == null) return;  //abort

                alert.addParameter(ap, ap.convertAndValidate(value));
            }

            selectedAlertsModel.addElement(alert);
            selectedAlertsList.setSelectedValue(alert, true);

            if (!alertName.isMultipleSupported()) allAlertsModel.removeElementAt(index);
        }
    }

    private void unselectAlert()
    {
        final int index = selectedAlertsList.getSelectedIndex();

        if (index >= 0)
        {
            final Alert alert = (Alert) selectedAlertsModel.getElementAt(index);
            selectedAlertsModel.removeElementAt(index);

            if (!alert.getAlertName().isMultipleSupported())
            {
                allAlertsModel.addElement(alert.getAlertName());
            }

            allAlertsList.setSelectedValue(alert.getAlertName(), true);
        }
    }


    private void moveUp()
    {
        final int index = selectedAlertsList.getSelectedIndex();

        if (index > 0)
        {
            final Object v = selectedAlertsModel.getElementAt(index);
            selectedAlertsModel.removeElementAt(index);
            selectedAlertsModel.insertElementAt(v, index-1);
            selectedAlertsList.setSelectedValue(v, true);
        }
    }

    private void moveDown()
    {
        final int index = selectedAlertsList.getSelectedIndex();

        if (index >= 0 && index < selectedAlertsModel.size() - 1)
        {
            final Object v = selectedAlertsModel.getElementAt(index);
            selectedAlertsModel.removeElementAt(index);
            selectedAlertsModel.insertElementAt(v, index+1);
            selectedAlertsList.setSelectedValue(v, true);
        }
    }


    private void setupAllAlertsList()
    {
        final JPanel panel = new JPanel(new BorderLayout());

        panel.add(BorderLayout.NORTH, new JLabel("Unused alerts:"));

        //  add possible alerts
        for (final AlertName a : AlertName.values())
        {
            allAlertsModel.addElement(a);
        }

        panel.add(BorderLayout.CENTER, new JScrollPane(allAlertsList));
        add(/*BorderLayout.WEST, */panel);
    }

    void save()
    {
        final int nbSelected = selectedAlertsModel.size();

        if (nbSelected > 0)
        {
            final java.util.List<Alert> alerts = new ArrayList<Alert>();
            for (int i = 0; i < nbSelected; i++)
            {
                alerts.add((Alert) selectedAlertsModel.getElementAt(i));
            }
            userProperties.setUserProperty(QTrendConstants.UserPropertyNames.USERPROP_ORDERED_ALERTS,
                                           alerts,
                                           new FromAlertConverter());
        }
        else
        {
            userProperties.removeUserProperty(QTrendConstants.UserPropertyNames.USERPROP_ORDERED_ALERTS);
        }
    }
}
