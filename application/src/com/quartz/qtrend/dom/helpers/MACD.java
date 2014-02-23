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
public class MACD
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final public EMA shortTermEma;
    final public EMA longTermEma;

    final public float emaDifference;
    final public float macd;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public MACD(float pMacd, float pEmaDifference, float pStEma, float pLtEma)
    {
        this(pMacd, pEmaDifference, new EMA(pStEma), new EMA(pLtEma));
    }

    public MACD(float pMacd, float pEmaDifference, EMA pShortTermEma, EMA pLongTermEma)
    {
        macd = pMacd;
        emaDifference = pEmaDifference;
        shortTermEma = pShortTermEma;
        longTermEma = pLongTermEma;
    }

    public boolean equals(Object o)
    {
        if (this == o) return true;
        if (!(o instanceof MACD)) return false;

        final MACD macd1 = (MACD) o;

        if (emaDifference != macd1.emaDifference) return false;
        if (macd != macd1.macd) return false;
        if (longTermEma != null ? !longTermEma.equals(macd1.longTermEma) : macd1.longTermEma != null) return false;
        if (shortTermEma != null ? !shortTermEma.equals(macd1.shortTermEma) : macd1.shortTermEma != null) return false;

        return true;
    }

    public int hashCode()
    {
        int result;
        result = (shortTermEma != null ? shortTermEma.hashCode() : 0);
        result = 29 * result + (longTermEma != null ? longTermEma.hashCode() : 0);
        result = 29 * result + emaDifference != +0.0f ? Float.floatToIntBits(emaDifference) : 0;
        result = 29 * result + macd != +0.0f ? Float.floatToIntBits(macd) : 0;
        return result;
    }
    

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    ///////////////////////////////////////
    ////    INNER CLASSES
    public String toString()
    {
        return "MACD{" +
                "macd=" + macd +
                ", shortTermEma=" + shortTermEma +
                ", longTermEma=" + longTermEma +
                ", emaDifference=" + emaDifference +
                "}";
    }
}
