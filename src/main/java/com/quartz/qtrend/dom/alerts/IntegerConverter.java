/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.alerts;

import com.quartz.qutilities.util.Converter;
import com.quartz.qutilities.spring.validators.ValidationException;

/**
 * Converts either a Number or String to an Integer.
 *
 * @author Christian
 * @since Quartz...
 */
class IntegerConverter implements Converter<Object, Integer>
{
    public Integer convert(Object o) throws IllegalArgumentException, ValidationException
    {
        if (o instanceof Number)
        {
            return new Integer(((Number) o).intValue());
        }

        return new Integer((String) o);
    }
}
