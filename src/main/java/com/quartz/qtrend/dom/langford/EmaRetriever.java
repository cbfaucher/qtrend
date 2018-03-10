/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.langford;

import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public interface EmaRetriever
{
    float getEMA(StockQuote pStock) throws StockException;

    float getValue(StockQuote pStock);
}
