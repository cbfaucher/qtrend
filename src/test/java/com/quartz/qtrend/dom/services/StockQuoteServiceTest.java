/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.services;

import com.mockobjects.dynamic.Mock;
import com.quartz.qtrend.dom.StockQuoteImpl;
import com.quartz.qutilities.unittests.QTestCase;
import junit.framework.Test;
import junit.framework.TestSuite;
import org.junit.Assert;

import java.sql.Date;

/**
 * Unit Test cases for {@link StockQuoteService}
 *
 * @author lmcchbf
 * @since 20-May-2007
 */
public class StockQuoteServiceTest extends QTestCase
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS
	
    static public final Test suite()
    {
        return new TestSuite(StockQuoteServiceTest.class);
    }	

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private StockQuoteService stockQuoteService ;
    private Mock mockStockDAO = null;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public StockQuoteServiceTest(String name)
    {
        super(name);
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    protected void setUp() throws Exception
    {
        stockQuoteService = new StockQuoteService();
    }

    protected void tearDown() throws Exception
    {
        stockQuoteService = null;
    }

    public void test_calculatePriceDiff() throws Exception
    {
        final StockQuoteImpl previousStock = createStock("ALE", 45, new Date(2006, 10, 14), 45.10f);
        final StockQuoteImpl currentStock = createStock("ALE", 46, new Date(2006, 10, 15), 46.05f);

        mockStockDAO.expectAndReturn("getPreviousStock", currentStock, previousStock);

        stockQuoteService.calculatePriceDifference(currentStock);

        Assert.assertEquals(0.95, currentStock.getPriceDifference(), 0.005);
    }

    public void test_calculatePriceDiff2() throws Exception
    {
        final StockQuoteImpl previousStock = createStock("ALE", 45, new Date(2006, 10, 14), 46.75f);
        final StockQuoteImpl currentStock = createStock("ALE", 46, new Date(2006, 10, 15), 46.05f);

        mockStockDAO.expectAndReturn("getPreviousStock", currentStock, previousStock);

        stockQuoteService.calculatePriceDifference(currentStock);

        Assert.assertEquals(-0.70, currentStock.getPriceDifference(), 0.005);
    }

    private StockQuoteImpl createStock(String pTicker, int pPeriodSeq, Date pDate, float pClose)
    {
        return createStock(pTicker, pPeriodSeq, pDate, pClose);
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
