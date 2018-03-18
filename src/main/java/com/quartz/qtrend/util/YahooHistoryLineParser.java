/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.util;

import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuoteImpl;
import com.quartz.qtrend.dom.helpers.Price;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.services.StockQuoteService;
import com.quartz.qutilities.util.DateUtilities;
import lombok.RequiredArgsConstructor;
import lombok.val;
import org.joda.time.LocalDate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

/**
 * The line parser for Yahoo's CSV format.
 */
@RequiredArgsConstructor
public class YahooHistoryLineParser implements LineParser {

    static final private Map<String, Integer> MONTH_TO_NUMBER = new HashMap<>();

    static {
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
    final private List quotes;
    final private Ticker exchange;
    final private Ticker ticker;
    final private LocalDate oldestDate;

    public void parseLine(String pLine) throws LineParserException {
        final StringTokenizer tokenizer = new StringTokenizer(pLine, ",;");

//            final Date date = parseDate(tokenizer.nextToken());
        final String rawDate = tokenizer.nextToken();

        final LocalDate date = DateUtilities.toLocalDate(rawDate);
        if (oldestDate.compareTo(date) < 0) {
            val stockQuoteBuilder = StockQuoteImpl.builder()
                                                  .pk(-1L)
                                                  .stockExchange(exchange)
                                                  .ticker(ticker)
                                                  .date(date)
                                                  .open(new Price(tokenizer.nextToken()))
                                                  .high(new Price(tokenizer.nextToken()))
                                                  .low(new Price(tokenizer.nextToken()))
                                                  .close(new Price(tokenizer.nextToken()));

            tokenizer.nextToken();

            stockQuoteBuilder.volume(Long.parseLong(tokenizer.nextToken()));

            val stockQuote = stockQuoteBuilder.build();

            try {
                stockQuoteService.recalculate(stockQuote);
            } catch (StockException e) {
                throw new LineParserException(e);
            }

            quotes.add(stockQuote);
        }
    }
}
