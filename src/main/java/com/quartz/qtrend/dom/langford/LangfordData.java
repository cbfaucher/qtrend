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
    StockQuote getStockQuote();

    EMA getShortTermEma();

    EMA getLongTermEma();
    EMA getEma56();
    EMA getEma112();

    RSI getRsi();
    MACD getMacd();

    String getVariation();
    Signal getSignal();
    Float getIncomingSignal();

    @Deprecated
    void setRsi(RSI pRsi);

    @Deprecated
    void setShortTermEma(EMA pShortTermEma);

    @Deprecated
    void setLongTermEma(EMA pLongTermEma);

    @Deprecated
    void setEma56(EMA pEma);

    @Deprecated
    void setEma112(EMA pEma);

    @Deprecated
    void setMacd(MACD pMacd);

    @Deprecated
    void setVariation(String pVariation);

    @Deprecated
    void setSignal(Signal pSignal);

    @Deprecated
    void setIncomingSignal(Float pIncomingSignal);

}
