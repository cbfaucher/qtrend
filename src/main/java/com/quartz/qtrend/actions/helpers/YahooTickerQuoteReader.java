/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.helpers;

import com.quartz.qtrend.QTrendBeanNames;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.util.ImporterException;
import com.quartz.qtrend.util.LineParser;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.util.QProperties;
import org.joda.time.LocalDate;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.Proxy;
import java.net.URL;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class YahooTickerQuoteReader
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(YahooTickerQuoteReader.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final private QProperties properties;
    public static final String PROP_YAHOO_TICKER_HISTORY_URL = "yahoo.ticker.history.url";

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public YahooTickerQuoteReader(QProperties pProperties)
    {
        properties = pProperties;
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    private URL buildURL(final Ticker pTicker, final LocalDate pStartDate, final LocalDate pEndDate)
            throws ImporterException, MalformedURLException
    {
        //http://ichart.finance.yahoo.com/table.csv?s=XGD.TO&a=05&b=30&c=2006&d=11&e=31&f=2006&g=d&ignore=.csv
        String template = properties.getProperty(PROP_YAHOO_TICKER_HISTORY_URL);
        if (template == null) throw new ImporterException("Property " + PROP_YAHOO_TICKER_HISTORY_URL + " does not exists!");

        template = template.replaceAll("#TICKER#", pTicker.asYahooTicker());
        template = template.replaceAll("#STARTDAY#", "" + pStartDate.getDayOfMonth());
        template = template.replaceAll("#STARTMONTH#", "" + (pStartDate.getMonthOfYear() - 1));
        template = template.replaceAll("#STARTYEAR#", "" + pStartDate.getYear());
        template = template.replaceAll("#ENDDAY#", "" + pEndDate.getDayOfMonth());
        template = template.replaceAll("#ENDMONTH#", "" + (pEndDate.getMonthOfYear() - 1));
        template = template.replaceAll("#ENDYEAR#", "" + pEndDate.getYear());

        //  read content from Yahoo!
        LOG.info("Opening URL: " + template);
        final URL url = new URL(template);
        return url;
    }

    public void read(Ticker pTicker, LocalDate pStartDate, LocalDate pEndDate, LineParser pLineParser) throws ImporterException
    {
        try
        {
            //  build URL
            final URL url = buildURL(pTicker, pStartDate, pEndDate);

            //  content
            final Proxy proxy = QTrendBeanNames.HTTP_PROXY.getBean();
            final BufferedReader reader = new BufferedReader(new InputStreamReader(url.openConnection(proxy).getInputStream()));
            try
            {
                String line = null;
                while ( (line = reader.readLine()) != null)
                {
                    if (line.toLowerCase().startsWith("date")) continue;   //  ignore header line.
                    pLineParser.parseLine(line); ;
                }
            }
            finally
            {
                reader.close();
            }
        }
        catch (IOException e)
        {
            throw new ImporterException(e);
        }

    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
