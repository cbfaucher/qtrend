/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.macd;

import com.quartz.qtrend.QTrendConstants;
import com.quartz.qtrend.Signal;
import com.quartz.qtrend.actions.helpers.AbstractFindObsAction;

import javax.swing.*;

/**
 * Find OBSs for the given exchange, or all of them
 *
 * @author Christian
 * @since Quartz...
 */
public class FindMacdObsAction extends AbstractFindObsAction
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public FindMacdObsAction()
    {
        super(Signal.MACD_OBS);
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    protected boolean askQuestions()
    {
        final boolean b = super.askQuestions();
        if (b == false) return false;

        final String rsiStr = JOptionPane.showInputDialog(parent, "RSI below?", userProperties.getUserPropertyAsInt(QTrendConstants.UserPropertyNames.USERPROP_OBS_MAX_RSI, 30));
        if (rsiStr == null) return false;
        maximumRsi = Integer.parseInt(rsiStr.trim());
        userProperties.setUserProperty(QTrendConstants.UserPropertyNames.USERPROP_OBS_MAX_RSI, String.valueOf(maximumRsi));

        return b;
    }
}
