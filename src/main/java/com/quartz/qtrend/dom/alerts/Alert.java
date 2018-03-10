/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.alerts;

import com.quartz.qutilities.spring.validators.ValidationException;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Iterator;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class Alert
{
    final private AlertName alertName;

    final private Map<IAlertField, Object> parameterValues = new HashMap<IAlertField, Object>();

    public Alert(AlertName pAlertName)
    {
        alertName = pAlertName;

        //  add all constnats
        for (IAlertConstant constant : pAlertName.getConstants())
        {
            parameterValues.put(constant, constant.getValue());
        }
    }

    public IAlertAction getAlertAction()
    {
        return alertName.getAlertAction();
    }

    public void clearParameters()
    {
        parameterValues.clear();
    }

    public <T>void addParameter(final IAlertParameter<T> pParameter, final String pValue) throws ValidationException
    {
        parameterValues.put(pParameter, pParameter.convertAndValidate(pValue));
    }

    public <T>void addParameter(final IAlertParameter<T> pParameter, final T pValue)
    {
        parameterValues.put(pParameter, pValue);
    }

    public AlertName getAlertName()
    {
        return alertName;
    }

    public Collection<IAlertField> getParameterNames()
    {
        return parameterValues.keySet();
    }

    public <T>T getParameterValue(final IAlertField pField)
    {
        return (T) parameterValues.get(pField);
    }

    public String getFullName()
    {
        final StringBuffer buffer = new StringBuffer();

        buffer.append(alertName.getDisplayName());

        if (parameterValues.size() > 0)
        {
            buffer.append("(");

            for (Iterator iterator = getParameters().iterator(); iterator.hasNext();)
            {
                IAlertParameter alertParameter = (IAlertParameter) iterator.next();
                buffer.append(alertParameter.getDisplayName());
                buffer.append("=");
                buffer.append(parameterValues.get(alertParameter));
                buffer.append(" ");
            }

            buffer.append(")");
        }

        return buffer.toString();
    }

    public String toString()
    {
        return getFullName();
    }

    public <T>T getConstantValue(String pConstantName)
    {
        final IAlertConstant constant = alertName.getParameter(pConstantName);
        return (T) constant.getValue();
    }

    public Collection<IAlertParameter> getParameters()
    {
        return alertName.getParameters();
    }
}
