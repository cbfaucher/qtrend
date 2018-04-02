package com.quartz.qtrend.dom.services;

import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.StockQuoteNavigator;
import com.quartz.qtrend.dom.helpers.Ticker;

import java.util.Collection;
import java.util.List;

public interface IStockQuoteListService {
    Collection<StockQuote> getPreviousQuotesIncludingMe(StockQuote pStockQuote, int pNumberOfQuotes, StockQuoteNavigator pNavigator) throws StockException;

    List<StockQuote> loadQuotes(List<Ticker> pTickers) throws StockException;
}
