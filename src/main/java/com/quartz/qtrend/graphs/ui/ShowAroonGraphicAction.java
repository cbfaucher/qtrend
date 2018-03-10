/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.graphs.ui;

import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventManager;
import com.quartz.qutilities.swing.SwingUtils;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qtrend.dom.aroon.services.AroonService;
import com.quartz.qtrend.dom.StockQuoteList;
import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.graphs.GraphicFactory;

import java.util.EventObject;
import java.util.List;

import org.jfree.chart.JFreeChart;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class ShowAroonGraphicAction implements QEventHandler, JFrameAware<GraphicFrame2>
{
    static private final ILog LOG = LogManager.getLogger(ShowAroonGraphicAction.class);

    private AroonService aroonService;

    //  set by event manager
    private GraphicFrame2 frame;
    private boolean shortTerm;

    public ShowAroonGraphicAction()
    {
    }

    public void setAroonService(AroonService pAroonService)
    {
        aroonService = pAroonService;
    }

    public void setShortTerm(boolean pShortTerm)
    {
        shortTerm = pShortTerm;
    }

    public void setFrame(GraphicFrame2 pGraphicFrame2)
    {
        frame = pGraphicFrame2;
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        try
        {
            final List<StockQuote> quotes = frame.getQuotes();

            aroonService.loadAroonIfNeeded(quotes);

            final JFreeChart chart = GraphicFactory.createAroonChart(quotes, this.shortTerm);

            final SubFrameDialog dialog = new SubFrameDialog(frame, "Aroon", chart);
            dialog.setSize(1000, 300);
            SwingUtils.centerWindow(dialog);
            dialog.setVisible(true);
        }
        catch (StockException e)
        {
            LOG.error("Could not createSqlParameterValue Aroon graphics.", e);
        }
    }
}
