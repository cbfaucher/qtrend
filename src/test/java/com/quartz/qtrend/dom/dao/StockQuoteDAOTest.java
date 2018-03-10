/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.dao;

import junit.framework.Test;
import junit.framework.TestSuite;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.TrendTestCase;

import java.sql.Date;
import java.util.List;
import java.util.ArrayList;

/**
 * Unit Test cases for {@link StockQuoteDAO}
 *
 * @author lmcchbf
 * @since 20-Apr-2007
 */
public class StockQuoteDAOTest extends TrendTestCase
{
    private static final String TEST_TICKER = "TEST";

    public StockQuoteDAOTest(String name)
    {
        super(name);
    }

    @org.junit.Test
    public void testUseless() {

    }

/*  TODO: move this to a valid unit test class
    public void test_getNPreviousStock() throws Exception
    {
        final StockQuoteDAO dao = new StockQuoteDAO();

        final StockQuote s1 = createStock(dao, TEST_TICKER, 50, new Date(2006, 10, 1), 35.55f);
        final StockQuote s2 = createStock(dao, TEST_TICKER, 51, new Date(2006, 10, 2), 36.66f);
        final StockQuote s3 = createStock(dao, TEST_TICKER, 52, new Date(2006, 10, 3), 37.77f);
        final StockQuote s4 = createStock(dao, TEST_TICKER, 53, new Date(2006, 10, 3), 38.88f);
        final StockQuote s5 = createStock(dao, TEST_TICKER, 54, new Date(2006, 10, 3), 38.88f);

        s1.saveQuoteOnly();
        s2.saveQuoteOnly();
        s3.saveQuoteOnly();
        s4.saveQuoteOnly();
        s5.saveQuoteOnly();

        final List<StockQuote> expected1 = new ArrayList();
        expected1.add(s2);
        expected1.add(s3);
        expected1.add(s4);

        assertEquals(expected1 , dao.getPreviousQStocks(s4, 3, true));

        expected1.add(0, s1);
        assertEquals(expected1 , dao.getPreviousStocks(s5, 4, false));
    }
*/

    ///////////////////////////////////////
    ////    INNER CLASSES
}
