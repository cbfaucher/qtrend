/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.aroon;



/**
 * The Aroon technical indicator information, for a given period.
 *
 * @author Christian
 * @since Quartz...
 */
public class Aroon
{
    final private IAroonParent quote;

    private int period;

    private float aroonUp;
    private float aroonDown;

    public Aroon(IAroonParent pQuote, int pPeriod)
    {
        quote = pQuote;
        period = pPeriod;
    }

    public IAroonParent getParent()
    {
        return quote;
    }

    public int getPeriod()
    {
        return period;
    }

    public float getAroonUp()
    {
        return aroonUp;
    }

    public float getAroonDown()
    {
        return aroonDown;
    }

    public float getOscillator()
    {
        return (aroonUp - aroonDown);
    }

    public void setAroonUp(float pAroonUp)
    {
        aroonUp = pAroonUp;
    }

    public void setAroonDown(float pAroonDown)
    {
        aroonDown = pAroonDown;
    }
}
