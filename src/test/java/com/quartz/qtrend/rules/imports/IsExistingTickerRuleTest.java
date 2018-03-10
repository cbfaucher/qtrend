/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.rules.imports;

import com.quartz.qutilities.unittests.QTestCase;
import com.quartz.qtrend.Main;
import com.quartz.qtrend.Bootstrap;
import com.quartz.qtrend.QTrendMode;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.StockQuoteImpl;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.mockobjects.ExpectationCounter;
import junit.framework.Test;
import junit.framework.TestSuite;

import java.util.HashSet;
import java.util.Set;

/**
 * Unit Test cases for {@link IsExistingTickerRule}
 *
 * @author lmcchbf
 * @since 21-Aug-2006
 */
public class IsExistingTickerRuleTest extends QTestCase
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS
	
    static public final Test suite()
    {
        return new TestSuite(IsExistingTickerRuleTest.class);
    }	

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public IsExistingTickerRuleTest(String name)
    {
        super(name);
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    protected void setUp() throws Exception
    {
        Bootstrap.init(QTrendMode.USER_INTERFACE);
    }

    public void test_accept() throws Exception
    {
        final ExpectationCounter counterNyse = new ExpectationCounter("loadTickers-NYSE");
        counterNyse.setExpected(1);

    	final IsExistingTickerRule rule = new IsExistingTickerRule(new Ticker("NYSE"));
        final Set<Ticker> existingTickers = new HashSet<Ticker>();
        existingTickers.add(new Ticker("BOL"));
        existingTickers.add(new Ticker("REV"));
        rule.setExistingTickers(existingTickers);

//        final StockQuote quote = new StockQuoteImpl(null, , );
//        assertEquals(true, rule.accept(asdf));
//        assertEquals(true, rule.accept(asdf));
//        assertEquals(false, rule.accept(asdf));

        counterNyse.verify();
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
