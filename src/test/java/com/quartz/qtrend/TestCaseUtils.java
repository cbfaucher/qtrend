package com.quartz.qtrend;

import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuoteImpl;
import com.quartz.qtrend.dom.dao.IStockQuoteDAO;
import com.quartz.qtrend.dom.helpers.MACD;
import com.quartz.qtrend.dom.helpers.Price;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.langford.LangfordDataImpl;
import com.quartz.qutilities.util.DateUtilities;
import lombok.val;
import org.junit.Assert;

import java.sql.Date;
import java.util.function.Consumer;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

public interface TestCaseUtils {

    default StockQuoteImpl createStock(IStockQuoteDAO pStockDAO,
                                       String pTicker,
                                       int pPeriodSeq,
                                       Date pDate,
                                       float pClose,
                                       Consumer<StockQuoteImpl.StockQuoteImplBuilder> filler) throws StockException {
        val stockQuoteBuilder = StockQuoteImpl.builder()
                                              .stockExchange(new Ticker("TSE"))
                                              .ticker(new Ticker(pTicker))
                                              .periodSequence(pPeriodSeq)
                                              .date(DateUtilities.toLocalDate(pDate))
                                              .stockQuoteNavigator(pStockDAO instanceof SimpleStockDAO
                                                                   ? ((SimpleStockDAO) pStockDAO).navigator
                                                                   : null)
                                              .close(new Price(pClose));
        if (filler != null) {
            filler.accept(stockQuoteBuilder);
        }

        val stockQuote = stockQuoteBuilder.build();

        stockQuote.setLangfordData(new LangfordDataImpl(stockQuote));

        pStockDAO.insert(stockQuote);

        return stockQuote;
    }

    default void assertMacdEquals(final MACD pExpected, final MACD pActual) {
        if (pExpected == null) {
            assertNull(pActual);
        } else {
            assertNotNull(pActual);
            Assert.assertEquals(pExpected.macd, pActual.macd, 0.005f);
            Assert.assertEquals(pExpected.emaDifference, pActual.emaDifference, 0.005f);
            Assert.assertEquals(pExpected.shortTermEma.ema, pActual.shortTermEma.ema, 0.005f);
            Assert.assertEquals(pExpected.longTermEma.ema, pActual.longTermEma.ema, 0.005f);
        }
    }

    default void assertEMAs(StockQuoteImpl pStock, float pExpectedStEMA, float pExpectedLtEMA) throws StockException {
        Assert.assertEquals(pExpectedStEMA, pStock.getLangfordData().getShortTermEma().ema, 0.0005);
        Assert.assertEquals(pExpectedLtEMA, pStock.getLangfordData().getLongTermEma().ema, 0.0005);
    }

}
