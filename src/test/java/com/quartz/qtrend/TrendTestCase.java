/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend;

import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuoteImpl;
import com.quartz.qtrend.dom.dao.IStockQuoteDAO;
import com.quartz.qtrend.dom.dao.StockQuoteDAO;
import com.quartz.qtrend.dom.helpers.MACD;
import com.quartz.qtrend.dom.helpers.Price;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.langford.LangfordDataImpl;
import com.quartz.qtrend.dom.langford.services.LangfordDataService;
import com.quartz.qutilities.unittests.QTestCase;
import com.quartz.qutilities.util.DateUtilities;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.junit.After;
import org.junit.Assert;

import java.sql.Date;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
@NoArgsConstructor
@AllArgsConstructor
public abstract class TrendTestCase extends QTestCase
{

    private boolean                 needsBootstrap;

    protected TrendTestCase(String s)
    {
        this(s, false);
    }

    protected TrendTestCase(String pName, boolean pNeedsBootstrap)
    {
        super(pName);
        needsBootstrap = pNeedsBootstrap;
    }

    protected void setUp() throws Exception
    {
        if (needsBootstrap)
        {
            Bootstrap.init(QTrendMode.USER_INTERFACE);
        }
    }

    @After
    public void tearDown() throws Exception
    {
        Bootstrap.destroy();
    }

    protected void assertEquals(final MACD pExpected, final MACD pActual)
    {
        if (pExpected == null)
        {
            assertNull(pActual);
        }
        else
        {
            assertNotNull(pActual);
            Assert.assertEquals(pExpected.macd, pActual.macd, 0.005f);
            Assert.assertEquals(pExpected.emaDifference, pActual.emaDifference, 0.005f);
            Assert.assertEquals(pExpected.shortTermEma.ema, pActual.shortTermEma.ema, 0.005f);
            Assert.assertEquals(pExpected.longTermEma.ema, pActual.longTermEma.ema, 0.005f);
        }
    }

    protected void assertEMAs(StockQuoteImpl pStock, float pExpectedStEMA, float pExpectedLtEMA) throws StockException
    {
        Assert.assertEquals(pExpectedStEMA, pStock.getLangfordData().getShortTermEma().ema, 0.0005);
        Assert.assertEquals(pExpectedLtEMA, pStock.getLangfordData().getLongTermEma().ema, 0.0005);
    }

    protected void assertRsi(final SimpleStockDAO pDao, int pPeriodSeq, double pExpectedRsi) throws Exception
    {
        final StockQuoteImpl s = pDao.getStockByPeriodSequence(pPeriodSeq);
        final LangfordDataImpl langfordData = (LangfordDataImpl) s.getLangfordData();
        final LangfordDataService langfordDataService = new LangfordDataService();
        langfordDataService.calculateRSI(langfordData);
        Assert.assertEquals(pExpectedRsi, langfordData.getRsi().rsi, 0.005);
    }

    protected StockQuoteImpl createStock(IStockQuoteDAO pStockDAO, String pTicker, int pPeriodSeq, Date pDate, float pClose)
    {
        StockQuoteImpl stock = new StockQuoteImpl();
        stock.setStockExchange(new Ticker("TSE"));
        stock.setTicker(new Ticker(pTicker));
        stock.setPeriodSequence(pPeriodSeq);
        stock.setDate(DateUtilities.toLocalDate(pDate));
        stock.setClose(new Price(pClose));

        pStockDAO.insert(stock);

        return stock;
    }
}
