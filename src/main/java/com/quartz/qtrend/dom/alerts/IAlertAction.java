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

import java.util.Map;
import java.util.List;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public interface IAlertAction
{
    public void execute(final Alert pAlert, 
                        final StockQuoteListService pService, 
                        final Output pOutput,
                        final RowFormat<List<StockQuote>, StockQuote> pFormat) throws FormatException;
}
