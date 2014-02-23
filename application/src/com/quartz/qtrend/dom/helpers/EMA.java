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
public class EMA
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final public float ema;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public EMA(float pEma)
    {
        ema = pEma;
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public boolean equals(Object o)
    {
        if (this == o) return true;
        if (!(o instanceof EMA)) return false;

        final EMA ema1 = (EMA) o;

        if (ema != ema1.ema) return false;

        return true;
    }

    public int hashCode()
    {
        return ema != +0.0f ? Float.floatToIntBits(ema) : 0;
    }

    public String toString()
    {
        return "EMA=" + ema;
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
