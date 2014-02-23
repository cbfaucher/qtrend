/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.util;

import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.helpers.Price;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.services.StockQuoteService;
import com.quartz.qutilities.util.DateUtilities;
import org.joda.time.YearMonthDay;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

/**
 * The line parser for Yahoo's CSV format.
 */
public class YahooHistoryLineParser implements LineParser
{

    static final private Map<String, Integer> MONTH_TO_NUMBER = new HashMap<String, Integer>();
    static
    {
        YahooHistoryLineParser.MONTH_TO_NUMBER.put("jan", 1);
        YahooHistoryLineParser.MONTH_TO_NUMBER.put("feb", 2);
        YahooHistoryLineParser.MONTH_TO_NUMBER.put("mar", 3);
        YahooHistoryLineParser.MONTH_TO_NUMBER.put("apr", 4);
        YahooHistoryLineParser.MONTH_TO_NUMBER.put("may", 5);
        YahooHistoryLineParser.MONTH_TO_NUMBER.put("jun", 6);
        YahooHistoryLineParser.MONTH_TO_NUMBER.put("jul", 7);
        YahooHistoryLineParser.MONTH_TO_NUMBER.put("aug", 8);
        YahooHistoryLineParser.MONTH_TO_NUMBER.put("sep", 9);
        YahooHistoryLineParser.MONTH_TO_NUMBER.put("oct", 10);
        YahooHistoryLineParser.MONTH_TO_NUMBER.put("nov", 11);
        YahooHistoryLineParser.MONTH_TO_NUMBER.put("dec", 12);
    }

    final private StockQuoteService stockQuoteService;
    final private Ticker exchange;
    final private Ticker ticker;
    final private List quotes;
    final private YearMonthDay oldestDate;

    public YahooHistoryLineParser(StockQuoteService pStockQuoteService, List pQuotes, Ticker pExchange, Ticker pTicker, YearMonthDay pOldestDate)
    {
        stockQuoteService = pStockQuoteService;
        quotes = pQuotes;
        exchange = pExchange;
        ticker = pTicker;
        oldestDate = pOldestDate;
    }

    public void parseLine(String pLine) throws LineParserException
    {
        final StringTokenizer tokenizer = new StringTokenizer(pLine, ",;");

//            final Date date = parseDate(tokenizer.nextToken());
        final String rawDate = tokenizer.nextToken();

        final YearMonthDay date = DateUtilities.toYearMonthDay(rawDate);
        if (oldestDate.compareTo(date) < 0)
        {
            final StockQuote stockQuote = stockQuoteService.createNewStockQuote();
            stockQuote.setStockExchange(exchange);
            stockQuote.setTicker(ticker);
            stockQuote.setDate(date);

            final Price open = new Price(tokenizer.nextToken());
            final Price high = new Price(tokenizer.nextToken());
            final Price low = new Price(tokenizer.nextToken());
            final Price close = new Price(tokenizer.nextToken());

            stockQuote.setOpen(open);
            stockQuote.setHigh(high);
            stockQuote.setLow(low);
            stockQuote.setClose(close);

            final long volume = Long.parseLong(tokenizer.nextToken());
            stockQuote.setVolume(volume);

            try
            {
                stockQuoteService.recalculate(stockQuote);
            }
            catch (StockException e)
            {
                throw new LineParserException(e);
            }

            quotes.add(stockQuote);
        }
    }
}
