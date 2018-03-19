/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.yahoo;

import com.quartz.qtrend.actions.helpers.YahooTickerQuoteReader;
import com.quartz.qtrend.dom.StockQuoteList;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.services.StockQuoteService;
import com.quartz.qtrend.ui.ProgressDialog;
import com.quartz.qtrend.util.StockRecalculator;
import com.quartz.qtrend.util.YahooHistoryLineParser;
import com.quartz.qutilities.io.FileUtilities;
import com.quartz.qutilities.jobrunner.DefaultJob;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import org.joda.time.LocalDate;
import org.springframework.context.ApplicationContext;

import java.io.File;
import java.util.List;

/**
 * @deprecated Change this to a Spring Service-injected class.
 */
class ImportTickerHistoryJob extends DefaultJob
{
    static private final ILog LOG = LogManager.getLogger(ImportTickerHistoryJob.class);

    private final ApplicationContext applicationContext;
    private final StockQuoteService                 stockQuoteService;
    private final ImportYahooTickerHistoryFromWeb importYahooTickerHistory;
    private final ProgressDialog progressDialog;
    private final Ticker exchange;
    private final Ticker ticker;
    private final LocalDate startDate;
    private final LocalDate endDate;

    ImportTickerHistoryJob(ApplicationContext applicationContext,
                           ImportYahooTickerHistoryFromWeb pImportYahooTickerHistory,
                           Ticker pExchange,
                           Ticker pTicker,
                           LocalDate pStartDate,
                           LocalDate pEndDate)
    {
        this.applicationContext = applicationContext;
        stockQuoteService = pImportYahooTickerHistory.getStockQuoteService();
        importYahooTickerHistory = pImportYahooTickerHistory;
        progressDialog = new ProgressDialog(importYahooTickerHistory.getFrame());
        exchange = pExchange;
        ticker = pTicker;

        startDate = pStartDate;
        endDate = pEndDate;
    }

    public Object runJob() throws Exception
    {
        progressDialog.setMinMax(0, 4);
        progressDialog.setVisible(true);

        //  delete existing ticker
        progressDialog.setText("Deleting existing tickers' information...");
        final int nbRowsDeleted = importYahooTickerHistory.getStockQuoteService().deleteTicker(ticker);
        if (nbRowsDeleted > 0)
        {
            importYahooTickerHistory.getFrame().getOutput().writeln(ticker + ": " + nbRowsDeleted + " existing rows deleted.");
        }

        progressDialog.increment();

        //  parse lines
        progressDialog.setText("Getting Ticker's quotes from Yahoo!...");
        final StockQuoteList quotes = new StockQuoteList();
        final YahooHistoryLineParser parser = new YahooHistoryLineParser(
                stockQuoteService, quotes, exchange, ticker, startDate);

        //  check for test override
        final String overrideFile = System.getProperty("yahoo.history.override.file");
        if (overrideFile == null)
        {
            final YahooTickerQuoteReader reader = new YahooTickerQuoteReader(importYahooTickerHistory.getProperties(),
                                                                             applicationContext);
            reader.read(ticker, startDate, endDate, parser);
        }
        else
        {
            final File content = new File(overrideFile);
            final List<String> lines = FileUtilities.loadFile(content);
            for (String l : lines) parser.parseLine(l);
        }

        progressDialog.increment();

        //  saveQuoteOnly
        progressDialog.setText("Saving ticker quotes...");
        importYahooTickerHistory.getStockQuotesService().save(quotes);

        progressDialog.increment();

        //  recalculate
        progressDialog.setText("Recalculating ticker...");
        new StockRecalculator(importYahooTickerHistory.getStockQuotesService(), stockQuoteService, ticker).recalculate(importYahooTickerHistory.getFrame().getOutput());

        progressDialog.increment();
        progressDialog.setText("Done!");

        return quotes.size();
    }

    public void onCleanExit(Object o)
    {
       importYahooTickerHistory.getFrame().getOutput().writeln(ticker + " imported successfully (" + o.toString() + " quotes)!");
    }

    public void onException(Exception e)
    {
        e.printStackTrace(System.err);

        LOG.error("Could not import history.", e);
    }

    public void onFinally()
    {
        progressDialog.setVisible(false);
    }
}
