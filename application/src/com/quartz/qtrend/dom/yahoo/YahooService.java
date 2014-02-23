/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.yahoo;

import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.dom.services.StockQuoteService;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.StockQuoteList;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.StockException;
import com.quartz.qutilities.util.Output;
import com.quartz.qtrend.util.ImporterException;
import com.quartz.qtrend.util.YahooHistoryLineParser;
import com.quartz.qtrend.actions.helpers.YahooTickerQuoteReader;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.io.FileUtilities;
import com.quartz.qutilities.util.QProperties;
import com.quartz.qutilities.util.Output;
import org.springframework.beans.factory.InitializingBean;
import org.joda.time.YearMonthDay;

import java.util.*;
import java.io.IOException;
import java.io.File;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class YahooService implements InitializingBean
{
    static private final ILog LOG = LogManager.getLogger(YahooService.class);

    private StockQuoteListService stockQuotesService;
    private StockQuoteService       stockQuoteService;
    private QProperties     properties;


    public YahooService()
    {
    }

    public void setStockQuotesService(StockQuoteListService pStockQuotesService)
    {
        stockQuotesService = pStockQuotesService;
    }

    public void setStockQuoteService(StockQuoteService pStockQuoteService)
    {
        stockQuoteService = pStockQuoteService;
    }

    public void setProperties(QProperties pProperties)
    {
        properties = pProperties;
    }

    public void afterPropertiesSet() throws Exception
    {
        if (stockQuotesService == null) throw new IllegalStateException("StockQuoteListService not set.");
        if (stockQuoteService == null) throw new IllegalStateException("StockQuoteService not set.");
    }

    public void updateTickers(final Output pOutput) throws StockException, IOException, ImporterException
    {
        //  get current status of tickers
        pOutput.writeln("Loading tickers' Update information");

        final Map<Ticker, UpdateInformation> updateInformations = stockQuotesService.getUpdateInformation();

        //  read unsorted tickers from Yahoo!
        pOutput.writeln("Uploading update information from Yahoo!...");
        final StockQuoteList unsortedQuotes = loadTickerUpdatesFromYahoo(updateInformations.values(), pOutput);

        //  sort tickers by dates
        pOutput.writeln("Sorting...");
        final SortedMap<YearMonthDay, StockQuoteList> quotesByDate = sortQuotesByDate(unsortedQuotes);

        //  saveQuoteOnly and recalculate
        pOutput.writeln("Saving updates...");
        for (YearMonthDay key : quotesByDate.keySet())
        {
            pOutput.writeln("\n" + key.toString());

            final StockQuoteList quotes = quotesByDate.get(key);

            //  recalculate all quotes
            for (StockQuote sq : quotes)
            {
                LOG.debug("--> " + key.toString() + ": " + sq.getTicker());
                final UpdateInformation ui = updateInformations.get(sq.getTicker());
                pOutput.writeln("- " + sq.getTicker().toString());
                sq.setPeriodSequence(ui.getLastPeriodSequence() + 1);
                ui.stepLastPeriodSequence();
                stockQuoteService.recalculate(sq);
            }

            //  saveQuoteOnly to database
            stockQuotesService.save(quotes);
        }
    }

    private StockQuoteList loadTickerUpdatesFromYahoo(final Collection<UpdateInformation> pUpdateInformations, final Output pOutput)
            throws ImporterException, IOException
    {
        final StockQuoteList unsortedQuotes = new StockQuoteList();
        final YahooTickerQuoteReader reader = new YahooTickerQuoteReader(properties);

        final YearMonthDay endDate = new YearMonthDay();

        for (UpdateInformation ui : pUpdateInformations)
        {
            final YearMonthDay lastImportDate = ui.getLastImportDate();
            YearMonthDay startDate = null;

            if (lastImportDate.compareTo(endDate) == 0)
            {
                pOutput.writeln(ui.getTicker() + " is already up-to-date (" + endDate + ")!");

                //  delete today's quote, so we can update it.
                stockQuoteService.deleteQuote(ui.getTicker(), endDate);

                startDate = lastImportDate;
            }
            else
            {
                startDate = lastImportDate.plusDays(1);
            }

            final YahooHistoryLineParser lineParser = new YahooHistoryLineParser(stockQuoteService,
                                                                                 unsortedQuotes,
                                                                                 ui.getExchange(),
                                                                                 ui.getTicker(),
                                                                                 lastImportDate);

            //  check for override file (for test only)
            final String overrideFile = System.getProperty("yahoo.update.override.file");

            if (overrideFile == null)
            {
                try
                {
                    reader.read(ui.getTicker(), startDate, endDate, lineParser);
                }
                catch (ImporterException e)
                {
                    if (e.getCause() instanceof IOException)
                    {
                        LOG.warn("Could not update ticker: " + ui.getTicker(), e);
                        pOutput.writeln("WARNING: Could not update " + ui.getTicker() + "!  Reason=" + e.getCause().getMessage());
                        continue;
                    }
                    else
                    {
                        throw e;
                    }
                }
            }
            else
            {
                final File content = new File(overrideFile);
                final List<String> lines = FileUtilities.loadFile(content);
                for (String l : lines) lineParser.parseLine(l);
            }
        }

        return unsortedQuotes;
    }

    private SortedMap<YearMonthDay, StockQuoteList> sortQuotesByDate(final StockQuoteList pUnsortedQuotes)
    {
        final SortedMap<YearMonthDay, StockQuoteList> quotesByDate = new TreeMap<YearMonthDay, StockQuoteList>();
        for (StockQuote sq : pUnsortedQuotes)
        {
            StockQuoteList dateQuotes = quotesByDate.get(sq.getDate());
            if (dateQuotes == null)
            {
                dateQuotes = new StockQuoteList();
                quotesByDate.put(sq.getDate(), dateQuotes);
            }

            dateQuotes.add(sq);
        }

        return quotesByDate;
    }
}
