/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
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
public class PriceHighEnoughRule implements IRule
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(PriceHighEnoughRule.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private float minimumPrice = 0.0f;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public PriceHighEnoughRule()
    {
        this(0.0f);
    }

    public PriceHighEnoughRule(float pMinimumPrice)
    {
        super();
        minimumPrice = pMinimumPrice;
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public float getMinimumPrice()
    {
        return minimumPrice;
    }

    public void setMinimumPrice(float pMinimumPrice)
    {
        minimumPrice = pMinimumPrice;
    }

    public boolean accept(StockQuote pQuote)
    {
        final boolean v = (minimumPrice <= pQuote.getClose().price);

        if (v == false)
        {
            LOG.debug(pQuote.getTicker() + "@" + pQuote.getStockExchange() + " below minimum price: IGNORED");
        }

        return v;
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
