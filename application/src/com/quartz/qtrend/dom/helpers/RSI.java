/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.helpers;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class RSI
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    final public float rsi;

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public RSI(float pRsi) throws IllegalArgumentException
    {
        if (pRsi < 0 || pRsi > 100) throw new IllegalArgumentException("RSI must be between 0 and 100");
        rsi = pRsi;
    }

    final public float getRsi()
    {
        return rsi;
    }

    public boolean equals(Object o)
    {
        if (this == o) return true;
        if (!(o instanceof RSI)) return false;

        final RSI rsi1 = (RSI) o;

        if (rsi != rsi1.rsi) return false;

        return true;
    }

    public int hashCode()
    {
        return rsi != +0.0f ? Float.floatToIntBits(rsi) : 0;
    }



    ///////////////////////////////////////
    ////    INNER CLASSES
    public String toString()
    {
        return "RSI=" + rsi;
    }
}
