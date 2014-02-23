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
 * RSI must be 0 and 100, inclusively.
 *
 * @author Christian
 * @since Quartz...
 */
class RsiValidator implements Validator
{
    public boolean supports(Class clazz)
    {
        return  Number.class.isAssignableFrom(clazz);
    }

    public void validate(Object target, Errors errors)
    {
        final Integer n = (Integer) target;

        if (n < 0) errors.reject("RSI", "Cannot be below 0.");
        if (n > 100) errors.reject("RSI", "Cannot be above 100.");
    }
}
