/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.helpers;

import com.quartz.qtrend.QTrendBeanNames;
import com.quartz.qtrend.QTrendConstants;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.rules.RuleManager;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.util.DateUtilities;
import com.quartz.qutilities.util.QUserProperties;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import org.apache.commons.lang.StringUtils;
import org.joda.time.LocalDate;

import javax.swing.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * BUnch of Actions Helper methods
 *
 * @author Christian
 * @since Quartz...
 */
public final class ActionHelper
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(ActionHelper.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    ///////////////////////////////////////

    private ActionHelper()
    {
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    /**
     * Asks the exchange to use, based on existing exchange
     *
     * @param pParent Parent frame
     * @return The wanted exchange, null if none selected
     */
    static public Ticker askExchange(QTrendFrame pParent)
    {
        final QUserProperties userProperties = QTrendBeanNames.USER_PROPERTIES.getBean();
        final String lastExchange = userProperties.getProperty(QTrendConstants.UserPropertyNames.USERPROP_LAST_EXCHANGE, null);


        final List<Ticker> exchanges = getExistingExchanges(new ArrayList<Ticker>());
        if (exchanges.size() == 0)
        {
            LOG.error("Update your existing exchange list!  See Tools-->Update Exchange List");
            return null;
        }

        final int lastExchangeIndex = findLastExchangeIndex(exchanges, lastExchange != null ? new Ticker(lastExchange) : null);

        final Ticker exchange = (Ticker) JOptionPane.showInputDialog(pParent, "What is the exchange?", "Exchange?",
                                                            JOptionPane.QUESTION_MESSAGE,
                                                            null,
                                                            exchanges.toArray(new Ticker[0]),
                                                            exchanges.get(lastExchangeIndex));
        if (exchange == null) return null;
        userProperties.setProperty(QTrendConstants.UserPropertyNames.USERPROP_LAST_EXCHANGE, exchange.toString());
        return exchange;

    }

    static public Ticker guessExchange(Ticker pTicker)
    {
        final String ticker = pTicker.toString();

        if (ticker.endsWith(".TO")) return new Ticker("TSE");
        if (ticker.endsWith(".V")) return new Ticker ("VSE");
        if (ticker.endsWith(".OB")) return new Ticker("OBB");
        if (ticker.endsWith(".PK")) return new Ticker("OBB");

        if (ticker.length() == 3) return new Ticker("NYSE");
        if (ticker.length() == 4) return new Ticker("NASDAQ");

        return null;
    }

    /**
     * Asks the user for a new exchange (not already known)
     *
     * @param pParent Parent
     * @return the new exchange tickerName, null for none
     */
    static public Ticker askNewExchange(QTrendFrame pParent)
    {
        final QUserProperties userProperties = QTrendBeanNames.USER_PROPERTIES.getBean();


        final String lastExchange = userProperties.getProperty(QTrendConstants.UserPropertyNames.USERPROP_LAST_EXCHANGE, null);

        final String name = (String) JOptionPane.showInputDialog(pParent,
                                                        "What is the exchange?",
                                                        "Exchange?",
                                                        JOptionPane.QUESTION_MESSAGE,
                                                        null,
                                                        null,
                                                        lastExchange);
        if (name == null) return null;

        userProperties.setProperty(QTrendConstants.UserPropertyNames.USERPROP_LAST_EXCHANGE, name);

        return new Ticker(lastExchange);
    }

    /**
     * Asks the user the ticker
     * @param pParent Parent
     * @return Ticker, null for none
     */
    static public Ticker askTicker(QTrendFrame pParent)
    {
        final QUserProperties userProperties = QTrendBeanNames.USER_PROPERTIES.getBean();
        final String lastTicker = userProperties.getProperty(QTrendConstants.UserPropertyNames.USERPROP_LAST_TICKER, "");

        String value = JOptionPane.showInputDialog(pParent, "What is the ticker?",
                                                   lastTicker);
        if (value == null) return null;
        userProperties.setProperty(QTrendConstants.UserPropertyNames.USERPROP_LAST_TICKER, lastTicker);
        return new Ticker(value);
    }

    private static int findLastExchangeIndex(List<Ticker> pExchanges, Ticker pLastExchange)
    {
        if (pLastExchange == null) return 0;

        for (int i = 0; i < pExchanges.size(); i++)
        {
            final Ticker t = pExchanges.get(i);
            if (t.equals(pLastExchange)) return i;
        }

        return 0;
    }

    static public Ticker getSelectedTickerName(Output pOutput)
    {
        final String selectedText = pOutput.getSelectedText();
        if (StringUtils.isNotBlank(selectedText)) return new Ticker(selectedText);
        return null;
    }

    static public <T extends Collection<Ticker>> T getExistingExchanges(T pTargetCollection)
    {
        final RuleManager ruleManager = QTrendBeanNames.EXCHANGE_RULE_MANAGER.getBean();
        return ruleManager.getSupportedExchanges(pTargetCollection);
    }

    public static LocalDate askDate(final QTrendFrame pFrame, String pMsg, String pDefaultValue)
    {
        try
        {
            final String value = JOptionPane.showInputDialog(pFrame, pMsg, pDefaultValue);
            if (value == null) return null;
            return DateUtilities.toLocalDate(value);
        }
        catch (IllegalArgumentException e)
        {
            pFrame.getOutput().writeln("\nERROR: " + e.getMessage());
            return null;
        }
    }
}
