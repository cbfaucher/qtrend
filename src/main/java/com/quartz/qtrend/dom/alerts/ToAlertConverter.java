/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.alerts;

import com.quartz.qutilities.spring.validators.ValidationException;
import com.quartz.qutilities.util.Converter;

import java.util.StringTokenizer;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class ToAlertConverter implements Converter<String, Alert>
{
    public ToAlertConverter()
    {
    }


    public Alert convert(String s) throws IllegalArgumentException, ValidationException
    {
        //  format: blah&aa=bbb&ccc=ddd&eee=fff
        int hypersandIndex = s.indexOf('&');

        final AlertName alertName = (hypersandIndex < 0 ? AlertName.valueOf(s) : AlertName.valueOf(s.substring(0, hypersandIndex)));

        final Alert alert = new Alert(alertName);

        if (hypersandIndex >= 0)
        {
            //  trunc name infirst place
            String params = s.substring(hypersandIndex, s.length());

            StringTokenizer tokenizer = new StringTokenizer(params, "&");
            while (tokenizer.hasMoreTokens())
            {
                final String nameAndValue = tokenizer.nextToken();
                final int equalsIndex = nameAndValue.indexOf('=');

                if (equalsIndex == 0) throw new IllegalArgumentException("Parameter without a name: " + nameAndValue);
                if (equalsIndex < 0)
                {
                    final AlertParameter parameter = alertName.getParameter(nameAndValue);
                    alert.addParameter(parameter, parameter.convertAndValidate(null));
                }

                final String name = nameAndValue.substring(0, equalsIndex);
                final String value = nameAndValue.substring(equalsIndex + 1, nameAndValue.length());

                final AlertParameter parameter = alertName.getParameter(name);
                alert.addParameter(parameter, parameter.convertAndValidate(value));
            }
        }

        return alert;
    }
}
