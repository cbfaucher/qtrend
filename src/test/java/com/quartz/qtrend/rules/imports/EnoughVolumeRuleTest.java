/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.rules.imports;

import com.quartz.qtrend.dom.StockQuoteImpl;
import com.quartz.qtrend.dom.helpers.Price;
import com.quartz.qtrend.dom.helpers.Ticker;
import lombok.val;

import static org.junit.Assert.assertEquals;

/**
 * Unit Test cases for {@link EnoughVolumeRule}
 *
 * @author lmcchbf
 * @since 18-Aug-2006
 */
public class EnoughVolumeRuleTest {

    @org.junit.Test
    public void accept() throws Exception {
        val rule = new EnoughVolumeRule();

        rule.setMinimumVolume(250000);

        val quote = new StockQuoteImpl();
        quote.setId(1);
        quote.setStockExchange(new Ticker("EXCH"));
        quote.setTicker(new Ticker("ABC"));
        quote.setPeriodSequence(0);
        quote.setClose(new Price(0f));
        quote.setVolume(100000);
        assertEquals(false, rule.accept(quote));

        quote.setVolume(249999);
        assertEquals(false, rule.accept(quote));

        quote.setVolume(250000);
        assertEquals(true, rule.accept(quote));

        quote.setVolume(250001);
        assertEquals(true, rule.accept(quote));

        quote.setVolume(500000);
        assertEquals(true, rule.accept(quote));
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
