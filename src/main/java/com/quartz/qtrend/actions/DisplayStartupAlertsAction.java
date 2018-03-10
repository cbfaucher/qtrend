/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions;

import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.dom.alerts.Alert;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qtrend.ui.configuration.DisplayAlertsDialog;
import com.quartz.qutilities.util.Output;
import com.quartz.qtrend.QTrendConstants;
import com.quartz.qutilities.formatter.FormatException;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;
import com.quartz.qutilities.util.Output;

import java.util.Collection;
import java.util.EventObject;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class DisplayStartupAlertsAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    static private final ILog LOG = LogManager.getLogger(DisplayStartupAlertsAction.class);

    //  from spring
    private DisplayAlertsDialog displayAlertsDialog;
    private StockQuoteListService stockQuotesService;

    private QTrendFrame frame;

    public DisplayStartupAlertsAction()
    {

    }

    public void setDisplayAlertsDialog(DisplayAlertsDialog pDisplayAlertsDialog)
    {
        displayAlertsDialog = pDisplayAlertsDialog;
    }

    public void setStockQuotesService(StockQuoteListService pStockQuotesService)
    {
        stockQuotesService = pStockQuotesService;
    }

    public void setFrame(QTrendFrame pFrame)
    {
        frame = pFrame;
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        final Output output = frame.getOutput();

        try
        {
            //  ask for alers to execute
            if (displayAlertsDialog.hasAlertsToDisplay())
            {
                displayAlertsDialog.setVisible(true);
                if (displayAlertsDialog.isCancelled()) return;
                final Collection<Alert> alerts = displayAlertsDialog.getSelectedAlertNames();

                LOG.info("Loading alerts...");

                output.clear();
                output.writeln("ALERTS");
                output.writeln("======");

                //  alerts by signals
                stockQuotesService.outputAlerts(alerts, output, QTrendConstants.Formats.DEFAULT_FORMAT);

                output.setPosition(0);
            }
        }
        catch (FormatException e)
        {
            LOG.error("Could not format.", e);
        }
        catch (Exception e)
        {
            LOG.error("Could not format.", e);
        }

        LOG.info("Alerts DONE.");

    }
}
