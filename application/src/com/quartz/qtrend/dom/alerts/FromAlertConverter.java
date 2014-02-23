/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.alerts;

import com.quartz.qutilities.spring.validators.ValidationException;
import com.quartz.qutilities.util.Converter;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class FromAlertConverter implements Converter<Alert, String>
{
    public FromAlertConverter()
    {
    }

    public String convert(Alert pAlert) throws IllegalArgumentException, ValidationException
    {
        final StringBuffer buffer = new StringBuffer();

        //  name
        buffer.append(pAlert.getAlertName().toString());

        for (final IAlertParameter parameter : pAlert.getParameters())
        {
            final Object value = pAlert.getParameterValue(parameter);

            buffer.append("&").append(parameter.getName()).append("=");
            if (value != null) buffer.append(value);
        }

        return buffer.toString();
    }
}
