/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.rules.imports;

import com.quartz.qtrend.dom.StockQuoteImpl;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import lombok.val;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import java.util.HashSet;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.verifyZeroInteractions;

/**
 * Unit Test cases for {@link IsExistingTickerRule}
 *
 * @author lmcchbf
 * @since 21-Aug-2006
 */
@RunWith(MockitoJUnitRunner.class)
public class IsExistingTickerRuleTest //extends QTestCase
{
    @Mock
    private StockQuoteListService service;

    @org.junit.Test
    public void test_accept() throws Exception {
        val rule = new IsExistingTickerRule(new Ticker("NYSE"), service);
        val existingTickers = new HashSet<Ticker>();
        existingTickers.add(new Ticker("BOL"));
        existingTickers.add(new Ticker("REV"));
        rule.setExistingTickers(existingTickers);

        assertEquals(true, rule.accept(StockQuoteImpl.builder()
                                                     .ticker(new Ticker("BOL"))
                                                     .build()));
        assertEquals(true, rule.accept(StockQuoteImpl.builder()
                                                     .ticker(new Ticker("REV"))
                                                     .build()));
        assertEquals(false, rule.accept(StockQuoteImpl.builder()
                                                      .ticker(new Ticker("ZZZ"))
                                                      .build()));

        verifyZeroInteractions(service);
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
