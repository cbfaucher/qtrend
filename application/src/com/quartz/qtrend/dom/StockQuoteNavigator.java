/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom;

import java.util.List;


/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public interface StockQuoteNavigator
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    boolean supportsGetPreviousQuote();
    StockQuote getPreviousQuote(StockQuote pThisStock) throws StockException;

    boolean supportsGetPreviousQuotes();
    List<StockQuote> getPreviousQuotes(StockQuote pThisQuote, int pNbPrevious, boolean pIncludeMe) throws StockException;

    ///////////////////////////////////////
    ////    INNER CLASSES

}
