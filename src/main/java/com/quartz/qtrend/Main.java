/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend;

import com.quartz.qtrend.tasks.updates.TickerUpdaterApplication;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.spring.BeanFactorySingleton;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import lombok.val;
import org.springframework.boot.SpringApplication;

/**
 * Entry point to QTrend.
 *
 * @author Christian
 * @since Quartz...
 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class Main
{
    /**
     * Entry point
     */
    static public void main(String[] pArgs) throws Exception
    {
        LogManager.getLogger(Main.class);

        val context = SpringApplication.run(QTrendApplication.class, pArgs);
        BeanFactorySingleton.setBeanFactory(context);

        final QTrendFrame frame = QTrendBeanNames.MAIN_FRAME.getBean();

//        frame.setSize(400, 300);

        frame.setVisible(true);
    }
}
