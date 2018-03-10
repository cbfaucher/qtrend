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
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.jobrunner.Job;
import com.quartz.qutilities.jobrunner.JobRunner;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;
import com.quartz.qutilities.util.QProperties;
import com.quartz.qutilities.util.QUserProperties;
import org.joda.time.LocalDate;
import org.joda.time.YearMonthDay;

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
public class ImportYahooTickerHistoryFromWeb implements QEventHandler, JFrameAware<QTrendFrame>
{
    static private final ILog LOG = LogManager.getLogger(ImportYahooTickerHistoryFromWeb.class);

    private static final String USERPROP_LAST_START_DATE = "last.start.date";

    //  from spring
    private QProperties     properties;
    private QUserProperties userProperties;
    private JobRunner       jobRunner;
    private StockQuoteListService stockQuotesService;
    private StockQuoteService       stockQuoteService;

    //  from frame
    private QTrendFrame     frame;


    public ImportYahooTickerHistoryFromWeb()
    {
    }

    public void setFrame(QTrendFrame pFrame)
    {
        frame = pFrame;
    }

    public void setStockQuotesService(StockQuoteListService pStockQuotesService)
    {
        stockQuotesService = pStockQuotesService;
    }

    public void setStockQuoteService(StockQuoteService pStockQuoteService)
    {
        stockQuoteService = pStockQuoteService;
    }

    QTrendFrame getFrame()
    {
        return frame;
    }

    public void setJobRunner(JobRunner pJobRunner)
    {
        jobRunner = pJobRunner;
    }

    public void setProperties(QProperties pProperties)
    {
        properties = pProperties;
    }

    public void setUserProperties(QUserProperties pUserProperties)
    {
        userProperties = pUserProperties;
    }

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

        final Job importYahooHistoryJob = new ImportTickerHistoryJob(this, exchange, ticker, startDate, endDate);
        jobRunner.runJob(importYahooHistoryJob);
    }

    QProperties getProperties()
    {
        return properties;
    }

    StockQuoteService getStockQuoteService()
    {
        return stockQuoteService;
    }

    StockQuoteListService getStockQuotesService()
    {
        return stockQuotesService;
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
