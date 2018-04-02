/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend;

import com.quartz.qutilities.unittests.QTestCase;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.junit.After;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
@NoArgsConstructor
@AllArgsConstructor
public abstract class TrendTestCase extends QTestCase implements TestCaseUtils
{

    private boolean                 needsBootstrap;

    protected TrendTestCase(String pName, boolean pNeedsBootstrap)
    {
        super(pName);
        needsBootstrap = pNeedsBootstrap;
    }

    protected void setUp() throws Exception
    {
        if (needsBootstrap)
        {
            Bootstrap.init(QTrendMode.USER_INTERFACE);
        }
    }

    @After
    public void tearDown() throws Exception
    {
        Bootstrap.destroy();
    }


}
