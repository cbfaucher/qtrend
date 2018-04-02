package com.quartz.qtrend.dom.services;

import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.helpers.Ticker;

public interface IStockQuoteService {
    void saveQuoteAndIndicators(StockQuote pStockQuote) throws StockException;

    StockQuote getPreviousQuote(StockQuote pStockQuote) throws StockException;

    StockQuote getLatestQuote(Ticker pTicker) throws StockException;
}
