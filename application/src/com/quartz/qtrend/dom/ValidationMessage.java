/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom;

import org.apache.commons.lang.StringUtils;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
final public class ValidationMessage
{
    static public enum Level {INFO, WARNING, ERROR};

    final public String message;
    final public String suggestedAction;
    final public Level  level;

    public ValidationMessage(String pMessage, String pSuggestedAction, Level pLevel)
    {
        message = pMessage;
        suggestedAction = pSuggestedAction;
        level = pLevel;
    }

    public String toString()
    {
        return  StringUtils.rightPad(level.toString() + ": ", 10, ' ')
                + message + "\n"
                + StringUtils.rightPad("", 10, ' ')
                + "Suggested action: " + suggestedAction;
    }
}
