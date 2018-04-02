/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.yahoo;

import com.quartz.qtrend.actions.helpers.YahooTickerQuoteReader;
import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.StockQuoteList;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.dom.services.StockQuoteService;
import com.quartz.qtrend.util.ImporterException;
import com.quartz.qtrend.util.YahooHistoryLineParser;
import com.quartz.qutilities.io.FileUtilities;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.util.QProperties;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.val;
import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.SortedMap;
import java.util.TreeMap;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Component
public class YahooService implements ApplicationContextAware {
    static private final ILog LOG = LogManager.getLogger(YahooService.class);

    private final StockQuoteListService stockQuotesService;
    private final StockQuoteService stockQuoteService;
    private final QProperties properties;
    @Setter private ApplicationContext applicationContext;

    @PostConstruct
    public void init() throws Exception {
        if (stockQuotesService == null) throw new IllegalStateException("StockQuoteListService not set.");
        if (stockQuoteService == null) throw new IllegalStateException("StockQuoteService not set.");
    }

    public void updateTickers(final Output pOutput) throws StockException, IOException, ImporterException {
        //  get current status of tickers
        pOutput.writeln("Loading tickers' Update information");

        val updateInformations = stockQuotesService.getUpdateInformation();

        //  read unsorted tickers from Yahoo!
        pOutput.writeln("Uploading update information from Yahoo!...");
        val unsortedQuotes = loadTickerUpdatesFromYahoo(updateInformations.values(), pOutput);

        //  sort tickers by dates
        pOutput.writeln("Sorting...");
        val quotesByDate = sortQuotesByDate(unsortedQuotes);

        //  saveQuoteOnly and recalculate
        pOutput.writeln("Saving updates...");
        for (val key : quotesByDate.keySet()) {
            pOutput.writeln("\n" + key.toString());

            val quotes = quotesByDate.get(key);

            //  recalculate all quotes
            for (val sq : quotes) {
                LOG.debug("--> " + key.toString() + ": " + sq.getTicker());
                val ui = updateInformations.get(sq.getTicker());
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
            throws ImporterException, IOException {
        val unsortedQuotes = new StockQuoteList();
        val reader = new YahooTickerQuoteReader(properties, applicationContext);

        val endDate = new LocalDate();

        for (val ui : pUpdateInformations) {
            val lastImportDate = ui.getLastImportDate();
            LocalDate startDate = null;

            if (lastImportDate.equals(endDate)) {
                pOutput.writeln(ui.getTicker() + " is already up-to-date (" + endDate + ")!");

                //  delete today's quote, so we can update it.
                stockQuoteService.deleteQuote(ui.getTicker(), endDate);

                startDate = lastImportDate;
            } else {
                startDate = lastImportDate.plusDays(1);
            }

            val lineParser = new YahooHistoryLineParser(stockQuoteService,
                                                        unsortedQuotes,
                                                        ui.getExchange(),
                                                        ui.getTicker(),
                                                        lastImportDate);

            //  check for override file (for test only)
            val overrideFile = System.getProperty("yahoo.update.override.file");

            if (overrideFile == null) {
                try {
                    reader.read(ui.getTicker(), startDate, endDate, lineParser);
                } catch (ImporterException e) {
                    if (e.getCause() instanceof IOException) {
                        LOG.warn("Could not update ticker: " + ui.getTicker(), e);
                        pOutput.writeln("WARNING: Could not update " + ui.getTicker() + "!  Reason=" + e.getCause().getMessage());
                        continue;
                    } else {
                        throw e;
                    }
                }
            } else {
                val content = new File(overrideFile);
                val lines = FileUtilities.loadFile(content);
                for (val l : lines) lineParser.parseLine(l);
            }
        }

        return unsortedQuotes;
    }

    private SortedMap<LocalDate, StockQuoteList> sortQuotesByDate(final StockQuoteList pUnsortedQuotes) {
        final SortedMap<LocalDate, StockQuoteList> quotesByDate = new TreeMap<LocalDate, StockQuoteList>();
        for (StockQuote sq : pUnsortedQuotes) {
            StockQuoteList dateQuotes = quotesByDate.get(sq.getDate());
            if (dateQuotes == null) {
                dateQuotes = new StockQuoteList();
                quotesByDate.put(sq.getDate(), dateQuotes);
            }

            dateQuotes.add(sq);
        }

        return quotesByDate;
    }
}
