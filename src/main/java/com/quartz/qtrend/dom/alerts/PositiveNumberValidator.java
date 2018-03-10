/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.alerts;

import org.springframework.validation.Validator;
import org.springframework.validation.Errors;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
class PositiveNumberValidator implements Validator
{
    private boolean acceptsZero = true;

    public PositiveNumberValidator(boolean pAcceptsZero)
    {
        acceptsZero = pAcceptsZero;
    }

    public boolean isAcceptsZero()
    {
        return acceptsZero;
    }

    public void setAcceptsZero(boolean pAcceptsZero)
    {
        acceptsZero = pAcceptsZero;
    }

    public boolean supports(Class clazz)
    {
        return Number.class.isAssignableFrom(clazz);
    }

    public void validate(Object target, Errors errors)
    {
        final Number number = (Number) target;

        final double d = number.doubleValue();

        if (d < 0.0d) errors.reject("SMALLER-THAN-0", "Number " + number + " is smaller than 0.");
        if (!acceptsZero && d == 0.0d) errors.reject("EQUALS-TO-0", "Number " + number + " is 0.");
    }
}
