/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend;

import org.springframework.core.io.Resource;
import org.springframework.core.io.ClassPathResource;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public enum QTrendMode
{
    USER_INTERFACE(
            new ClassPathResource("/com/quartz/qtrend/qtrend-common.xml"),
            new ClassPathResource("/com/quartz/qtrend/qtrend-database.xml"),
            new ClassPathResource("/com/quartz/qtrend/qtrend-dao.xml"),
            new ClassPathResource("/com/quartz/qtrend/qtrend-service.xml"),
//            new ClassPathResource("/com/quartz/com.quartz.qtrend/com.quartz.qtrend-operations.xml"),
            new ClassPathResource("/com/quartz/qtrend/qtrend-events.xml"),
            new ClassPathResource("/com/quartz/qtrend/qtrend-main-frame.xml"),
            new ClassPathResource("/com/quartz/qtrend/ui/watchlists/qtrend-watchlists.xml"),
            new ClassPathResource("/com/quartz/qtrend/ui/exchanges/qtrend-exchange-dialog.xml"),
            new ClassPathResource("/com/quartz/qtrend/ui/configuration/qtrend-configuration-ui-beans.xml")
    ),
    UPDATE_TICKERS_TASK(
            new ClassPathResource("/com/quartz/qtrend/qtrend-common.xml"),
            new ClassPathResource("/com/quartz/qtrend/qtrend-database.xml"),
            new ClassPathResource("/com/quartz/qtrend/qtrend-dao.xml"),
            new ClassPathResource("/com/quartz/qtrend/qtrend-service.xml")
//            new ClassPathResource("/com/quartz/com.quartz.qtrend/com.quartz.qtrend-operations.xml"),
//            new ClassPathResource("/com/quartz/com.quartz.qtrend/com.quartz.qtrend-events.xml"),
//            new ClassPathResource("/com/quartz/com.quartz.qtrend/com.quartz.qtrend-main-frame.xml"),
//            new ClassPathResource("/com/quartz/com.quartz.qtrend/ui/watchlists/com.quartz.qtrend-watchlists.xml"),
//            new ClassPathResource("/com/quartz/com.quartz.qtrend/ui/exchanges/com.quartz.qtrend-exchange-dialog.xml"),
//            new ClassPathResource("/com/quartz/com.quartz.qtrend/ui/configuration/com.quartz.qtrend-configuration-ui-beans.xml")
    );

    final private Resource[] beansResources;

    private QTrendMode(Resource ... pResources)
    {
        beansResources = pResources;
    }

    public Resource[] getBeansResources()
    {
        return beansResources;
    }
}
