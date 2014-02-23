/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.dao;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class StockQuoteLoadContext
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private boolean rowContainsLangford = false;
    private boolean rowContainsAroonShortTerm = false;
    private boolean rowContainsAroonLongTerm = false;
    private boolean rowContainsVariations = false;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public StockQuoteLoadContext()
    {
    }

    public StockQuoteLoadContext(boolean pRowContainsLangford, boolean pRowContainsAroonShortTerm, boolean pRowContainsAroonLongTerm)
    {
        rowContainsLangford = pRowContainsLangford;
        rowContainsAroonShortTerm = pRowContainsAroonShortTerm;
        rowContainsAroonLongTerm = pRowContainsAroonLongTerm;
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public boolean isRowContainsLangford()
    {
        return rowContainsLangford;
    }

    public void setRowContainsLangford(boolean pRowContainsLangford)
    {
        rowContainsLangford = pRowContainsLangford;
    }

    public boolean isRowContainsAroonShortTerm()
    {
        return rowContainsAroonShortTerm;
    }

    public void setRowContainsAroonShortTerm(boolean pRowContainsAroonShortTerm)
    {
        rowContainsAroonShortTerm = pRowContainsAroonShortTerm;
    }

    public boolean isRowContainsAroonLongTerm()
    {
        return rowContainsAroonLongTerm;
    }

    public void setRowContainsAroonLongTerm(boolean pRowContainsAroonLongTerm)
    {
        rowContainsAroonLongTerm = pRowContainsAroonLongTerm;
    }

    public boolean isRowContainsVariations()
    {
        return rowContainsVariations;
    }

    public void setRowContainsVariations(boolean pRowContainsVariations)
    {
        rowContainsVariations = pRowContainsVariations;
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
