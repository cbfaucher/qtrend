/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.tasks;

import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.util.Output;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class TaskOutput implements Output
{
    static private final ILog LOG = LogManager.getLogger(TaskOutput.class);

    public TaskOutput()
    {
    }

    public void write(String pText)
    {
        LOG.info(pText);
    }

    public void writeln(String pText)
    {
        LOG.info(pText + "\n");
    }

    public void writeln()
    {
        LOG.info("\n");
    }

    public void selectAll()
    {
        throw new UnsupportedOperationException();
    }

    public String getSelectedText()
    {
        throw new UnsupportedOperationException();
    }

    public void setPosition(int pCharIndex)
    {
        throw new UnsupportedOperationException();
    }

    public void clear()
    {
        //  does nothing
        //throw new UnsupportedOperationException();
    }
}
