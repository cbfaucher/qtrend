/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.langford;

import com.quartz.qtrend.QTrendConfiguration;
import com.quartz.qtrend.TrendTestCase;
import com.quartz.qtrend.SimpleStockDAO;
import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.StockQuoteImpl;
import com.quartz.qtrend.dom.dao.StockQuoteDAO;
import com.quartz.qtrend.dom.helpers.EMA;
import com.quartz.qtrend.dom.helpers.MACD;
import com.quartz.qtrend.dom.langford.services.LangfordDataService;
import com.quartz.qtrend.dom.services.StockQuoteService;
import junit.framework.Test;
import junit.framework.TestSuite;
import org.junit.Assert;

import java.sql.Date;
import java.util.Iterator;

/**
 * Unit Test cases for {@link LangfordDataImpl}
 *
 * @author lmcchbf
 * @since 5-May-2006
 */
public class LangfordDataImplTest extends TrendTestCase
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS
	
    static public final Test suite()
    {
        return new TestSuite(LangfordDataImplTest.class);
    }	

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private StockQuoteService stockQuoteService;
    private LangfordDataService langfordDataService;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public LangfordDataImplTest(String name)
    {
        super(name);
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    protected void setUp() throws Exception
    {
        super.setUp();

        stockQuoteService = new StockQuoteService();
        langfordDataService = new LangfordDataService();
    }

    public void test_calculateEMA() throws Exception
    {
        final SimpleStockDAO persist = new SimpleStockDAO();
        final StockQuoteDAO dao = new StockQuoteDAO();
        //  todo: fixme: dao.setStockDao(persist);

        final StockQuoteImpl s1 = createStock(dao, "ALE", 1, new Date(2006, 10, 1), 10);
        final StockQuoteImpl s2 = createStock(dao, "ALE", 2, new Date(2006, 10, 1), 12);
        final StockQuoteImpl s3 = createStock(dao, "ALE", 3, new Date(2006, 10, 1), 11);
        final StockQuoteImpl s4 = createStock(dao, "ALE", 4, new Date(2006, 10, 1), 9);
        final StockQuoteImpl s5 = createStock(dao, "ALE", 5, new Date(2006, 10, 1), 6);
        final StockQuoteImpl s6 = createStock(dao, "ALE", 6, new Date(2006, 10, 1), 6);

        persist.stocks.add(s1);
        persist.stocks.add(s2);
        persist.stocks.add(s3);
        persist.stocks.add(s4);
        persist.stocks.add(s5);
        persist.stocks.add(s6);

        assertEMA(s1, 10.00000f);
        assertEMA(s2, 10.66666f);
        assertEMA(s3, 10.77778f);
        assertEMA(s4, 10.18519f);
        assertEMA(s5, 8.790123f);
        assertEMA(s6, 7.860082f);
    }

    private void assertEMA(final StockQuoteImpl pStock, final float pExpectedEma) throws StockException
    {

        final StockQuote previous = stockQuoteService.getPreviousQuote(pStock);

        final LangfordDataImpl langfordData = (LangfordDataImpl) pStock.getLangfordData();
        final float ema = langfordDataService.calculateEMA(
                                        langfordData,
                                        previous,
                                        LangfordDataService.STEMA_RETRIEVER, new QTrendConfiguration.EMAConfiguration(5));
        Assert.assertEquals(pExpectedEma, ema, 0.02);
        langfordData.setShortTermEma(new EMA(ema));
    }

    public void test_calculateMacd() throws Exception
    {
        final SimpleStockDAO persist = new SimpleStockDAO();
        final StockQuoteDAO  dao = new StockQuoteDAO();
        final StockQuoteImpl stock1 = createStock(dao, "ALE", 1, new Date(2006, 10, 1), 46.25f);
        final StockQuoteImpl stock2 = createStock(dao, "ALE", 2, new Date(2006, 10, 2), 46.25f);
        final StockQuoteImpl stock3 = createStock(dao, "ALE", 3, new Date(2006, 10, 3), 47.06f);
        final StockQuoteImpl stock4 = createStock(dao, "ALE", 4, new Date(2006, 10, 4), 48.25f);
        final StockQuoteImpl stock5 = createStock(dao, "ALE", 5, new Date(2006, 10, 5), 48.50f);

        persist.stocks.add(stock1);
        persist.stocks.add(stock2);
        persist.stocks.add(stock3);
        persist.stocks.add(stock4);
        persist.stocks.add(stock5);

        final QTrendConfiguration.MACDConfiguration macdPeriod = new QTrendConfiguration.MACDConfiguration(12, 26, 9);

        final LangfordDataImpl langfordData1 = (LangfordDataImpl) stock1.getLangfordData();
        final LangfordDataImpl langfordData2 = (LangfordDataImpl) stock2.getLangfordData();
        final LangfordDataImpl langfordData3 = (LangfordDataImpl) stock3.getLangfordData();
        final LangfordDataImpl langfordData4 = (LangfordDataImpl) stock4.getLangfordData();
        final LangfordDataImpl langfordData5 = (LangfordDataImpl) stock5.getLangfordData();

        langfordDataService.calculateMacd(langfordData1, macdPeriod);
        assertEquals(new MACD(0.0f, 0.0f, 46.25f, 46.25f), langfordData1.getMacd());
        langfordDataService.calculateMacd(langfordData2, macdPeriod);
        assertEquals(new MACD(0.0f, 0.0f, 46.25f, 46.25f), langfordData2.getMacd());
        langfordDataService.calculateMacd(langfordData3, macdPeriod);
        assertEquals(new MACD(0.01f, 0.06f, 46.37f, 46.31f), langfordData3.getMacd());
        langfordDataService.calculateMacd(langfordData4, macdPeriod);
        assertEquals(new MACD(0.05f, 0.21f, 46.66f, 46.45f), langfordData4.getMacd());
        langfordDataService.calculateMacd(langfordData5, macdPeriod);
        assertEquals(new MACD(0.11f, 0.34f, 46.95f, 46.61f), langfordData5.getMacd());
    }

    public void test_calculateVariation() throws Exception
    {
        final SimpleStockDAO persist = new SimpleStockDAO();
        final StockQuoteDAO dao = new StockQuoteDAO();
        //  todo: fixme: dao.setStockDao(persist);

        final StockQuoteImpl stock1 = createStock(dao, "ALE", 1, new Date(2006, 10, 1), 46.25f);
        final StockQuoteImpl stock2 = createStock(dao, "ALE", 2, new Date(2006, 10, 2), 46.25f);
        final StockQuoteImpl stock3 = createStock(dao, "ALE", 3, new Date(2006, 10, 2), 46.25f);
        final StockQuoteImpl stock4 = createStock(dao, "ALE", 4, new Date(2006, 10, 3), 47.06f);
        final StockQuoteImpl stock5 = createStock(dao, "ALE", 5, new Date(2006, 10, 4), 45.06f);
        final StockQuoteImpl stock6 = createStock(dao, "ALE", 6, new Date(2006, 10, 4), 44.06f);

        dao.saveQuoteOnly(stock1);
        dao.saveQuoteOnly(stock2);
        dao.saveQuoteOnly(stock3);
        dao.saveQuoteOnly(stock4);
        dao.saveQuoteOnly(stock5);
        dao.saveQuoteOnly(stock6);

        {
            final LangfordDataImpl langfordData1 = (LangfordDataImpl) stock1.getLangfordData();
            langfordData1.setMacd(new MACD(0.5f, 0.0f, 0.9f, 0.4f));
            langfordDataService.calculateVariation(langfordData1);
            Assert.assertEquals("", langfordData1.getVariation());
            Assert.assertEquals("", langfordData1.getSignal());
        }

        {
            final LangfordDataImpl langfordData2 = (LangfordDataImpl) stock2.getLangfordData();
            langfordData2.setMacd(new MACD(0.6f, 0.0f, 0.9f, 0.2f));
            langfordDataService.calculateVariation(langfordData2);
            Assert.assertEquals("+", langfordData2.getVariation());
            Assert.assertEquals("OBS", langfordData2.getSignal());
        }

        {
            final LangfordDataImpl langfordData3 = (LangfordDataImpl) stock3.getLangfordData();
            langfordData3.setMacd(new MACD(0.5f, 0.0f, 0.9f, 0.3f));
            langfordDataService.calculateVariation(langfordData3);
            Assert.assertEquals("+", langfordData3.getVariation());
            Assert.assertEquals("", langfordData3.getSignal());
        }

        {
            final LangfordDataImpl langfordData4 = (LangfordDataImpl) stock4.getLangfordData();
            langfordData4.setMacd(new MACD(0.4f, 0.0f, 0.8f, 0.3f));
            langfordDataService.calculateVariation(langfordData4);
            Assert.assertEquals("+", langfordData4.getVariation());
            Assert.assertEquals("", langfordData4.getSignal());
        }

        {
            final LangfordDataImpl langfordData5 = (LangfordDataImpl) stock5.getLangfordData();
            langfordData5.setMacd(new MACD(0.4f, 0.0f, 0.6f, 0.3f));
            langfordDataService.calculateVariation(langfordData5);
            Assert.assertEquals("-", langfordData5.getVariation());
            Assert.assertEquals("OSS", langfordData5.getSignal());
        }

        {
            final LangfordDataImpl langfordData6 = (LangfordDataImpl) stock6.getLangfordData();
            langfordData6.setMacd(new MACD(0.4f, 0.0f, 0.4f, 0.3f));
            langfordDataService.calculateVariation(langfordData6);
            Assert.assertEquals("-", langfordData6.getVariation());
            Assert.assertEquals("", langfordData6.getSignal());
        }

    }

    public void test_calculateRsi_moreThan14stocks() throws Exception
    {
    	final SimpleStockDAO persist = new SimpleStockDAO();
        final StockQuoteDAO dao = new StockQuoteDAO();
        //  todo: fixme: dao.setStockDao(persist);

        persist.stocks.add(createStock(dao, "ALE", 1, new Date(2006, 10, 1), 98.03f));
        persist.stocks.add(createStock(dao, "ALE", 2, new Date(2006, 10, 1), 98.51f));
        persist.stocks.add(createStock(dao, "ALE", 3, new Date(2006, 10, 1), 98.58f));
        persist.stocks.add(createStock(dao, "ALE", 4, new Date(2006, 10, 1), 98.56f));
        persist.stocks.add(createStock(dao, "ALE", 5, new Date(2006, 10, 1), 98.93f));

        persist.stocks.add(createStock(dao, "ALE", 6, new Date(2006, 10, 1), 98.11f));
        persist.stocks.add(createStock(dao, "ALE", 7, new Date(2006, 10, 1), 97.81f));
        persist.stocks.add(createStock(dao, "ALE", 8, new Date(2006, 10, 1), 97.62f));
        persist.stocks.add(createStock(dao, "ALE", 9, new Date(2006, 10, 1), 98.80f));
        persist.stocks.add(createStock(dao, "ALE", 10, new Date(2006, 10, 1), 98.72f));

        persist.stocks.add(createStock(dao, "ALE", 11, new Date(2006, 10, 1), 97.97f));
        persist.stocks.add(createStock(dao, "ALE", 12, new Date(2006, 10, 1), 97.54f));
        persist.stocks.add(createStock(dao, "ALE", 13, new Date(2006, 10, 1), 96.60f));
        persist.stocks.add(createStock(dao, "ALE", 14, new Date(2006, 10, 1), 97.38f));
        persist.stocks.add(createStock(dao, "ALE", 15, new Date(2006, 10, 1), 96.54f));

        persist.stocks.add(createStock(dao, "ALE", 16, new Date(2006, 10, 1), 96.49f));
        persist.stocks.add(createStock(dao, "ALE", 17, new Date(2006, 10, 1), 97.47f));
        persist.stocks.add(createStock(dao, "ALE", 18, new Date(2006, 10, 1), 97.68f));
        persist.stocks.add(createStock(dao, "ALE", 19, new Date(2006, 10, 1), 97.90f));
        persist.stocks.add(createStock(dao, "ALE", 20, new Date(2006, 10, 1), 98.08f));

        final StockQuoteService stockQuoteService = new StockQuoteService();
        //  prerequisite
        for (Iterator iterator = persist.stocks.iterator(); iterator.hasNext();)
        {
            StockQuoteImpl stockQuote = (StockQuoteImpl) iterator.next();
            stockQuoteService.calculatePriceDifference(stockQuote);
        }

        assertRsi(persist, 15, 39.72);
        assertRsi(persist, 16, 35.19);
        assertRsi(persist, 17, 42.82);
        assertRsi(persist, 18, 44.44);
        assertRsi(persist, 19, 43.37);
        assertRsi(persist, 20, 49.79);
    }

    public void test_calculateRsi_lessThan14stocks() throws Exception
    {
    	final SimpleStockDAO persist = new SimpleStockDAO();
        final StockQuoteDAO dao = new StockQuoteDAO();
        //  todo: fixme: dao.setStockDao(persist);

        persist.stocks.add(createStock(dao, "ALE", 1, new Date(2006, 10, 1), 98.03f));
        persist.stocks.add(createStock(dao, "ALE", 2, new Date(2006, 10, 1), 98.51f));
        persist.stocks.add(createStock(dao, "ALE", 3, new Date(2006, 10, 1), 98.58f));
        persist.stocks.add(createStock(dao, "ALE", 4, new Date(2006, 10, 1), 98.56f));
        persist.stocks.add(createStock(dao, "ALE", 5, new Date(2006, 10, 1), 98.93f));

        persist.stocks.add(createStock(dao, "ALE", 6, new Date(2006, 10, 1), 98.11f));
        persist.stocks.add(createStock(dao, "ALE", 7, new Date(2006, 10, 1), 97.81f));

        final StockQuoteService stockQuoteService = new StockQuoteService();

        //  prerequisite
        for (Iterator iterator = persist.stocks.iterator(); iterator.hasNext();)
        {
            StockQuoteImpl stockQuote = (StockQuoteImpl) iterator.next();
            stockQuoteService.calculatePriceDifference(stockQuote);
        }

        assertRsi(persist, 1, 0);
        assertRsi(persist, 2, 0);
        assertRsi(persist, 3, 0);
        assertRsi(persist, 4, 0);
        assertRsi(persist, 5, 0);
        assertRsi(persist, 6, 0);
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
