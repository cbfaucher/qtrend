/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.yahoo;

import com.quartz.qtrend.dom.yahoo.YahooService;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.jobrunner.DefaultJob;
import com.quartz.qutilities.jobrunner.JobRunner;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import lombok.val;
import org.springframework.beans.factory.InitializingBean;

import java.util.EventObject;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
@RequiredArgsConstructor
@Log4j
public class UpdateTickersAction implements QEventHandler, JFrameAware<QTrendFrame>, InitializingBean
{
    static private final ILog LOG = LogManager.getLogger(UpdateTickersAction.class);

    //  TODO: use @RequiredArgsConstructor
    @Setter private YahooService    yahooService;
    @Setter private QTrendFrame     frame;
    @Setter private JobRunner       jobRunner;

    public void afterPropertiesSet() throws Exception
    {
        if (yahooService == null) throw new IllegalStateException("YahooService not set.");
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        frame.getOutput().clear();

        jobRunner.runJob(new UpdateJob());
    }

    @NoArgsConstructor
    private class UpdateJob extends DefaultJob
    {
        public Object runJob() throws Exception
        {
            val output = frame.getOutput();

            yahooService.updateTickers(output);

            return null;
        }

        public void onCleanExit(Object o)
        {
            LOG.info("\n\nAll Tickers UPDATED!");
        }

        public void onException(Exception e)
        {
            LOG.error("Could not update tickers.", e);
        }
    }
}
