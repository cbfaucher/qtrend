/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.dao;

import com.quartz.qtrend.TestCaseUtils;
import org.junit.Ignore;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Unit Test cases for {@link StockQuoteDAO}
 *
 * @author lmcchbf
 * @since 20-Apr-2007
 */
public class StockQuoteDAOTest implements TestCaseUtils
{
    private static final String TEST_TICKER = "TEST";

    @Autowired
    private StockQuoteDAO dao;

    @org.junit.Test
    @Ignore("Clean up this test")
    public void getNPreviousStock() throws Exception
    {
/*
        final StockQuote s1 = createStock(dao, TEST_TICKER, 50, new Date(2006, 10, 1), 35.55f, null);
        final StockQuote s2 = createStock(dao, TEST_TICKER, 51, new Date(2006, 10, 2), 36.66f, null);
        final StockQuote s3 = createStock(dao, TEST_TICKER, 52, new Date(2006, 10, 3), 37.77f, null);
        final StockQuote s4 = createStock(dao, TEST_TICKER, 53, new Date(2006, 10, 3), 38.88f, null);
        final StockQuote s5 = createStock(dao, TEST_TICKER, 54, new Date(2006, 10, 3), 38.88f, null);

        dao.saveQuoteOnly(s1);
        dao.saveQuoteOnly(s2);
        dao.saveQuoteOnly(s3);
        dao.saveQuoteOnly(s4);
        dao.saveQuoteOnly(s5);


        val expected1 = Arrays.asList(s2, s3, s4);

        assertEquals(expected1 , service.getPreviousQuotesIncludingMe(s4, 3, true));

        expected1.add(0, s1);
        assertEquals(expected1 , dao.getPreviousStocks(s5, 4, false));
*/
    }
}
