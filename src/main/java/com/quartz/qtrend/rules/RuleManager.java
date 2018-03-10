/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.rules;

import com.quartz.qtrend.UnknownExchangeException;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * Knows all the inclusion and exclusion rules.
 *
 * @author Christian
 * @since Quartz...
 */
public class RuleManager
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(RuleManager.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final private Map<Ticker, ExchangeRules> exchangeRules = new HashMap<Ticker, ExchangeRules>();

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public RuleManager()
    {
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public IExchangeRule getExchangeRule(Ticker pExchange) throws UnknownExchangeException
    {
        final ExchangeRules thisExchangeRules = this.exchangeRules.get(pExchange);
        if (thisExchangeRules != null)
        {
            return thisExchangeRules;
        }
        else
        {
            throw new UnknownExchangeException(pExchange);
        }
    }

    public void addExchange(ExchangeRules pExchangeRules)
    {
        LOG.info("Added rules for exchange: "+ pExchangeRules.getExchangeName());
        exchangeRules.put(pExchangeRules.getExchangeName(), pExchangeRules);
    }

    public Collection<Ticker> getExchanges()
    {
        return exchangeRules.keySet();    
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
    public <T extends Collection<Ticker>> T getSupportedExchanges(T pTargetCollection)
    {
        for (Ticker t : exchangeRules.keySet()) pTargetCollection.add(t);
        return pTargetCollection;
    }
}
