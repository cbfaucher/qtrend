/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions;

import com.quartz.qtrend.dom.ImportDates;
import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.exchanges.services.ExchangesService;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.EventObject;
import java.util.List;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class FindLastImportDatesAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    static private final ILog LOG = LogManager.getLogger(FindLastImportDatesAction.class);

    private static final String PRINTOUT_FORMAT = "%-12s|%-11s|%-11s|%s\n";


    //  set by spring
    private ExchangesService exchangesService;

    //  set by frame
    private Output          output = null;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public FindLastImportDatesAction()
    {

    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setExchangesService(ExchangesService pExchangesService)
    {
        exchangesService = pExchangesService;
    }

    public void setFrame(QTrendFrame pQTrendFrame)
    {
        output = pQTrendFrame.getOutput();
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        output.clear();

        final StringWriter sw = new StringWriter();
        final PrintWriter pw = new PrintWriter(sw);

        try
        {
            final List<ImportDates> results = exchangesService.findLastImportDates();

            pw.printf(PRINTOUT_FORMAT, "EXCHANGE", "MIN. DATE", "MAX. DATE", "NB PERIODS");
            for (ImportDates d : results)
            {
                pw.printf(PRINTOUT_FORMAT, d.exchange, d.minimumDate, d.maximumDate, String.valueOf(d.numberOfPeriods));
            }

            pw.flush();
            output.writeln(sw.toString());
        }
        catch (StockException e1)
        {
            LOG.error("Could not retrieve last import dates.", e1);
        }
        finally
        {
            pw.close();
        }
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
