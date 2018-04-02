package com.quartz.qtrend.dom.langford.services;

import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.langford.LangfordData;

public interface ILangfordDataService {
    void saveLangfordDataOnly(StockQuote pStockQuote, boolean pInsert) throws StockException;

    void calculate(LangfordData pLangfordData) throws StockException;
}
