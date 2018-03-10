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
public interface LangfordData
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    ///////////////////////////////////////
    ////    INNER CLASSES
    RSI getRsi();

    EMA getShortTermEma();

    EMA getLongTermEma();

    EMA getEma56();

    EMA getEma112();

    MACD getMacd();

    void setRsi(RSI pRsi);

    void setShortTermEma(EMA pShortTermEma);

    void setLongTermEma(EMA pLongTermEma);

    void setEma56(EMA pEma);
    void setEma112(EMA pEma);

    void setMacd(MACD pMacd);

    String getVariation();

    void setVariation(String pVariation);

    Signal getSignal();

    void setSignal(Signal pSignal);

    Float getIncomingSignal();

    void setIncomingSignal(Float pIncomingSignal);


    StockQuote getStockQuote();
}
