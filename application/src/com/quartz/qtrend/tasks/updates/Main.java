/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.tasks.updates;

import com.quartz.qtrend.Bootstrap;
import com.quartz.qtrend.QTrendBeanNames;
import com.quartz.qtrend.QTrendConstants;
import com.quartz.qtrend.QTrendMode;
import com.quartz.qtrend.dom.alerts.Alert;
import com.quartz.qtrend.dom.alerts.ToAlertConverter;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.dom.yahoo.YahooService;
import com.quartz.qtrend.tasks.MailOutput;
import com.quartz.qtrend.tasks.TaskOutput;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.util.QProperties;
import com.quartz.qutilities.util.QUserProperties;

import java.util.Collection;

/**
 * The entry point for auto-update
 *
 * @author Christian
 * @since Quartz...
 */
public class Main
{
    static private final ILog LOG = LogManager.getLogger(Main.class);

    /**
     * Entry point
     */
    static public void main(String[] pArgs) throws Exception
    {
        try
        {
            Bootstrap.init(QTrendMode.UPDATE_TICKERS_TASK);

            //  do updates
            final YahooService yahooService = QTrendBeanNames.YAHOO_SERVICE.getBean();
            LOG.info("Starting auto-update for tickers...");
            yahooService.updateTickers(new TaskOutput());

            //  then display alersts
            final QProperties properties = QTrendBeanNames.PROPERTIES.getBean();
            if ("true".equalsIgnoreCase(properties.getProperty("task.auto-update.displayAlerts", "true")))
            {
                final QUserProperties userProperties = QTrendBeanNames.USER_PROPERTIES.getBean();
                final StockQuoteListService stockQuotesService = QTrendBeanNames.STOCK_QUOTE_LIST_SERVICE.getBean();

                final Collection<Alert> favoriteAlerts = userProperties.getUserPropertyAsCollection(
                        QTrendConstants.UserPropertyNames.USERPROP_ORDERED_ALERTS, new ToAlertConverter());

                final String outputClassName = System.getProperty("output.class");

                final Output output; 

                if (outputClassName != null)
                {
                    output = (Output) Class.forName(outputClassName).newInstance();
                }
                else
                {
                    output = QTrendBeanNames.MAIL_OUTPUT.getBean();
                }

                LOG.info("Checking alerts: " + favoriteAlerts);
                stockQuotesService.outputAlerts(favoriteAlerts, output, QTrendConstants.Formats.SHORT_FORMAT);

                LOG.info("Sending Alerts emails...");
                if (output instanceof MailOutput) ((MailOutput) output).send();
            }

            LOG.info("Auto-Update finished successfully!");            
        }
        catch (Exception e)
        {
            LOG.error("Could not update tickers and/or send the alerts email.", e);

            throw e;
        }
    }
}
