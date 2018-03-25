/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.tasks.updates;

import com.quartz.qtrend.QTrendConstants;
import com.quartz.qtrend.dom.alerts.ToAlertConverter;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.dom.yahoo.YahooService;
import com.quartz.qtrend.tasks.MailOutput;
import com.quartz.qtrend.tasks.TaskOutput;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.spring.BeanFactorySingleton;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.util.QProperties;
import com.quartz.qutilities.util.QUserProperties;
import lombok.val;
import org.springframework.boot.SpringApplication;

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
            val context = SpringApplication.run(TickerUpdaterApplication.class, pArgs);
            BeanFactorySingleton.setBeanFactory(context);

            //  do updates
            final YahooService yahooService = context.getBean(YahooService.class);
            LOG.info("Starting auto-update for tickers...");
            yahooService.updateTickers(new TaskOutput());

            //  then display alersts
            val properties = context.getBean(QProperties.class);
            if ("true".equalsIgnoreCase(properties.getProperty("task.auto-update.displayAlerts", "true")))
            {
                val userProperties = context.getBean(QUserProperties.class);
                val stockQuotesService = context.getBean(StockQuoteListService.class);

                val favoriteAlerts = userProperties.getPropertyAsCollection(
                        QTrendConstants.UserPropertyNames.USERPROP_ORDERED_ALERTS, new ToAlertConverter());

                val outputClassName = System.getProperty("output.class");

                final Output output;

                if (outputClassName != null)
                {
                    output = (Output) Class.forName(outputClassName).newInstance();
                }
                else
                {
                    output = context.getBean(MailOutput.class);
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
