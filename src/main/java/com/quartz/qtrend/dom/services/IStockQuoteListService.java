package com.quartz.qtrend.dom.services;

import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.StockQuoteNavigator;

import java.util.Collection;

public interface IStockQuoteListService {
    Collection<StockQuote> getPreviousQuotesIncludingMe(StockQuote pStockQuote, int pNumberOfQuotes, StockQuoteNavigator pNavigator) throws StockException;
}
