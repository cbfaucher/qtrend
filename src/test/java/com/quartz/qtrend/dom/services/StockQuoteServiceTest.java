/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.services;

import com.quartz.qtrend.SimpleStockDAO;
import com.quartz.qtrend.TestCaseUtils;
import lombok.val;
import org.junit.Assert;
import org.junit.Before;

import java.sql.Date;

/**
 * Unit Test cases for {@link StockQuoteService}
 *
 * @author lmcchbf
 * @since 20-May-2007
 */
public class StockQuoteServiceTest implements TestCaseUtils
{
    private StockQuoteService stockQuoteService ;
    private final SimpleStockDAO dao = new SimpleStockDAO();

    @Before
    public void setUp() throws Exception
    {
        stockQuoteService = new StockQuoteService(dao);
    }

    @org.junit.Test
    public void calculatePriceDiff() throws Exception
    {
        createStock(dao, "ALE", 45, new Date(2006, 10, 14), 45.10f, null);
        val currentStock = createStock(dao, "ALE", 46, new Date(2006, 10, 15), 46.05f, null);

        stockQuoteService.calculatePriceDifference(currentStock);

        Assert.assertEquals(0.95, currentStock.getPriceDifference(), 0.005);
    }

    @org.junit.Test
    public void calculatePriceDiff2() throws Exception
    {
        createStock(dao, "ALE", 45, new Date(2006, 10, 14), 46.75f, null);
        val currentStock = createStock(dao, "ALE", 46, new Date(2006, 10, 15), 46.05f, null);

        stockQuoteService.calculatePriceDifference(currentStock);

        Assert.assertEquals(-0.70, currentStock.getPriceDifference(), 0.005);
    }
}
