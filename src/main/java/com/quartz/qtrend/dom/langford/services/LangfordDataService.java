/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.langford.services;

import com.quartz.qtrend.QTrendConfiguration;
import com.quartz.qtrend.Signal;
import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.helpers.EMA;
import com.quartz.qtrend.dom.helpers.MACD;
import com.quartz.qtrend.dom.helpers.RSI;
import com.quartz.qtrend.dom.langford.EmaRetriever;
import com.quartz.qtrend.dom.langford.LangfordData;
import com.quartz.qtrend.dom.services.ServicesHelper;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.dom.services.StockQuoteService;
import com.quartz.qutilities.math.Dot;
import com.quartz.qutilities.math.Line;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.Collection;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
@NoArgsConstructor
public class LangfordDataService
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static public final EmaRetriever STEMA_RETRIEVER = new EmaRetriever()
    {

        public float getValue(StockQuote pStock)
        {
            return pStock.getClose().price;
        }

        public float getEMA(StockQuote pStock) throws StockException
        {
            return pStock.getLangfordData().getShortTermEma().ema;
        }
    };

    private static final EmaRetriever LTEMA_RETRIEVER = new EmaRetriever()
    {

        public float getValue(StockQuote pStock)
        {
            return pStock.getClose().price;
        }

        public float getEMA(StockQuote pStock) throws StockException
        {
            return pStock.getLangfordData().getLongTermEma().ema;
        }
    };

    private static final EmaRetriever EMA56_RETRIEVER = new EmaRetriever()
    {

        public float getValue(StockQuote pStock)
        {
            return pStock.getClose().price;
        }

        public float getEMA(StockQuote pStock) throws StockException
        {
            final EMA ema56 = pStock.getLangfordData().getEma56();
            return (ema56 != null ? ema56.ema : pStock.getClose().price);
        }
    };
    private static final EmaRetriever EMA112_RETRIEVER = new EmaRetriever()
    {

        public float getValue(StockQuote pStock)
        {
            return pStock.getClose().price;
        }

        public float getEMA(StockQuote pStock) throws StockException
        {
            final EMA ema112 = pStock.getLangfordData().getEma112();
            return (ema112 != null ? ema112.ema : pStock.getClose().price);
        }
    };

    //  set by spring
    @Setter private JdbcTemplate jdbcTemplate = null;
    @Setter private StockQuoteListService stockQuotesService;
    @Setter private StockQuoteService   stockQuoteService;

    private static final EmaRetriever MACD_STEMA_RETRIEVER = new EmaRetriever()
    {

        public float getValue(StockQuote pStock)
        {
            return pStock.getClose().price;
        }

        public float getEMA(StockQuote pStock) throws StockException
        {
            return pStock.getLangfordData().getMacd().shortTermEma.ema;
        }
    };
    private static final EmaRetriever MACD_LTEMA_RETRIEVER = new EmaRetriever()
    {

        public float getValue(StockQuote pStock)
        {
            return pStock.getClose().price;
        }

        public float getEMA(StockQuote pStock) throws StockException
        {
            return pStock.getLangfordData().getMacd().longTermEma.ema;
        }
    };
    static final String POSITIVE = "+";
    static final String NEGATIVE = "-";
    static final String NO_VARIATION = "";

    //  todo: SQL
    private static final String SQL_INSERT_LANGFORD = "INSERT INTO Langford(REFID, RSI, STEMA, LTEMA, EMA56, EMA112, " +
                    "MACDSTEMA, MACDLTEMA, EMADIFFERENCE, MACD, VARIATION, SIGNAL, NEXTSIGNAL) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SQL_UPDATE_LANGFORD = "UPDATE Langford " +
                    "SET RSI=?, STEMA=?, LTEMA=?, EMA56=?, EMA112=?, MACDSTEMA=?, MACDLTEMA=?, EMADIFFERENCE=?, MACD=?, VARIATION=?, SIGNAL=?, NEXTSIGNAL=? " +
                    "WHERE REFID=?;";


    public void saveLangfordDataOnly(StockQuote pStockQuote, boolean pInsert) throws StockException
    {
        if (pInsert)
        {
            insert(pStockQuote);
        }
        else
        {
            update(pStockQuote);
        }
    }

    public void calculate(LangfordData pLangfordData) throws StockException
    {
        calculateRSI(pLangfordData);
        calculateEMAs(pLangfordData);
        calculateMacd(pLangfordData, QTrendConfiguration.LangfordConfiguration.MACD_PERIOD);
        calculateVariation(pLangfordData);
        calculateEmaSignal(pLangfordData);
        calculateIncomingMacdSignal(pLangfordData);
    }

    public void calculateRSI(LangfordData pLangfordData) throws StockException
    {
//        final Collection<StockQuote> previousStocks = pLangfordData.getStockQuote().getPreviousQuotesIncludingMe(QTrendConfiguration.LangfordConfiguration.RSI_PERIOD);
        final Collection<StockQuote> previousStocks = stockQuotesService.getPreviousQuotesIncludingMe(
                pLangfordData.getStockQuote(), QTrendConfiguration.LangfordConfiguration.RSI_PERIOD,
                pLangfordData.getStockQuote().getStockQuoteNavigator());

        if (previousStocks.size() < QTrendConfiguration.LangfordConfiguration.RSI_PERIOD)
        {
            pLangfordData.setRsi(new RSI(0));
            return;
        }

        float positiveDiffSum = 0;
        float negativeDiffSum = 0;

        for (StockQuote s : previousStocks)
        {
            float diff = s.getPriceDifference();
            if (diff >= 0)
            {
                positiveDiffSum += diff;
            }
            else
            {
                negativeDiffSum += Math.abs(diff);
            }
        }

        float rs = 1 + (positiveDiffSum / QTrendConfiguration.LangfordConfiguration.RSI_PERIOD) / (negativeDiffSum / QTrendConfiguration.LangfordConfiguration.RSI_PERIOD);
        float rsiValue = 100 - 100 / rs;
        pLangfordData.setRsi(new RSI(rsiValue));
    }

    void calculateEMAs(LangfordData pLangfordData) throws StockException
    {
        final StockQuote previous = stockQuoteService.getPreviousQuote(pLangfordData.getStockQuote());

        pLangfordData.setShortTermEma(new EMA(calculateEMA(pLangfordData, previous, STEMA_RETRIEVER, QTrendConfiguration.LangfordConfiguration.SHORT_TERM_EMA_PERIOD)));
        pLangfordData.setLongTermEma(new EMA(calculateEMA(pLangfordData, previous, LTEMA_RETRIEVER, QTrendConfiguration.LangfordConfiguration.LONG_TERM_EMA_PERIOD)));
        pLangfordData.setEma56(new EMA(calculateEMA(pLangfordData, previous, EMA56_RETRIEVER, new QTrendConfiguration.EMAConfiguration(56))));
        pLangfordData.setEma112(new EMA(calculateEMA(pLangfordData, previous, EMA112_RETRIEVER, new QTrendConfiguration.EMAConfiguration(112))));
    }

    public float calculateEMA(LangfordData pLangfordData, final StockQuote pPrevious, final EmaRetriever pRetriever, QTrendConfiguration.EMAConfiguration pConfiguration) throws StockException
    {
        //EMA(current) = ( (Price(current) - EMA(prev) ) x Multiplier) + EMA(prev)

        final float value = pRetriever.getValue(pLangfordData.getStockQuote());

        if (pPrevious != null)
        {
            final float previousEma = pRetriever.getEMA(pPrevious);
            float theEma = (value - previousEma) * pConfiguration.alpha + previousEma;
            return theEma;
        }
        else
        {
            return value;
        }
    }

    public void calculateMacd(LangfordData pLangfordData, final QTrendConfiguration.MACDConfiguration pMacdPeriod) throws StockException
    {
        final StockQuote previous = stockQuoteService.getPreviousQuote(pLangfordData.getStockQuote());

        final float macdStEma = calculateEMA(pLangfordData, previous, MACD_STEMA_RETRIEVER, pMacdPeriod.shortTermPeriod);
        final float macdLtEma = calculateEMA(pLangfordData, previous, MACD_LTEMA_RETRIEVER, pMacdPeriod.longTermPeriod);

        final float macdEmaDifference = macdStEma - macdLtEma;

        final float macdCalculated = calculateEMA(pLangfordData, previous, new EmaRetriever() {

            public float getValue(StockQuote pStock)
            {
                return macdEmaDifference;
            }

            public float getEMA(StockQuote pStock) throws StockException
            {
                return pStock.getLangfordData().getMacd().macd;
            }
        }, pMacdPeriod.averagePeriod);

        pLangfordData.setMacd(new MACD(macdCalculated, macdEmaDifference, macdStEma, macdLtEma));
    }

    public void calculateVariation(LangfordData pLangfordData) throws StockException
    {
        final MACD macd = pLangfordData.getMacd();

        float diff = macd.shortTermEma.ema - macd.longTermEma.ema;

        diff = ((float) Math.round(diff * 100000)) / 100000f;

        if (diff > macd.macd)
        {
            pLangfordData.setVariation(POSITIVE);
        }
        else if (diff < macd.macd)
        {
            pLangfordData.setVariation(NEGATIVE);
        }
        else
        {
            pLangfordData.setVariation(NO_VARIATION);
        }

        if (pLangfordData.getVariation().equals(NO_VARIATION))
        {
            pLangfordData.setSignal(null);
        }

        final StockQuote previous = stockQuoteService.getPreviousQuote(pLangfordData.getStockQuote());
        if (previous != null)
        {
            final LangfordData previousLangford = previous.getLangfordData();

            if (pLangfordData.getVariation().equals(previousLangford.getVariation()))
            {
                pLangfordData.setSignal(null);
            }
            else
            {
                if (pLangfordData.getVariation().equals(POSITIVE))
                {
                    pLangfordData.setSignal(Signal.MACD_OBS);
                }
                else if (pLangfordData.getVariation().equals(NEGATIVE)) {
                    pLangfordData.setSignal(Signal.MACD_OSS);
                }
            }
        }
    }

    private void calculateEmaSignal(LangfordData pLangfordData) throws StockException
    {
        final StockQuote previous = stockQuoteService.getPreviousQuote(pLangfordData.getStockQuote());
        if (previous == null) return;

        //  this difference
        final float thisDifference = pLangfordData.getShortTermEma().ema - pLangfordData.getLongTermEma().ema;

        //  previous difference
        final LangfordData previousLangford = previous.getLangfordData();
        final float previousDifference = previousLangford.getShortTermEma().ema - previousLangford.getLongTermEma().ema;

        if ( (thisDifference < 0 && previousDifference < 0)
              || (thisDifference > 0 && previousDifference > 0)
              || (thisDifference == previousDifference))
        {
            //  both have the same signs or same value, e.g. no variation. --> No signal
            return;
        }

        //  if this difference is positive
        if (thisDifference > 0)
        {
            pLangfordData.setSignal(Signal.EMA_OBS);
        }
        else
        {
            pLangfordData.setSignal(Signal.EMA_OSS);
        }
    }

    private void calculateNextEmaSignal(LangfordData pLangfordData) throws StockException
    {
        //  if this.signal == EMA_* --> 0
        //  get previous and previous of previous langford (...where periodsequencethis.periodseuqnece-2);

        /*
        if (previous.signal != '' || previousOfPrevious.signal != '') nextSignal="N/A"

        if (EMA7 > EMA28)
        {
            next MAS

            (pOfP.periodSeq, (ema28-ema7)), (this.periodSeq, (ema28-ema7))
            0 = line(x)
            x = x - this.periodsequence

            if (x < 0) --> N/A
            if (x == 0) OK
        }
        else
        {
            next MAB

            (pOfP.periodSeq, (ema7-ema28)), (this.periodSeq, (ema7-ema28))
            0 = line(x)
            x = x - this.periodsequence

            if (x < 0) --> N/A
            if (x == 0) OK
        }
        */
    }

    private void insert(StockQuote pStockQuote) throws StockException
    {
        final LangfordData langfordData = pStockQuote.getLangfordData();

        if(jdbcTemplate.update(
                SQL_INSERT_LANGFORD,
                pStockQuote.getId(),
                ServicesHelper.createSqlParameterValue(langfordData.getRsi()),
                ServicesHelper.createSqlParameterValue(langfordData.getShortTermEma()),
                ServicesHelper.createSqlParameterValue(langfordData.getLongTermEma()),
                ServicesHelper.createSqlParameterValue(langfordData.getEma56()),
                ServicesHelper.createSqlParameterValue(langfordData.getEma112()),
                ServicesHelper.createSqlParameterValue(langfordData.getMacd().shortTermEma),
                ServicesHelper.createSqlParameterValue(langfordData.getMacd().longTermEma),
                langfordData.getMacd().emaDifference,
                langfordData.getMacd().macd,
                langfordData.getVariation().trim(),
                (langfordData.getSignal() != null ? langfordData.getSignal().getSignal() : ""),
                langfordData.getIncomingSignal()) != 1)
        {
            throw new StockException("No row inserted?!");
        }
    }

    private void update(StockQuote pStockQuote)
            throws StockException
    {
        final LangfordData langfordData= pStockQuote.getLangfordData();
        if (jdbcTemplate.update(
                SQL_UPDATE_LANGFORD,
                ServicesHelper.createSqlParameterValue(langfordData.getRsi()),
                ServicesHelper.createSqlParameterValue(langfordData.getShortTermEma()),
                ServicesHelper.createSqlParameterValue(langfordData.getLongTermEma()),
                ServicesHelper.createSqlParameterValue(langfordData.getEma56()),
                ServicesHelper.createSqlParameterValue(langfordData.getEma112()),
                ServicesHelper.createSqlParameterValue(langfordData.getMacd().shortTermEma),
                ServicesHelper.createSqlParameterValue(langfordData.getMacd().longTermEma),
                langfordData.getMacd().emaDifference,
                langfordData.getMacd().macd,
                langfordData.getVariation(),
                (langfordData.getSignal() != null ? langfordData.getSignal().getSignal() : ""),
                langfordData.getIncomingSignal(),
                pStockQuote.getId()) != 1)
        {
            throw new StockException("No row updated?!");
        }
    }


    private void calculateIncomingMacdSignal(LangfordData pLangfordData) throws StockException
    {


//        final StockQuoteImpl previous = (StockQuoteImpl) pLangfordData.getS.getPreviousQuote();
        final StockQuote previous = stockQuoteService.getPreviousQuote(pLangfordData.getStockQuote());

        if (previous == null)
            return;

        final StockQuote previousOfPrevious = stockQuoteService.getPreviousQuote(previous);
        if (previousOfPrevious == null)
            return;

        final float diffPrev = previous.getLangfordData().getMacd().macd - previousOfPrevious.getLangfordData().getMacd().macd;
        final float diff = pLangfordData.getMacd().macd - previous.getLangfordData().getMacd().macd;

        final Line macdDiffLine = Line.compute(previous.getPeriodSequence(), diffPrev,
                                               pLangfordData.getStockQuote().getPeriodSequence(), diff);

        /*
        0 = m * x + b
        -b = m * x
        -b / m = x
        */
        final Dot zero = macdDiffLine.xAt(0);
        pLangfordData.setIncomingSignal(zero.x - pLangfordData.getStockQuote().getPeriodSequence());

/*
        final Line emaLine = Line.compute(
                -2f, previousOfPrevious.getLangfordData().getMacd().emaDifference,
                0f, this.getMacd().emaDifference);
        final Line macdLine = Line.compute(
                -2f, previousOfPrevious.getLangfordData().getMacd().macd,
                0f, this.getMacd().macd);

        final Dot predict = emaLine.intersects(macdLine);
        if (predict.x <= 0)
        {
            System.out.println("Last intersect in the past...");
        }
        else if (predict.x >= 3)
        {
            System.out.println("Next intersect too far ahead...");
        }

        incomingSignal = new Float(predict.x);
*/
    }

}
