/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.ui.exchanges;

import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qutilities.util.QUserProperties;

import javax.swing.*;
import java.util.*;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class SelectTickersPanel extends JPanel
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private Map<Ticker, JCheckBox> checkboxes = new HashMap<Ticker, JCheckBox>();
    private QUserProperties userProperties = null;
    private static final String USERPROP_SELECT_TICKER_PREFIX = "selectTicker.";

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public SelectTickersPanel()
    {
        setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setUserProperties(QUserProperties pUserProperties)
    {
        userProperties = pUserProperties;
    }

    public void setTickers(Collection<Ticker> pTickers)
    {
        checkboxes.clear();

        removeAll();

        for (Ticker ticker : pTickers)
        {
            final JCheckBox checkbox = new JCheckBox(ticker.toString(),
                                                     userProperties.getUserPropertyAsBoolean(
                                                             USERPROP_SELECT_TICKER_PREFIX + ticker.toString(), false));
            checkboxes.put(ticker, checkbox);
            add(checkbox);
        }
    }

    public Collection<Ticker> getSelectedTickers()
    {
        final List<Ticker> selectedTickers = new ArrayList<Ticker>();

        for (Ticker t : checkboxes.keySet())
        {
            final JCheckBox checkBox = checkboxes.get(t);
            if (checkBox.isSelected()) selectedTickers.add(t);
        }

        return selectedTickers;
    }

    void saveSelectionState()
    {
        for (Ticker t : checkboxes.keySet())
        {
            final JCheckBox checkBox = checkboxes.get(t);
            userProperties.setUserProperty(USERPROP_SELECT_TICKER_PREFIX + t.toString(), checkBox.isSelected());
        }
    }
}
