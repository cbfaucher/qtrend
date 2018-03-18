/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.endofday;

import com.quartz.qtrend.QTrendBeanNames;
import com.quartz.qtrend.UnknownExchangeException;
import com.quartz.qtrend.dom.BasicStockInfo;
import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuoteImpl;
import com.quartz.qtrend.dom.helpers.Price;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.services.StockQuoteService;
import com.quartz.qtrend.rules.IExchangeRule;
import com.quartz.qtrend.rules.RuleManager;
import com.quartz.qtrend.util.LineParser;
import com.quartz.qtrend.util.LineParserException;
import com.quartz.qtrend.util.Progress;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import lombok.Getter;
import lombok.val;
import org.joda.time.LocalDate;

import java.util.List;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.TreeSet;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
class ImportEodDataLineParser implements LineParser {
    static private final ILog LOG = LogManager.getLogger(ImportEodDataLineParser.class);

    final private StockQuoteService stockQuoteService;
    final private List quotes;
    final private Ticker exchange;
    final private Progress progress;

    final private IExchangeRule exchangeRules;

    @Getter
    final private Set<BasicStockInfo> tickersUpdated = new TreeSet<>();
    @Getter
    final private Set<BasicStockInfo> tickersIgnored = new TreeSet<>();

    ImportEodDataLineParser(StockQuoteService pStockQuoteService, Ticker pExchange, List pQuotes, Progress pProgress) throws UnknownExchangeException {
        stockQuoteService = pStockQuoteService;
        quotes = pQuotes;
        exchange = pExchange;
        progress = pProgress;

        final RuleManager ruleManager = QTrendBeanNames.EXCHANGE_RULE_MANAGER.getBean();
        exchangeRules = ruleManager.getExchangeRule(exchange);
    }

    public void parseLine(String pLine) throws LineParserException {
        val tokenizer = new StringTokenizer(pLine, ",");

        val ticker = new Ticker(tokenizer.nextToken().trim());    //ticker
        tokenizer.nextToken();                          //period type

        val date = parseDate(tokenizer.nextToken().trim());
        val open = new Price(tokenizer.nextToken().trim());
        val high = new Price(tokenizer.nextToken().trim());
        val low = new Price(tokenizer.nextToken().trim());
        val close = new Price(tokenizer.nextToken().trim());
        val volume = Long.parseLong(tokenizer.nextToken().trim());

        try {
            val tickerName = stockQuoteService.getTickerName(ticker);

            val stockBasicInfo = new BasicStockInfo(exchange, ticker, tickerName, close, volume);

            try {
                val stock = StockQuoteImpl.builder()
                                          .stockExchange(exchange)
                                          .ticker(ticker)
                                          .date(date)
                                          .open(open)
                                          .high(high)
                                          .low(low)
                                          .close(close)
                                          .volume(volume)
                                          .build();

                stockQuoteService.recalculate(stock);

                if (exchangeRules.accept(stock)) {
                    quotes.add(stock);

                    tickersUpdated.add(stockBasicInfo);

                    progress.setText(ticker + "(" + tickerName + ") updated...");
                } else {
                    tickersIgnored.add(stockBasicInfo);

                    progress.setText(ticker + "(" + tickerName + ") ignored...");
                }
            } finally {
                progress.increment();
            }
        } catch (StockException e) {
            LOG.error("Could not add Ticker '" + ticker + "'", e);
        }
    }

    private LocalDate parseDate(String s) {
        //  20060327
        val year = Integer.parseInt(s.substring(0, 4));
        val month = Integer.parseInt(s.substring(4, 6));
        val day = Integer.parseInt(s.substring(6, 8));

        //  todo: check date creation!
        return new LocalDate(year, month, day);
    }
}
