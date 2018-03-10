/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.rules.imports;

import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qutilities.unittests.QTestCase;
import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * Unit Test cases for {@link PriceHighEnoughRule}
 *
 * @author lmcchbf
 * @since 18-Aug-2006
 */
public class PriceHighEnoughRuleTest extends QTestCase
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS
	
    static public final Test suite()
    {
        return new TestSuite(PriceHighEnoughRuleTest.class);
    }	

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public PriceHighEnoughRuleTest(String name)
    {
        super(name);
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void test_accept() throws Exception
    {
    	final PriceHighEnoughRule rule = new PriceHighEnoughRule();

        rule.setMinimumPrice(2.00f);

//        assertEquals(false, rule.accept(asdf));
//        assertEquals(false, rule.accept(asdf));
//        assertEquals(true, rule.accept(asdf));
//        assertEquals(true, rule.accept(asdf));
//        assertEquals(true, rule.accept(asdf));
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
