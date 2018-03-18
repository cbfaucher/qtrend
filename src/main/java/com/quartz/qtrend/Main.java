/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend;

import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qutilities.logging.LogManager;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

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

        Bootstrap.init(QTrendMode.USER_INTERFACE);

        final QTrendFrame frame = QTrendBeanNames.MAIN_FRAME.getBean();

//        frame.setSize(400, 300);

        frame.setVisible(true);
    }
}
