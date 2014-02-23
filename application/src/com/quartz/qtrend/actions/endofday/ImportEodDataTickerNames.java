/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.endofday;

import com.quartz.qtrend.actions.helpers.ActionHelper;
import com.quartz.qtrend.dom.FullTickerName;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.services.StockQuoteService;
import com.quartz.qtrend.ui.ProgressDialog;
import com.quartz.qtrend.ui.QTrendFileDialog;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qtrend.util.LineParser;
import com.quartz.qtrend.util.LineParserException;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.io.FileUtilities;
import com.quartz.qutilities.jobrunner.DefaultJob;
import com.quartz.qutilities.jobrunner.JobRunner;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;
import org.apache.commons.lang.StringUtils;

import javax.swing.*;
import java.io.File;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Refreshes the ticker names for a given exchange.
 *
 * @author Christian
 * @since Quartz...
 */
public class ImportEodDataTickerNames implements QEventHandler, JFrameAware<QTrendFrame>
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(ImportEodDataTickerNames.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private final JFileChooser fileChooser = new QTrendFileDialog();
    private StockQuoteService   stockQuoteService;
    private JobRunner   jobRunner;

    private QTrendFrame parent;
    private Output output;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public ImportEodDataTickerNames()
    {
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setJobRunner(JobRunner pJobRunner)
    {
        jobRunner = pJobRunner;
    }

    public void setStockQuoteService(StockQuoteService pStockQuoteService)
    {
        stockQuoteService = pStockQuoteService;
    }

    public void setFrame(QTrendFrame pQTrendFrame)
    {
        parent = pQTrendFrame;
        output = parent.getOutput();

        fileChooser.setDialogTitle("Import Exchange tickers' names");
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        if (fileChooser.showOpenDialog(parent) == JFileChooser.APPROVE_OPTION)
        {
            output.clear();

            final File selectedFile = fileChooser.getSelectedFile();

            final Ticker exchange = ActionHelper.askExchange(parent);
            if (exchange == null) return;

//            final String exchange = JOptionPane.showInputDialog(parent, "What is the exchange tickerName?", userProperties.getUserProperty(QTrendConstants.UserPropertyNames.USERPROP_LAST_EXCHANGE, ""));
//            if (exchange == null) return;
//            userProperties.setUserProperty(QTrendConstants.UserPropertyNames.USERPROP_LAST_EXCHANGE, exchange);

            final String suffix = JOptionPane.showInputDialog(parent, "What is the suffix (blank for none)?", "");
            if (suffix == null) return;

            importFile(exchange, suffix, selectedFile);
        }
    }

    private void importFile(final Ticker pExchange, final String pSuffix, final File pSelectedFile)
    {
        final Map<Ticker, FullTickerName> names = new HashMap<Ticker, FullTickerName>();

        final ProgressDialog progressDialog = new ProgressDialog(parent);

        jobRunner.runJob(new DefaultJob() {
            public Object runJob() throws Exception
            {
                progressDialog.setVisible(true);
                progressDialog.setText("Initialising Name Import...");

                final List<String> lines = FileUtilities.loadFile(pSelectedFile);
                if (lines.isEmpty()) return null;   //nolines

                final MyLineParser myLineParser = new MyLineParser(Collections.synchronizedMap(names), pExchange, pSuffix);

                //  read first line, which is ignored
                lines.remove(0);

                for (String line : lines)
                {
                    myLineParser.parseLine(line);
                }

                return null;  //To change body of implemented methods use File | Settings | File Templates.
            }

            public void onException(Exception e)
            {
                LOG.error("There were errors importing file: " + pSelectedFile.getName(), e);
            }

            public void onFinally()
            {
                try
                {
                    LOG.info("Saving names...");
                    stockQuoteService.saveTickerNames(names);

                    parent.getOutput().writeln("Names saved for " + pExchange + "!");
                }
                finally
                {
                    progressDialog.setVisible(false);
                }
            }
        });
    }


    ///////////////////////////////////////
    ////    INNER CLASSES

    static class MyLineParser implements LineParser
    {
        private static final String REGEX_TICKER_NAME = "^([a-zA-Z.]+)\\s(.*)$";
        private static final Pattern TICKER_NAME_PATTERN = Pattern.compile(REGEX_TICKER_NAME);

        final private Map<Ticker, FullTickerName> names;
        final private Ticker exchange;
        final private String suffix;

        MyLineParser(Map<Ticker, FullTickerName> pNames, Ticker pExchange, String pSuffix)
        {
            names = pNames;
            exchange = pExchange;
            suffix = pSuffix;
        }

        public void parseLine(String pLine) throws LineParserException
        {
            final Matcher matcher = TICKER_NAME_PATTERN.matcher(pLine.trim());

            if (matcher.matches())
            {
                final String name = matcher.group(2).trim();

                final String baseTicker = matcher.group(1).trim();
                final String ticker;
                if (StringUtils.isNotBlank(suffix))
                {
                    ticker = baseTicker + (suffix.startsWith(".") ? suffix : "." + suffix);
                }
                else
                {
                    ticker = baseTicker;
                }

                final Ticker theTicker = new Ticker(ticker);
                names.put(theTicker, new FullTickerName(exchange, theTicker, name));
            }
        }
    }
}
