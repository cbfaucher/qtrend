/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom;

import com.quartz.qtrend.dom.alerts.Alert;
import com.quartz.qtrend.dom.alerts.AlertParameters;
import com.quartz.qtrend.dom.alerts.IAlertAction;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.dom.watchlists.WatchList;
import com.quartz.qutilities.formatter.FormatException;
import com.quartz.qutilities.formatter.RowFormat;
import com.quartz.qutilities.util.Output;
import lombok.NoArgsConstructor;
import org.apache.commons.lang.StringUtils;

import java.util.List;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
@NoArgsConstructor
public class WatchListAlertAction implements IAlertAction
{
    public void execute(Alert pAlert, StockQuoteListService pService, Output pOutput, RowFormat<List<StockQuote>, StockQuote> pFormat) throws FormatException
    {
        final String watchListName = pAlert.getParameterValue(AlertParameters.PARAM_WATCHLIST_NAME);

        try
        {
            final WatchList watchList = pService.getWatchListService().load(watchListName);

            final List<StockQuote> quotes = pService.loadQuotes(watchList.getTickers());

            pOutput.writeln(pAlert.getFullName());
            pOutput.writeln(StringUtils.leftPad("", pAlert.getFullName().length(), "-"));
            pOutput.writeln(pFormat.formatTitle(true));
            pOutput.writeln(pFormat.format(quotes));
        }
        catch (StockException e)
        {
            pOutput.writeln("ERROR: Watchlist not found: " + watchListName);
        }

        pOutput.writeln();
    }
}
