/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.ui.watchlists;

import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.watchlists.WatchList;
import com.quartz.qutilities.swing.PropertyPanel;
import org.apache.commons.lang.StringUtils;

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
public class EditWatchListPanel extends JPanel
{
    final private PropertyPanel propertyPanel = new PropertyPanel();
    final private JTextField    inputTicker = new JTextField(10);

    final private WatchListTickersModel tickersModel = new WatchListTickersModel();
    final private JList                 tickersList = new JList(tickersModel);

    private final JTextField watchListNameTF = new JTextField();
    private final JTextField watchListDescriptionTF = new JTextField();

    private WatchList watchList = null;

    public EditWatchListPanel()
    {
        super(new BorderLayout());

        //  property for name and description
        propertyPanel.addProperty(new JLabel("Name: "), watchListNameTF);
        propertyPanel.addProperty(new JLabel("Description: "), watchListDescriptionTF);
        add(BorderLayout.NORTH, propertyPanel);

        //  list
        add(BorderLayout.CENTER, new JScrollPane(tickersList));

        //  panel for buttons
        final JPanel controls = new JPanel(new FlowLayout(FlowLayout.LEFT, 0, 5));
        //  input text field
        controls.add(inputTicker);
        //  add btn
        final JButton addBtn = new JButton("+");
        addBtn.addActionListener(new ActionListener()
        {
            public void actionPerformed(ActionEvent e)
            {
                final String newTicker = StringUtils.trim(inputTicker.getText());

                if (StringUtils.isBlank(newTicker)) return;

                tickersModel.add(new Ticker(newTicker));

                inputTicker.setText("");
                inputTicker.requestFocusInWindow();
            }
        });
        controls.add(addBtn);
        //  spacer
        controls.add(Box.createHorizontalStrut(5));
        //  delete btn
        final JButton deleteBtn = new JButton("-");
        deleteBtn.addActionListener(new ActionListener()
        {
            public void actionPerformed(ActionEvent e)
            {
                final Object[] objects = tickersList.getSelectedValues();

                for(Object o : objects)
                {
                    tickersModel.remove((Ticker) o);    
                }
            }
        });
        controls.add(deleteBtn);

        add(BorderLayout.SOUTH, controls);
    }

    void setWatchList(WatchList pWatchList)
    {
        watchList = pWatchList;

        //  set the new watchlist
        tickersModel.setWatchList(watchList);

        //  set name and description
        watchListNameTF.setText(watchList != null ? watchList.getName() : "");
        watchListDescriptionTF.setText(watchList != null ? watchList.getDescription() : "");
    }

    void saveChanges()
    {
        final String newName = watchListNameTF.getText();
        if (StringUtils.isNotBlank(newName)) watchList.setName(newName);
        watchList.setDescription(watchListDescriptionTF.getText());
    }
}
