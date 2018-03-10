/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.ema;

import com.quartz.qtrend.Signal;
import com.quartz.qtrend.actions.helpers.AbstractFindObsAction;

/**
 * Find EMA OBSs for the given exchange, or all of them
 *
 * @author Christian
 * @since Quartz...
 */
public class FindEmaObsAction extends AbstractFindObsAction
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public FindEmaObsAction()
    {
        super(Signal.EMA_OBS);
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS


    ///////////////////////////////////////
    ////    INNER CLASSES
}
