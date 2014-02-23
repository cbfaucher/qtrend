/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend;



/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public enum Signal
{
    MACD_OBS("OBS"),
    MACD_OSS("OSS"),
    EMA_OBS("MAB"),
    EMA_OSS("MAS");

    static public Signal fromCode(String pSignal)
    {
        for (Signal s : values())
        {
            if (s.getSignal().equalsIgnoreCase(pSignal)) return s;
        }

        return null;
    }

    final private String signal;

    Signal(String pSignal)
    {
        signal = pSignal;
    }

    public String getSignal()
    {
        return signal;
    }


    public String toString()
    {
        return getSignal();
    }
}
