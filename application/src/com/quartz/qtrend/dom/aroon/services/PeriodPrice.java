/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.aroon.services;

import org.joda.time.YearMonthDay;
import com.quartz.qtrend.dom.helpers.Price;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
class PeriodPrice
{
    final YearMonthDay date;
    final int periodSequence;
    final Price close;

    PeriodPrice(YearMonthDay pDate, int pPeriodSequence, Price pClose)
    {
        date = pDate;
        periodSequence = pPeriodSequence;
        close = pClose;
    }

}
