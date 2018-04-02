/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.langford;

import com.quartz.qtrend.QTrendConfiguration;
import com.quartz.qtrend.Signal;
import com.quartz.qtrend.SimpleStockDAO;
import com.quartz.qtrend.TestCaseUtils;
import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.StockQuoteImpl;
import com.quartz.qtrend.dom.helpers.EMA;
import com.quartz.qtrend.dom.helpers.MACD;
import com.quartz.qtrend.dom.langford.services.LangfordDataService;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.dom.services.StockQuoteService;
import com.quartz.qtrend.dom.watchlists.IWatchListService;
import com.quartz.qtrend.util.SimpleStockQuoteNavigator;
import com.quartz.qutilities.util.QProperties;
import lombok.val;
import org.junit.Assert;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.Date;
import java.util.Iterator;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

/**
 * Unit Test cases for {@link LangfordDataImpl}
 *
 * @author lmcchbf
 * @since 5-May-2006
 */
@RunWith(MockitoJUnitRunner.class)
public class LangfordDataImplTest implements TestCaseUtils
{
    @Mock
    private JdbcTemplate jdbcTemplate;

    @Mock
    private IWatchListService watchListService;

    private StockQuoteListService stockQuoteListService;

    private final StockQuoteService stockQuoteService = new StockQuoteService(null,
                                                                              null,
                                                                              null,
                                                                              null,
                                                                              null);

    private LangfordDataService langfordDataService;

    private final SimpleStockDAO simpleDao = new SimpleStockDAO();

    private final SimpleStockQuoteNavigator navigator = new SimpleStockQuoteNavigator(simpleDao.stocks);

    @Before
    public void setup() {
        stockQuoteListService = new StockQuoteListService(jdbcTemplate, new QProperties(), stockQuoteService, watchListService);

        langfordDataService = new LangfordDataService(jdbcTemplate, stockQuoteListService, stockQuoteService);
    }

    @org.junit.Test
    public void test_calculateEMA() throws Exception
    {
        val s1 = createStock(simpleDao, "ALE", 1, new Date(2006, 10, 1), 10,
                             b -> b.stockQuoteNavigator(navigator));
        val s2 = createStock(simpleDao, "ALE", 2, new Date(2006, 10, 1), 12,
                             b -> b.stockQuoteNavigator(navigator));
        val s3 = createStock(simpleDao, "ALE", 3, new Date(2006, 10, 1), 11,
                             b -> b.stockQuoteNavigator(navigator));
        val s4 = createStock(simpleDao, "ALE", 4, new Date(2006, 10, 1), 9,
                             b -> b.stockQuoteNavigator(navigator));
        val s5 = createStock(simpleDao, "ALE", 5, new Date(2006, 10, 1), 6,
                             b -> b.stockQuoteNavigator(navigator));
        val s6 = createStock(simpleDao, "ALE", 6, new Date(2006, 10, 1), 6,
                             b -> b.stockQuoteNavigator(navigator));

        simpleDao.stocks.add(s1);
        simpleDao.stocks.add(s2);
        simpleDao.stocks.add(s3);
        simpleDao.stocks.add(s4);
        simpleDao.stocks.add(s5);
        simpleDao.stocks.add(s6);

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
        assertEquals(pExpectedEma, ema, 0.02);
        langfordData.setShortTermEma(new EMA(ema));
    }

    @org.junit.Test
    public void test_calculateMacd() throws Exception
    {
        val stock1 = createStock(simpleDao, "ALE", 1, new Date(2006, 10, 1), 46.25f,
                                                  b -> b.stockQuoteNavigator(navigator));
        val stock2 = createStock(simpleDao, "ALE", 2, new Date(2006, 10, 2), 46.25f,
                                                  b -> b.stockQuoteNavigator(navigator));
        val stock3 = createStock(simpleDao, "ALE", 3, new Date(2006, 10, 3), 47.06f,
                                                  b -> b.stockQuoteNavigator(navigator));
        val stock4 = createStock(simpleDao, "ALE", 4, new Date(2006, 10, 4), 48.25f,
                                                  b -> b.stockQuoteNavigator(navigator));
        val stock5 = createStock(simpleDao, "ALE", 5, new Date(2006, 10, 5), 48.50f,
                                                  b -> b.stockQuoteNavigator(navigator));

        simpleDao.stocks.add(stock1);
        simpleDao.stocks.add(stock2);
        simpleDao.stocks.add(stock3);
        simpleDao.stocks.add(stock4);
        simpleDao.stocks.add(stock5);

        final QTrendConfiguration.MACDConfiguration macdPeriod = new QTrendConfiguration.MACDConfiguration(12, 26, 9);

        final LangfordDataImpl langfordData1 = (LangfordDataImpl) stock1.getLangfordData();
        final LangfordDataImpl langfordData2 = (LangfordDataImpl) stock2.getLangfordData();
        final LangfordDataImpl langfordData3 = (LangfordDataImpl) stock3.getLangfordData();
        final LangfordDataImpl langfordData4 = (LangfordDataImpl) stock4.getLangfordData();
        final LangfordDataImpl langfordData5 = (LangfordDataImpl) stock5.getLangfordData();

        langfordDataService.calculateMacd(langfordData1, macdPeriod);
        assertMacdEquals(new MACD(0.0f, 0.0f, 46.25f, 46.25f), langfordData1.getMacd());
        langfordDataService.calculateMacd(langfordData2, macdPeriod);
        assertMacdEquals(new MACD(0.0f, 0.0f, 46.25f, 46.25f), langfordData2.getMacd());
        langfordDataService.calculateMacd(langfordData3, macdPeriod);
        assertMacdEquals(new MACD(0.01f, 0.06f, 46.37f, 46.31f), langfordData3.getMacd());
        langfordDataService.calculateMacd(langfordData4, macdPeriod);
        assertMacdEquals(new MACD(0.05f, 0.21f, 46.66f, 46.45f), langfordData4.getMacd());
        langfordDataService.calculateMacd(langfordData5, macdPeriod);
        assertMacdEquals(new MACD(0.11f, 0.34f, 46.95f, 46.61f), langfordData5.getMacd());
    }

    @org.junit.Test
    public void test_calculateVariation() throws Exception
    {
        val stock1 = createStock(simpleDao, "ALE", 1, new Date(2006, 10, 1), 46.25f,
                                                  b -> b.stockQuoteNavigator(navigator));
        val stock2 = createStock(simpleDao, "ALE", 2, new Date(2006, 10, 2), 46.25f,
                                                  b -> b.stockQuoteNavigator(navigator));
        val stock3 = createStock(simpleDao, "ALE", 3, new Date(2006, 10, 2), 46.25f,
                                                  b -> b.stockQuoteNavigator(navigator));
        val stock4 = createStock(simpleDao, "ALE", 4, new Date(2006, 10, 3), 47.06f,
                                                  b -> b.stockQuoteNavigator(navigator));
        val stock5 = createStock(simpleDao, "ALE", 5, new Date(2006, 10, 4), 45.06f,
                                                  b -> b.stockQuoteNavigator(navigator));
        val stock6 = createStock(simpleDao, "ALE", 6, new Date(2006, 10, 4), 44.06f,
                                                  b -> b.stockQuoteNavigator(navigator));

        simpleDao.save(stock1);
        simpleDao.save(stock2);
        simpleDao.save(stock3);
        simpleDao.save(stock4);
        simpleDao.save(stock5);
        simpleDao.save(stock6);

        {
            val langfordData1 = (LangfordDataImpl) stock1.getLangfordData();
            langfordData1.setMacd(new MACD(0.5f, 0.0f, 0.9f, 0.4f));
            langfordDataService.calculateVariation(langfordData1);
            assertEquals("", langfordData1.getVariation());
            assertNull(langfordData1.getSignal());
        }

        {
            val langfordData2 = (LangfordDataImpl) stock2.getLangfordData();
            langfordData2.setMacd(new MACD(0.6f, 0.0f, 0.9f, 0.2f));
            langfordDataService.calculateVariation(langfordData2);
            assertEquals("+", langfordData2.getVariation());
            assertEquals(Signal.MACD_OBS, langfordData2.getSignal());
        }

        {
            val langfordData3 = (LangfordDataImpl) stock3.getLangfordData();
            langfordData3.setMacd(new MACD(0.5f, 0.0f, 0.9f, 0.3f));
            langfordDataService.calculateVariation(langfordData3);
            assertEquals("+", langfordData3.getVariation());
            assertNull(langfordData3.getSignal());
        }

        {
            val langfordData4 = (LangfordDataImpl) stock4.getLangfordData();
            langfordData4.setMacd(new MACD(0.4f, 0.0f, 0.8f, 0.3f));
            langfordDataService.calculateVariation(langfordData4);
            assertEquals("+", langfordData4.getVariation());
            assertNull(langfordData4.getSignal());
        }

        {
            val langfordData5 = (LangfordDataImpl) stock5.getLangfordData();
            langfordData5.setMacd(new MACD(0.4f, 0.0f, 0.6f, 0.3f));
            langfordDataService.calculateVariation(langfordData5);
            assertEquals("-", langfordData5.getVariation());
            assertEquals(Signal.MACD_OSS, langfordData5.getSignal());
        }

        {
            val langfordData6 = (LangfordDataImpl) stock6.getLangfordData();
            langfordData6.setMacd(new MACD(0.4f, 0.0f, 0.4f, 0.3f));
            langfordDataService.calculateVariation(langfordData6);
            assertEquals("-", langfordData6.getVariation());
            assertNull(langfordData6.getSignal());
        }
    }

    @org.junit.Test
    public void test_calculateRsi_moreThan14stocks() throws Exception
    {
        createStock(simpleDao, "ALE", 1, new Date(2006, 10, 1), 98.03f,
                                         b -> b.stockQuoteNavigator(navigator));
        createStock(simpleDao, "ALE", 2, new Date(2006, 10, 1), 98.51f,
                                         b -> b.stockQuoteNavigator(navigator));
        createStock(simpleDao, "ALE", 3, new Date(2006, 10, 1), 98.58f,
                                         b -> b.stockQuoteNavigator(navigator));
        createStock(simpleDao, "ALE", 4, new Date(2006, 10, 1), 98.56f,
                                         b -> b.stockQuoteNavigator(navigator));
        createStock(simpleDao, "ALE", 5, new Date(2006, 10, 1), 98.93f,
                                         b -> b.stockQuoteNavigator(navigator));

        createStock(simpleDao, "ALE", 6, new Date(2006, 10, 1), 98.11f,
                                         b -> b.stockQuoteNavigator(navigator));
        createStock(simpleDao, "ALE", 7, new Date(2006, 10, 1), 97.81f,
                                         b -> b.stockQuoteNavigator(navigator));
        createStock(simpleDao, "ALE", 8, new Date(2006, 10, 1), 97.62f,
                                         b -> b.stockQuoteNavigator(navigator));
        createStock(simpleDao, "ALE", 9, new Date(2006, 10, 1), 98.80f,
                                         b -> b.stockQuoteNavigator(navigator));
        createStock(simpleDao, "ALE", 10, new Date(2006, 10, 1), 98.72f,
                                         b -> b.stockQuoteNavigator(navigator));

        createStock(simpleDao, "ALE", 11, new Date(2006, 10, 1), 97.97f,
                                         b -> b.stockQuoteNavigator(navigator));
        createStock(simpleDao, "ALE", 12, new Date(2006, 10, 1), 97.54f,
                                         b -> b.stockQuoteNavigator(navigator));
        createStock(simpleDao, "ALE", 13, new Date(2006, 10, 1), 96.60f,
                                         b -> b.stockQuoteNavigator(navigator));
        createStock(simpleDao, "ALE", 14, new Date(2006, 10, 1), 97.38f,
                                         b -> b.stockQuoteNavigator(navigator));
        createStock(simpleDao, "ALE", 15, new Date(2006, 10, 1), 96.54f,
                                         b -> b.stockQuoteNavigator(navigator));

        createStock(simpleDao, "ALE", 16, new Date(2006, 10, 1), 96.49f,
                                         b -> b.stockQuoteNavigator(navigator));
        createStock(simpleDao, "ALE", 17, new Date(2006, 10, 1), 97.47f,
                                         b -> b.stockQuoteNavigator(navigator));
        createStock(simpleDao, "ALE", 18, new Date(2006, 10, 1), 97.68f,
                                         b -> b.stockQuoteNavigator(navigator));
        createStock(simpleDao, "ALE", 19, new Date(2006, 10, 1), 97.90f,
                                         b -> b.stockQuoteNavigator(navigator));
        createStock(simpleDao, "ALE", 20, new Date(2006, 10, 1), 98.08f,
                                         b -> b.stockQuoteNavigator(navigator));

        //  prerequisite
        for (Iterator iterator = simpleDao.stocks.iterator(); iterator.hasNext();)
        {
            StockQuoteImpl stockQuote = (StockQuoteImpl) iterator.next();
            stockQuoteService.calculatePriceDifference(stockQuote);
        }

        assertRsi(simpleDao, 15, 39.72);
        assertRsi(simpleDao, 16, 35.19);
        assertRsi(simpleDao, 17, 42.82);
        assertRsi(simpleDao, 18, 44.44);
        assertRsi(simpleDao, 19, 43.37);
        assertRsi(simpleDao, 20, 49.79);
    }

    @org.junit.Test
    public void test_calculateRsi_lessThan14stocks() throws Exception
    {
        createStock(simpleDao, "ALE", 1, new Date(2006, 10, 1), 98.03f,
                                         b -> b.stockQuoteNavigator(navigator));
        createStock(simpleDao, "ALE", 2, new Date(2006, 10, 1), 98.51f,
                                         b -> b.stockQuoteNavigator(navigator));
        createStock(simpleDao, "ALE", 3, new Date(2006, 10, 1), 98.58f,
                                         b -> b.stockQuoteNavigator(navigator));
        createStock(simpleDao, "ALE", 4, new Date(2006, 10, 1), 98.56f,
                                         b -> b.stockQuoteNavigator(navigator));
        createStock(simpleDao, "ALE", 5, new Date(2006, 10, 1), 98.93f,
                                         b -> b.stockQuoteNavigator(navigator));

        createStock(simpleDao, "ALE", 6, new Date(2006, 10, 1), 98.11f,
                                         b -> b.stockQuoteNavigator(navigator));
        createStock(simpleDao, "ALE", 7, new Date(2006, 10, 1), 97.81f,
                                         b -> b.stockQuoteNavigator(navigator));

        //  prerequisite
        for (Iterator iterator = simpleDao.stocks.iterator(); iterator.hasNext();)
        {
            StockQuoteImpl stockQuote = (StockQuoteImpl) iterator.next();
            stockQuoteService.calculatePriceDifference(stockQuote);
        }

        assertRsi(simpleDao, 1, 0);
        assertRsi(simpleDao, 2, 0);
        assertRsi(simpleDao, 3, 0);
        assertRsi(simpleDao, 4, 0);
        assertRsi(simpleDao, 5, 0);
        assertRsi(simpleDao, 6, 0);
    }

    private void assertRsi(final SimpleStockDAO pDao, int pPeriodSeq, double pExpectedRsi) throws Exception {
        val s = pDao.getStockByPeriodSequence(pPeriodSeq);
        val langfordData = (LangfordDataImpl) s.getLangfordData();
        langfordDataService.calculateRSI(langfordData);
        Assert.assertEquals(pExpectedRsi, langfordData.getRsi().rsi, 0.005);
    }
}
