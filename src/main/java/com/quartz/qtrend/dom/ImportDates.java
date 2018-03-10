/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom;

import java.sql.Date;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class ImportDates
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final public String exchange;
    final public Date minimumDate;
    final public Date maximumDate;
    final public int  numberOfPeriods;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public ImportDates(String pExchange, Date pMinimumDate, Date pMaximumDate, int pNumberOfPeriods)
    {
        exchange = pExchange;
        minimumDate = pMinimumDate;
        maximumDate = pMaximumDate;
        numberOfPeriods = pNumberOfPeriods;
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    ///////////////////////////////////////
    ////    INNER CLASSES
}
