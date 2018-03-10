/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom;

import com.quartz.qtrend.dom.aroon.Aroon;
import com.quartz.qtrend.dom.exchanges.StockQuoteVariation;
import com.quartz.qtrend.dom.helpers.Price;
import com.quartz.qtrend.dom.langford.LangfordData;

import java.sql.Time;
import java.util.List;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class StockQuoteImpl extends AbstractStockQuoteImpl implements StockQuote
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private long      pk = -1l;     //key below zero means not saved.
    private int       periodSequence;

    private Time      time;

    private long    volume;
    private long    averageVolume;

    private Price   open;
    private Price   low;
    private Price   high;
    private float   priceDifference;

    private StockQuoteNavigator stockQuoteNavigator = null;

    private LangfordData        langfordData = null;
    private StockQuoteVariation variation = null;

    private StockQuote       previousStockQuote;
    private List<StockQuote>   previousStocksIncludingMe;

    private Aroon aroonShortTerm = null;
    private Aroon aroonLongTerm = null;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public StockQuoteImpl()
    {
        super();
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public Aroon getAroonShortTerm() throws StockException
    {
        if (aroonShortTerm == null)
        {
//            aroonShortTerm = stockQuoteDao.fetchAroon(this, 7);
            if (aroonShortTerm == null) throw new StockException("Aroon not loaded!");
        }

        return aroonShortTerm;
    }

    public Aroon getAroonLongTerm() throws StockException
    {
        if (aroonLongTerm == null)
        {
//            aroonLongTerm = stockQuoteDao.fetchAroon(this, 28);
            if (aroonLongTerm == null) throw new StockException("Aroon not loaded!");
        }

        return aroonLongTerm;
    }

    public void setAroonShortTerm(Aroon pAroonShortTerm)
    {
        aroonShortTerm = pAroonShortTerm;
    }

    public void setAroonLongTerm(Aroon pAroonLongTerm)
    {
        aroonLongTerm = pAroonLongTerm;
    }


    public StockQuoteNavigator getStockQuoteNavigator()
    {
        return stockQuoteNavigator;
    }

    public void setStockQuoteNavigator(StockQuoteNavigator pStockQuoteNavigator)
    {
        stockQuoteNavigator = pStockQuoteNavigator;
    }

    /**
     *
     * @return The {@link StockQuoteVariation} if present
     */
    public StockQuoteVariation getVariation()
    {
        return variation;
    }

    public long getId()
    {
        return pk;
    }

    public void setId(long pId)
    {
        pk = pId;
    }

    public int getPeriodSequence()
    {
        return periodSequence;
    }

    public void setPeriodSequence(int pPeriodSequence)
    {
        periodSequence = pPeriodSequence;
    }

    public Time getTime()
    {
        return time;
    }

    public void setTime(Time pTime)
    {
        time = pTime;
    }

    public long getVolume()
    {
        return volume;
    }

    public void setVolume(long pVolume)
    {
        volume = pVolume;
    }

    public long getAverageVolume()
    {
        return averageVolume;
    }

    public void setAverageVolume(long pAverageVolume)
    {
        averageVolume = pAverageVolume;
    }

    public Price getOpen()
    {
        return open;
    }

    public void setOpen(Price pOpen)
    {
        open = pOpen;
    }

    public Price getLow()
    {
        return low;
    }

    public void setLow(Price pLow)
    {
        low = pLow;
    }

    public Price getHigh()
    {
        return high;
    }

    public void setHigh(Price pHigh)
    {
        high = pHigh;
    }

    public float getPriceDifference()
    {
        return priceDifference;
    }

    public void setPriceDifference(float pPriceDifference)
    {
        priceDifference = pPriceDifference;
    }

    public LangfordData getLangfordData() throws StockException
    {
        if (langfordData == null) throw new StockException("Langford data not loaded!");
        return langfordData;
    }

    public void setLangfordData(LangfordData pLangfordData)
    {
        langfordData = pLangfordData;
    }


    public boolean equals(Object o)
    {
        if (this == o) return true;
        if (!(o instanceof StockQuoteImpl)) return false;

        final StockQuoteImpl stock = (StockQuoteImpl) o;

        if (averageVolume != stock.averageVolume) return false;
        if (periodSequence != stock.periodSequence) return false;
        if (priceDifference != stock.priceDifference) return false;
        if (volume != stock.volume) return false;
        if (close != null ? !close.equals(stock.close) : stock.close != null) return false;
        if (date != null ? !date.equals(stock.date) : stock.date != null) return false;
        if (high != null ? !high.equals(stock.high) : stock.high != null) return false;
        if (langfordData != null ? !langfordData.equals(stock.langfordData) : stock.langfordData != null) return false;
        if (low != null ? !low.equals(stock.low) : stock.low != null) return false;
        if (open != null ? !open.equals(stock.open) : stock.open != null) return false;
        if (!stockExchange.equals(stock.stockExchange)) return false;
        if (!ticker.equals(stock.ticker)) return false;
        if (time != null ? !time.equals(stock.time) : stock.time != null) return false;

        return true;
    }

    public int hashCode()
    {
        int result;
        result = stockExchange.hashCode();
        result = 29 * result + ticker.hashCode();
        result = 29 * result + periodSequence;
        result = 29 * result + (date != null ? date.hashCode() : 0);
        result = 29 * result + (time != null ? time.hashCode() : 0);
        result = 29 * result + (int) (volume ^ (volume >>> 32));
        result = 29 * result + (int) (averageVolume ^ (averageVolume >>> 32));
        result = 29 * result + (open != null ? open.hashCode() : 0);
        result = 29 * result + (low != null ? low.hashCode() : 0);
        result = 29 * result + (high != null ? high.hashCode() : 0);
        result = 29 * result + (close != null ? close.hashCode() : 0);
        result = 29 * result + priceDifference != +0.0f ? Float.floatToIntBits(priceDifference) : 0;
        result = 29 * result + (langfordData != null ? langfordData.hashCode() : 0);
        return result;
    }

    public void setVariation(StockQuoteVariation pVariation)
    {
        this.variation = pVariation;
    }

    public boolean hasLangfordData()
    {
        return (langfordData != null);
    }

    public boolean hasAroonShortTerm()
    {
        return (aroonShortTerm != null);
    }

    public boolean hasAroonLongTerm()
    {
        return (aroonLongTerm != null);
    }

    public StockQuote getPreviousStockQuote()
    {
        return previousStockQuote;
    }

    public void setPreviousStockQuote(StockQuote pPreviousStockQuote)
    {
        previousStockQuote = pPreviousStockQuote;
    }

    public List<StockQuote> getPreviousStocksIncludingMe()
    {
        return previousStocksIncludingMe;
    }

    public void setPreviousStocksIncludingMe(List<StockQuote> pPreviousStocksIncludingMe)
    {
        previousStocksIncludingMe = pPreviousStocksIncludingMe;
    }

    public String toString()
    {
        final StringBuffer buffer = new StringBuffer(super.toString());

        buffer.append(" #").append(periodSequence);
        if (langfordData != null)
        {
            buffer.append(" RSI=" + langfordData.getRsi());
            if (langfordData.getSignal() != null)
            {
                buffer.append(" " + langfordData.getSignal());
            }
        }

        return buffer.toString().trim();
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
