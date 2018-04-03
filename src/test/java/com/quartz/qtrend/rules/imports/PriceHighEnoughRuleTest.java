/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.rules.imports;

import lombok.val;
import org.junit.Ignore;

/**
 * Unit Test cases for {@link PriceHighEnoughRule}
 *
 * @author lmcchbf
 * @since 18-Aug-2006
 */
public class PriceHighEnoughRuleTest
{
    @org.junit.Test
    @Ignore("IMplement this!")
    public void test_accept() throws Exception
    {
    	val rule = new PriceHighEnoughRule();

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
