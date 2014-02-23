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
public interface IAlertParameter<T> extends IAlertField
{
    T convertAndValidate(Object pValue);

    void validate(Object pValue);

    IChoiceRetriever<T> getChoiceRetriever();
}
