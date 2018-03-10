/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.summary;

import com.quartz.qtrend.QTrendConstants;
import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qtrend.ui.exchanges.SelectExchangesDialog;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.formatter.FormatException;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;
import com.quartz.qutilities.util.Output;

import java.util.ArrayList;
import java.util.Collection;
import java.util.EventObject;
import java.util.List;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class ShowSummaryAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    static private final ILog LOG = LogManager.getLogger(ShowSummaryAction.class);

    //  set by spring
    private StockQuoteListService stockQuotesService;
    private SelectExchangesDialog selectExchangeDialog;

    //  set from frame
    private QTrendFrame parent;

    public ShowSummaryAction()
    {
    }

    public void setStockQuotesService(StockQuoteListService pStockQuotesService)
    {
        stockQuotesService = pStockQuotesService;
    }

    public void setSelectExchangeDialog(SelectExchangesDialog pSelectExchangeDialog)
    {
        selectExchangeDialog = pSelectExchangeDialog;
    }

    public void setFrame(QTrendFrame pFrame)
    {
        parent = pFrame;
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        final Collection<Ticker> exchanges = new ArrayList<Ticker>();
        selectExchangeDialog.setVisible(true);
        if (selectExchangeDialog.isCancelled()) return;
        exchanges.addAll(selectExchangeDialog.getSelectedTickers());

        if (exchanges.isEmpty())
        {
            LOG.error("No selected exchange!");
            return;
        }

        final Output output = parent.getOutput();

        output.clear();

        try
        {
            for (Ticker exchange : exchanges)
            {
                final List<StockQuote> exchangeTickers = stockQuotesService.getLatestTickersInformation(exchange);

                output.writeln(QTrendConstants.Formats.DEFAULT_FORMAT.formatTitle(true, " (" + exchange + ")"));
                output.writeln(QTrendConstants.Formats.DEFAULT_FORMAT.format(exchangeTickers));
                output.writeln("\n");
                output.setPosition(0);
            }
        }
        catch (StockException e)
        {
            LOG.error("Could not loadStockQuoteOnly summary for exchanges.", e);
        }
        catch (FormatException e)
        {
            LOG.error("Could not writeln data", e);
        }
    }

}
