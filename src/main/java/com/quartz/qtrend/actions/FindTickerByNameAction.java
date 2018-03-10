/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions;

import com.quartz.qtrend.QTrendConstants;
import com.quartz.qtrend.dom.BasicStockInfo;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.formatter.CellFormat;
import com.quartz.qutilities.formatter.FormatException;
import com.quartz.qutilities.formatter.MultipleRowsFormat;
import com.quartz.qutilities.formatter.RowFormat;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;
import com.quartz.qutilities.util.Output;

import javax.swing.*;
import java.util.Collection;
import java.util.EventObject;
import java.util.List;

/**
 * Find tickers for a given tickerName part
 *
 * @author Christian
 * @since Quartz...
 */
public class FindTickerByNameAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(FindTickerByNameAction.class);

    static public final RowFormat<Collection<BasicStockInfo>, BasicStockInfo> BASIC_TICKER_INFORMATION
            = new MultipleRowsFormat<Collection<BasicStockInfo>, BasicStockInfo>(new CellFormat[] {QTrendConstants.Formats.TICKER_NAME,
                                                                                                   QTrendConstants.Formats.EXCHANGE,
                                                                                                   QTrendConstants.Formats.TICKER});

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private QTrendFrame parent = null;
    private StockQuoteListService stockQuotesService = null;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public FindTickerByNameAction()
    {

    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setStockQuotesService(StockQuoteListService pStockQuotesService)
    {
        stockQuotesService = pStockQuotesService;
    }

    public void setFrame(QTrendFrame pQTrendFrame)
    {
        parent = pQTrendFrame;
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        final String namePart = JOptionPane.showInputDialog(parent, "Enter a part of the tickerName (case insensitive)?");
        if (namePart == null) return;
        if (namePart.trim().length() == 0) return;

        final Output output = parent.getOutput();

        try
        {
            final List<BasicStockInfo> quotes = stockQuotesService.findTickerByNames(namePart);

            output.clear();

            output.writeln(BASIC_TICKER_INFORMATION.formatTitle(true));
            output.writeln(BASIC_TICKER_INFORMATION.format(quotes));

            output.setPosition(0);
        }
        catch (FormatException e1)
        {
            LOG.error("Could not display names.", e1);
        }
    }
    ///////////////////////////////////////
    ////    INNER CLASSES
}
