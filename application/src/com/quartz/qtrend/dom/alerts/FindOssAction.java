/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.alerts;

import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.Signal;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.formatter.RowFormat;
import com.quartz.qutilities.formatter.FormatException;

import java.util.List;

import org.apache.commons.lang.StringUtils;

/**
 * Find OSS for a given signal, as specified by parameter {@link AlertParameters#NAME_OSS_SIGNAL} in {@link Alert} .
 *
 * @author Christian
 * @since Quartz...
 */
class FindOssAction implements IAlertAction
{
    public FindOssAction()
    {
    }

    public void execute(Alert pAlert, StockQuoteListService pService, Output pOutput, RowFormat<List<StockQuote>, StockQuote> pFormat) throws FormatException
    {

        final Signal signal = pAlert.getConstantValue(AlertParameters.NAME_OSS_SIGNAL);
        final Integer minRsi = pAlert.getParameterValue(AlertParameters.PARAM_OVERBOUGHT_LIMIT);
        final Integer forLast = pAlert.getParameterValue(AlertParameters.PARAM_FOR_LAST_PERIODS);

        //  todo: boolean to activate
        //  todo: configure period back and max rsi
        final List<StockQuote> quotes = pService.findOssSignals(signal, forLast, minRsi);

        pOutput.writeln();

        if (quotes.size() > 0)
        {
            final String title = "OSS BY " + signal;
            pOutput.writeln(title);
            pOutput.writeln(StringUtils.leftPad("", title.length(), "-"));
            pOutput.writeln(pFormat.formatTitle(true));
            pOutput.writeln(pFormat.format(quotes));
        }
        else
        {
            pOutput.writeln("No alert for signal " + signal);
        }
    }
}
