/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.helpers;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class Price implements Comparable
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final public float price;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public Price(float pPrice)
    {
        price = pPrice;
    }

    public Price(String pPrice) throws NumberFormatException
    {
        this(new Float(pPrice).floatValue());
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    final public float getPrice()
    {
        return price;
    }

    public int compareTo(Object o)
    {
        final Price other = (Price) o;
        if (this.price < other.price) return -1;
        if (this.price > other.price) return 1;
        return 0;
    }

    public boolean equals(Object o)
    {
        if (this == o) return true;
        if (!(o instanceof Price)) return false;

        final Price price1 = (Price) o;

        if (price != price1.price) return false;

        return true;
    }

    public int hashCode()
    {
        return price != +0.0f ? Float.floatToIntBits(price) : 0;
    }

    public String toString()
    {
        ByteArrayOutputStream out = new ByteArrayOutputStream(1024);
        final PrintStream ps = new PrintStream(out, true);

        try
        {
            ps.printf("%.2f", new Float(this.price));
            return out.toString();
        }
        finally
        {
            ps.close();
        }
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
