/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom;

import com.quartz.qtrend.dom.aroon.Aroon;
import com.quartz.qtrend.dom.aroon.IAroonParent;
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
public interface StockQuote extends AbstractStockQuote, IAroonParent
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    ///////////////////////////////////////
    ////    INNER CLASSES

    long getId();

    int getPeriodSequence();

    Time getTime();
    void setTime(Time pTime);

    Price getOpen();
    void setOpen(Price pOpen);

    Price getLow();

    void setLow(Price pLow);

    Price getHigh();

    void setHigh(Price pHigh);

    float getPriceDifference();

    void setPriceDifference(float pPriceDifference);

    LangfordData getLangfordData() throws StockException;

    long getAverageVolume();

    StockQuoteNavigator getStockQuoteNavigator();

    void setStockQuoteNavigator(StockQuoteNavigator pStockQuoteNavigator);

    void setPeriodSequence(int pPeriodSequence);

    StockQuoteVariation getVariation();

    void setId(long pPk);


    void setLangfordData(LangfordData pLangfordData);

    Aroon getAroonShortTerm() throws StockException;

    Aroon getAroonLongTerm() throws StockException;

    void setAroonShortTerm(Aroon pAroonShortTerm);

    void setAroonLongTerm(Aroon pAroonLongTerm);

    void setVariation(StockQuoteVariation pVariation);

    boolean hasLangfordData();

    boolean hasAroonShortTerm();

    boolean hasAroonLongTerm();

    StockQuote getPreviousStockQuote();

    void setPreviousStockQuote(StockQuote pPreviousStockQuote);

    List<StockQuote> getPreviousStocksIncludingMe();

    void setPreviousStocksIncludingMe(List<StockQuote> pPreviousStocksIncludingMe);
}
