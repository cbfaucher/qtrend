/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.endofday;

import com.quartz.qtrend.QTrendConstants;
import com.quartz.qtrend.UnknownExchangeException;
import com.quartz.qtrend.actions.helpers.ActionHelper;
import com.quartz.qtrend.dom.BasicStockInfo;
import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuoteList;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.dom.services.StockQuoteService;
import com.quartz.qtrend.ui.ProgressDialog;
import com.quartz.qtrend.ui.QTrendFileDialog;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qtrend.util.ImporterException;
import com.quartz.qtrend.util.MultiThreadImporter;
import com.quartz.qutilities.util.Output;
import com.quartz.qtrend.util.Progress;
import com.quartz.qutilities.formatter.CellFormat;
import com.quartz.qutilities.formatter.FormatException;
import com.quartz.qutilities.formatter.MultipleRowsFormat;
import com.quartz.qutilities.formatter.RowFormat;
import com.quartz.qutilities.jobrunner.DefaultJob;
import com.quartz.qutilities.jobrunner.JobRunner;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;

import javax.swing.*;
import java.io.File;
import java.util.Collections;
import java.util.EventObject;
import java.util.HashSet;
import java.util.Set;

/**
 * Imports EOD data
 *
 * @author Christian
 * @since Quartz...
 */
public class ImportEodDataAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(ImportEodDataAction.class);

    static private final RowFormat<Set<BasicStockInfo>, BasicStockInfo> BASIC_STOCK_INFO_FORMAT = new MultipleRowsFormat<Set<BasicStockInfo>, BasicStockInfo>(
            new CellFormat[] {
                QTrendConstants.Formats.TICKER, QTrendConstants.Formats.TICKER_NAME, QTrendConstants.Formats.CLOSE, QTrendConstants.Formats.VOLUME
            });

    private final JFileChooser fileChooser = new QTrendFileDialog();

    //  from spring
    private StockQuoteService       stockQuoteService;
    private StockQuoteListService   stockQuotesService;
    private JobRunner               jobRunner;

    //  from frame
    private QTrendFrame     parent;
    private Output          output;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public ImportEodDataAction()
    {
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setJobRunner(JobRunner pJobRunner)
    {
        jobRunner = pJobRunner;
    }

    public void setStockQuotesService(StockQuoteListService pStockQuoteService)
    {
        stockQuotesService = pStockQuoteService;
    }

    public void setStockQuoteService(StockQuoteService pStockQuoteService)
    {
        stockQuoteService = pStockQuoteService;
    }

    public void setFrame(QTrendFrame pFrame)
    {
        parent = pFrame;
        output = parent.getOutput();

        fileChooser.setMultiSelectionEnabled(true);
        fileChooser.setDialogTitle("Import End-Of-Day Data file");
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        if (fileChooser.showOpenDialog(parent) == JFileChooser.APPROVE_OPTION)
        {
            final File[] selectedFiles = fileChooser.getSelectedFiles();

            if (selectedFiles.length == 0) return;

            output.clear();

            final ProgressDialog progressDialog = new ProgressDialog(parent);

            jobRunner.runJob(new DefaultJob() {
                public Object runJob() throws Exception
                {
                    progressDialog.setVisible(true);
                    progressDialog.setText("Initialising Import...");

                    final Set<Ticker> exchangeNames = ActionHelper.getExistingExchanges(new HashSet<Ticker>());

                    try
                    {
                        for (int i = 0; i < selectedFiles.length; i++)
                        {
                            importFile(selectedFiles[i], exchangeNames, progressDialog);
                        }
                    }
                    finally
                    {
                        progressDialog.setVisible(false);
                    }

                    return null;  //To change body of implemented methods use File | Settings | File Templates.
                }
            });
        }
    }

    private void importFile(final File pSelectedFile, Set<Ticker> pExistingExchanges, Progress pProgress)
    {

        final StockQuoteList quotes = new StockQuoteList();

        final String filename = pSelectedFile.getName();
        try
        {
            Ticker exchangeName = null;

            //  guess exchange tickerName...
            final int underscoreIdx = filename.indexOf('_');
            if (underscoreIdx > 0)
            {
                final String s = filename.substring(0, underscoreIdx);
                exchangeName = (s != null ? new Ticker(s) : null);
            }


            if (exchangeName == null)
            {
                final Ticker s = ActionHelper.askExchange(parent);
                if (s != null)
                {
                    exchangeName = s;
                    pExistingExchanges.add(exchangeName);
                }
            }

            if (exchangeName == null) return;

            final ImportEodDataLineParser myLineParser = new ImportEodDataLineParser(stockQuoteService,
                                                                                     exchangeName,
                    Collections.synchronizedList(quotes),
                    pProgress);
            final MultiThreadImporter importer = new MultiThreadImporter(
                    myLineParser, jobRunner, 5, true, output, pProgress);

            output.writeln("\n\n=================================================================");
            output.writeln("EXCHANGE: " + exchangeName + " - " + pSelectedFile.getName());

            importer.importFile(pSelectedFile);

            final Set<BasicStockInfo> tickersUpdated = myLineParser.getTickersUpdated();
            output.writeln("\nTickers added/updated (" + tickersUpdated.size() + " tickers)");
            //output.write("----------------------------------------------------------------\n");
            output.writeln(BASIC_STOCK_INFO_FORMAT.formatTitle(true));

            output.writeln(BASIC_STOCK_INFO_FORMAT.format(tickersUpdated));

            final Set<BasicStockInfo> tickersIgnored = myLineParser.getTickersIgnored();
            output.writeln("\nTickers ignored (" + tickersIgnored.size() + " tickers)");
            //output.write("----------------------------------------------------------------\n");
            output.writeln(BASIC_STOCK_INFO_FORMAT.formatTitle(true));
            output.writeln(BASIC_STOCK_INFO_FORMAT.format(tickersIgnored));
        }
        catch (FormatException e)
        {
            LOG.error("Could not format output", e);
        }
        catch (ImporterException e)
        {
            LOG.error("There were errors importing file: " + filename, e);
        }
        catch (UnknownExchangeException e)
        {
            LOG.error("Unknown exchange.", e);
        }
        finally
        {
            try
            {
                pProgress.setText("Saving quotes for " + pSelectedFile.getName());
                stockQuotesService.save(quotes);
            }
            catch (StockException e)
            {
                LOG.error("Could not saveQuoteOnly quotes!", e);
            }
        }
    }

    public JFileChooser getFileChooser()
    {
        return fileChooser;
    }


    ///////////////////////////////////////
    ////    INNER CLASSES

}
