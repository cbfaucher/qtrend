/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.rules.imports;

import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.rules.IRule;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class PriceLowEnoughRule implements IRule
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(PriceLowEnoughRule.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private float maximumPrice = Float.MAX_VALUE;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public PriceLowEnoughRule()
    {
        this(0.0f);
    }

    public PriceLowEnoughRule(float pMaximumPrice)
    {
        super();
        maximumPrice = pMaximumPrice;
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public float getMaximumPrice()
    {
        return maximumPrice;
    }

    public void setMaximumPrice(float pMinimumPrice)
    {
        maximumPrice = pMinimumPrice;
    }

    public boolean accept(StockQuote pQuote)
    {
        final boolean v = (pQuote.getClose().price <= maximumPrice);

        if (v == false)
        {
            LOG.debug(pQuote.getTicker() + "@" + pQuote.getStockExchange() + " above maximum price: IGNORED");
        }

        return v;
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
