/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.yahoo;

import com.quartz.qtrend.actions.helpers.ActionHelper;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.dom.services.StockQuoteService;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qtrend.util.LineParser;
import com.quartz.qtrend.util.LineParserException;
import com.quartz.qutilities.jobrunner.Job;
import com.quartz.qutilities.jobrunner.JobRunner;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.util.QProperties;
import com.quartz.qutilities.util.QUserProperties;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.joda.time.LocalDate;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

import javax.swing.*;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.EventObject;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
@NoArgsConstructor
@Getter
public class ImportYahooTickerHistoryFromWeb implements ApplicationContextAware, QEventHandler, JFrameAware<QTrendFrame>
{
    static private final ILog LOG = LogManager.getLogger(ImportYahooTickerHistoryFromWeb.class);

    private static final String USERPROP_LAST_START_DATE = "last.start.date";

    //  from spring
    @Setter private QProperties     properties;
    @Setter private QUserProperties userProperties;
    @Setter private JobRunner       jobRunner;
    @Setter private StockQuoteListService stockQuotesService;
    @Setter private StockQuoteService       stockQuoteService;

    @Setter private ApplicationContext applicationContext;

    //  from frame
    @Setter private QTrendFrame     frame;

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        //  output
        final Output output = frame.getOutput();
        output.clear();

        //  ask for ticker
        final Ticker ticker = ActionHelper.askTicker(frame);
        if (ticker == null) return;

        //  ask for exchange
        Ticker exchange = ActionHelper.guessExchange(ticker);
        if (exchange == null)
        {
            exchange = ActionHelper.askExchange(frame);
        }

        if (exchange == null) return;

        //  ask start date and end date
        final String lastStartDate = userProperties.getProperty(USERPROP_LAST_START_DATE, "2006/06/01");
        final LocalDate startDate = ActionHelper.askDate(frame, "From Date", lastStartDate);
        if (startDate == null) return;
        userProperties.setProperty(USERPROP_LAST_START_DATE, startDate.toString());

        final LocalDate endDate = ActionHelper.askDate(frame, "To Date:", new LocalDate().toString());
        if (endDate == null) return;

        //  confirm:
        final String msg = "Import " + exchange + "'s " + ticker + " from " + startDate + " to " + endDate + "?";
        if (JOptionPane.showConfirmDialog(frame, msg, "Confirm Import", JOptionPane.YES_NO_OPTION) != JOptionPane.YES_OPTION)
        {
            LOG.info("User cancelled import for " + exchange + "/" + ticker);
            return;
        }

        LOG.info("Importing " + exchange + "/" + ticker + " from " + startDate + " to " + endDate + "...");

        final Job importYahooHistoryJob = new ImportTickerHistoryJob(applicationContext,
                                                                     this,
                                                                     exchange, ticker,
                                                                     startDate, endDate);
        jobRunner.runJob(importYahooHistoryJob);
    }

    class MyLineParser implements LineParser
    {
        final private File content;
        final private FileWriter writer;

        public MyLineParser(Ticker pTicker) throws IOException
        {
            String filePrefix = pTicker.asYahooTicker();
            while (filePrefix.length() < 3) filePrefix += "_";

            content = File.createTempFile(filePrefix, ".csv");
            content.deleteOnExit();

            writer = new FileWriter(content);
        }

        public void parseLine(String pLine) throws LineParserException
        {
            try
            {
                writer.append(pLine).append("\n");
            }
            catch (IOException e)
            {
                throw new LineParserException(e);
            }
        }

        public File getContent()
        {
            return content;
        }

        void close() throws IOException
        {
            if (writer != null)
            {
                writer.flush();
                writer.close();
            }
        }
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
