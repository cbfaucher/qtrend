/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.helpers;

import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qutilities.jobrunner.JobRunner;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.util.QUserProperties;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
abstract public class FindIncomingSignalAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    //  set by spring
    protected QUserProperties userProperties;
    protected StockQuoteListService stockQuotesService;
    protected JobRunner jobRunner;

    //  set by frame
    protected QTrendFrame frame;

    protected FindIncomingSignalAction()
    {
    }

    public void setUserProperties(QUserProperties pUserProperties)
    {
        userProperties = pUserProperties;
    }

    public void setStockQuotesService(StockQuoteListService pStockQuotesService)
    {
        stockQuotesService = pStockQuotesService;
    }

    public void setJobRunner(JobRunner pJobRunner)
    {
        jobRunner = pJobRunner;
    }

    public void setFrame(QTrendFrame pQTrendFrame)
    {
        frame = pQTrendFrame;
    }
}
