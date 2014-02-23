/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.rules;

import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.rules.imports.*;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class ExchangeRules extends DefaultExchangeRule
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    //  inclusion rules
    private final IsExistingTickerRule  existingTickerRule;
    private final IncludeTickersRule    includeTickersRule;

    //  exclusion rules
    private final ExcludeTickersRule    excludeTickersRule;
    private final EnoughVolumeRule      enoughVolumeRule;
    private final PriceHighEnoughRule   minimumPriceRule;
    private final PriceLowEnoughRule    maximumPriceRule;
    private PriceVsVolumeRatioRule      priceVsRatioRule = null;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public ExchangeRules(Ticker pExchangeName)
    {
        super(pExchangeName);

        existingTickerRule = new IsExistingTickerRule(this.exchange);
        includeTickersRule = new IncludeTickersRule(false);

        excludeTickersRule = new ExcludeTickersRule();
        enoughVolumeRule = new EnoughVolumeRule();
        minimumPriceRule = new PriceHighEnoughRule();
        maximumPriceRule = new PriceLowEnoughRule();

//        //  build include rules
//        includeRules.add(enoughVolumeRule);
//        includeRules.add(minimumPriceRule);
//        includeRules.add(maximumPriceRule);
//        includeRules.add(includeTickersRule);
//
//        //  build exclude rules
//        excludedRules.add(excludeTickersRule);
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public boolean accept(StockQuote pQuote)
    {
        //  INCLUDE RULES

        //  if existing
        if (existingTickerRule.accept(pQuote)) return true;

        //  if ticker to include
        if (includeTickersRule.accept(pQuote)) return true;

        //  EXCLUDE RULES

        //  if excluded, then fuck away...
        if (excludeTickersRule.accept(pQuote) == false) return false;

        //  enough volume
        if(enoughVolumeRule.accept(pQuote) == false) return false;

        //  price in range
        if (minimumPriceRule.accept(pQuote) == false) return false;
        if (maximumPriceRule.accept(pQuote) == false) return false;

        //  if price/ratio is met (if exists)
        if (priceVsRatioRule != null)
        {
            if (priceVsRatioRule.accept(pQuote))
            {
                return true;
            }
        }

        return false;  
    }

    public void setMinimumVolume(long pMinimumVolume)
    {
        enoughVolumeRule.setMinimumVolume(pMinimumVolume);
    }

    public void setMinimumPrice(float pMinimumPrice)
    {
        minimumPriceRule.setMinimumPrice(pMinimumPrice);
    }

    public void setMaximumPrice(float pMaximumPrice)
    {
        maximumPriceRule.setMaximumPrice(pMaximumPrice);
    }

    public IncludeTickersRule getIncludeTickersRule()
    {
        return includeTickersRule;
    }

    public ExcludeTickersRule getExcludeTickersRule()
    {
        return excludeTickersRule;
    }

    public void setPriceVsVolumeRatioRule(PriceVsVolumeRatioRule pRule)
    {
        priceVsRatioRule = pRule;
    }

    public PriceVsVolumeRatioRule getPriceVsRatioRule()
    {
        return priceVsRatioRule;
    }
}
