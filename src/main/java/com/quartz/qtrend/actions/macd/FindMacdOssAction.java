/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.macd;

import com.quartz.qtrend.Signal;
import com.quartz.qtrend.actions.helpers.AbstractFindOssAction;

import javax.swing.*;

/**
 * Finds official sell signals.
 *
 * @author Christian
 * @since Quartz...
 */
public class FindMacdOssAction extends AbstractFindOssAction
{
    public FindMacdOssAction()
    {
        super(Signal.MACD_OSS);
    }

    protected boolean askQuestions()
    {
        final boolean b = super.askQuestions();
        if (b == false) return false;

        final String rsiStr = JOptionPane.showInputDialog(parent, "RSI above?", userProperties.getPropertyAsInt(USERPROP_OSS_MINIMUM_RSI, 70));
        if (rsiStr == null) return false;
        minimumRsi = new Integer(rsiStr.trim());
        userProperties.setProperty(USERPROP_OSS_MINIMUM_RSI, minimumRsi.toString());

        return true;
    }
}
