/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.macd;

import com.quartz.qtrend.QTrendConstants;
import com.quartz.qtrend.Signal;
import com.quartz.qtrend.actions.helpers.AbstractEstimateProfitAction;

import javax.swing.*;

/**
 * Estimates the profits a given action, based on its signal (regular and sell short)
 *
 * @author Christian
 * @since Quartz...
 */
public class MacdEstimateProfitAction extends AbstractEstimateProfitAction
{


    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public MacdEstimateProfitAction()
    {
        super(Signal.MACD_OBS, Signal.MACD_OSS);
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    protected boolean askQuestions()
    {
        final boolean b = super.askQuestions();
        if (b == false) return false;

        final String obsRsiStr = JOptionPane.showInputDialog(frame,
                                                             "OBS RSI below?",
                                                             userProperties.getUserPropertyAsInt(QTrendConstants.UserPropertyNames.USERPROP_OBS_MAX_RSI, 30));
        if (obsRsiStr == null) return false;
        obsRsi = Integer.parseInt(obsRsiStr.trim());
        userProperties.setUserProperty(QTrendConstants.UserPropertyNames.USERPROP_OBS_MAX_RSI, String.valueOf(obsRsi));

        final String ossRsiStr = JOptionPane.showInputDialog(frame,
                                                             "OSS RSI above?",
                                                             userProperties.getUserPropertyAsInt(QTrendConstants.UserPropertyNames.USERPROP_OSS_MINIMUM_RSI, 30));
        if (ossRsiStr == null) return false;
        ossRsi = Integer.parseInt(ossRsiStr.trim());
        userProperties.setUserProperty(QTrendConstants.UserPropertyNames.USERPROP_OSS_MINIMUM_RSI, String.valueOf(ossRsi));

        return true;    //To change body of overridden methods use File | Settings | File Templates.
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
