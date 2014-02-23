/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.alerts;

import org.springframework.validation.Validator;
import org.springframework.validation.Errors;
import org.springframework.validation.BeanPropertyBindingResult;
import com.quartz.qutilities.util.Converter;
import com.quartz.qutilities.spring.validators.ValidationException;
import com.quartz.qutilities.spring.validators.ThrowValidationExceptionHandler;

/**
 * Alert parameter
 *
 * @author Christian
 * @since Quartz...
 */
public class AlertParameter<T> implements IAlertParameter
{
    final private String name;
    final private String displayName;
    final private Converter<Object, T> converter;
    final private IChoiceRetriever<T> choiceRetriever;
    final private Validator validator;

    public AlertParameter(String pName)
    {
        this(pName, pName, null, null, null);
    }

    public AlertParameter(String pName, String pDisplayName)
    {
        this(pName, pDisplayName, null, null, null);
    }

    public AlertParameter(String pName, String pDisplayName, IChoiceRetriever pPossibleValuesRetriever, Converter<Object, T> pConverter, Validator pValidator)
    {
        name = pName;
        displayName = pDisplayName;

        choiceRetriever = pPossibleValuesRetriever;
        converter = pConverter;
        validator = pValidator;
    }

    public String getName()
    {
        return name;
    }

    public String getDisplayName()
    {
        return displayName;
    }

    public IChoiceRetriever<T> getChoiceRetriever()
    {
        return choiceRetriever;
    }

    public T convertAndValidate(Object pValue)
    {
        if (converter != null)
        {
            return converter.convert(pValue);
        }

        validate(pValue);

        return (T) pValue;
    }

    public void validate(final Object pValue)
    {
        if (validator != null)
        {
            if (pValue != null)
            {
                if (!validator.supports(pValue.getClass())) throw new ValidationException("Unsupported value type for " + name + ": " + pValue.getClass());
            }

            final Errors errors = new BeanPropertyBindingResult(this, name);
            validator.validate(pValue, errors);
            new ThrowValidationExceptionHandler().handleErrors(errors);
        }
    }

    public boolean equals(Object o)
    {
        if (this == o) return true;
        if (!(o instanceof AlertParameter)) return false;

        final AlertParameter alertParameter = (AlertParameter) o;

        if (!name.equals(alertParameter.name)) return false;
        if (validator != null ? !validator.equals(alertParameter.validator) : alertParameter.validator != null) return false;

        return true;
    }

    public int hashCode()
    {
        return name.hashCode();
    }
}
