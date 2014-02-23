/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.langford;

import com.quartz.qtrend.Signal;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.helpers.EMA;
import com.quartz.qtrend.dom.helpers.MACD;
import com.quartz.qtrend.dom.helpers.RSI;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class LangfordDataImpl implements LangfordData
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final private StockQuote stockQuote;
    private RSI rsi;
    private EMA shortTermEma;
    private EMA longTermEma;
    private EMA ema56;
    private EMA ema112;
    private MACD macd;
    private String variation = "";
    private Signal signal = null;
    private Float incomingSignal = null;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public LangfordDataImpl(StockQuote pStock)
    {
        stockQuote = pStock;
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public StockQuote getStockQuote()
    {
        return stockQuote;
    }

    public RSI getRsi()
    {
        return rsi;
    }

    public void setRsi(RSI pRsi)
    {
        rsi = pRsi;
    }

    public EMA getShortTermEma()
    {
        return shortTermEma;
    }

    public void setShortTermEma(EMA pShortTermEma)
    {
        shortTermEma = pShortTermEma;
    }

    public EMA getLongTermEma()
    {
        return longTermEma;
    }

    public void setLongTermEma(EMA pLongTermEma)
    {
        longTermEma = pLongTermEma;
    }

    public EMA getEma56()
    {
        return ema56;
    }

    public void setEma56(EMA pEma56)
    {
        ema56 = pEma56;
    }

    public EMA getEma112()
    {
        return ema112;
    }

    public void setEma112(EMA pEma112)
    {
        ema112 = pEma112;
    }

    public MACD getMacd()
    {
        return macd;
    }

    public void setMacd(MACD pMacd)
    {
        macd = pMacd;
    }

    public String getVariation()
    {
        return variation;
    }

    public void setVariation(String pVariation)
    {
        variation = pVariation;
    }

    public Signal getSignal()
    {
        return signal;
    }

    public void setSignal(Signal pSignal)
    {
        signal = pSignal;
    }

    public Float getIncomingSignal()
    {
        return incomingSignal;
    }

    public void setIncomingSignal(Float pIncomingSignal)
    {
        incomingSignal = pIncomingSignal;
    }

    public boolean equals(Object o)
    {
        if (this == o) return true;
        if (!(o instanceof LangfordDataImpl)) return false;

        final LangfordDataImpl langfordData = (LangfordDataImpl) o;

        if (longTermEma != null ? !longTermEma.equals(langfordData.longTermEma) : langfordData.longTermEma != null) return false;
        if (macd != null ? !macd.equals(langfordData.macd) : langfordData.macd != null) return false;
        if (rsi != null ? !rsi.equals(langfordData.rsi) : langfordData.rsi != null) return false;
        if (shortTermEma != null ? !shortTermEma.equals(langfordData.shortTermEma) : langfordData.shortTermEma != null) return false;

        return true;
    }

    public int hashCode()
    {
        int result;
        result = (rsi != null ? rsi.hashCode() : 0);
        result = 29 * result + (shortTermEma != null ? shortTermEma.hashCode() : 0);
        result = 29 * result + (longTermEma != null ? longTermEma.hashCode() : 0);
        result = 29 * result + (macd != null ? macd.hashCode() : 0);
        return result;
    }


    ///////////////////////////////////////
    ////    INNER CLASSES

}
