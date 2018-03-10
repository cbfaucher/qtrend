/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.alerts;

import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.formatter.RowFormat;
import com.quartz.qutilities.formatter.FormatException;

import java.util.List;

import org.apache.commons.lang.StringUtils;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
class LowRsiAlertAction implements IAlertAction
{
    public LowRsiAlertAction()
    {
    }

    public void execute(Alert pAlert, StockQuoteListService pService, Output pOutput, RowFormat<List<StockQuote>, StockQuote> pFormat) throws FormatException
    {
        final Integer maxRsi = pAlert.getParameterValue(AlertParameters.PARAM_OVERSOLD_LIMIT);

        final List<StockQuote> quotes = pService.findOversoldQuotes(maxRsi);

        final String title = "Low RSI (Oversold)";
        pOutput.writeln(title);
        pOutput.writeln(StringUtils.leftPad("", title.length(), "-"));
        if (quotes.size() > 0)
        {
            pOutput.writeln(pFormat.formatTitle(true));
            pOutput.writeln(pFormat.format(quotes));
        }
        else
        {
            pOutput.writeln("No stocks with RSI below " + maxRsi);
        }

        pOutput.writeln();

    }
}
