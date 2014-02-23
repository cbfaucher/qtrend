/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.yahoo;

import com.quartz.qtrend.dom.helpers.Ticker;
import org.joda.time.YearMonthDay;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class UpdateInformation
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final private Ticker        exchange;
    final private Ticker        ticker;
    private int           lastPeriodSequence;
    final private YearMonthDay  lastImportDate;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public UpdateInformation(Ticker pExchange, Ticker pTicker, int pLastPeriodSequence, YearMonthDay pLastImportDate)
    {
        exchange = pExchange;
        ticker = pTicker;
        lastPeriodSequence = pLastPeriodSequence;
        lastImportDate = pLastImportDate;
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public Ticker getExchange()
    {
        return exchange;
    }

    public Ticker getTicker()
    {
        return ticker;
    }

    public int getLastPeriodSequence()
    {
        return lastPeriodSequence;
    }

    public void stepLastPeriodSequence()
    {
        lastPeriodSequence++;
    }

    public YearMonthDay getLastImportDate()
    {
        return lastImportDate;
    }

    public String toString()
    {
        return exchange + "/" + ticker + "; " + lastImportDate + "; " + lastPeriodSequence;
    }
    ///////////////////////////////////////
    ////    INNER CLASSES
}
