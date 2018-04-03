package com.quartz.qtrend.dom.dao;

import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;

public interface IStockQuoteDAO {
    StockQuote insert(final StockQuote pStockQuote) throws StockException;

    boolean saveQuoteOnly(StockQuote pStockQuote) throws StockException;
}
