/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.alerts;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class AlertConstant<T> implements IAlertConstant<T>
{
    final private String name;
    final private String displayName;
    final private T value;

    public AlertConstant(String pName, T pValue)
    {
        this(pName, pName, pValue);
    }

    public AlertConstant(String pName, String pDisplayName, T pValue)
    {
        name = pName;
        displayName = pDisplayName;
        value = pValue;
    }

    public String getName()
    {
        return name;
    }

    public String getDisplayName()
    {
        return displayName;
    }

    public T getValue()
    {
        return value;
    }
}
