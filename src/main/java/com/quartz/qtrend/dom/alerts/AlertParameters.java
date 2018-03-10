/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.alerts;

import com.quartz.qutilities.spring.validators.StringNotEmptyValidator;
import com.quartz.qtrend.Signal;

/**
 * Alert parameters descriptions
 *
 * @author Christian
 * @since Quartz...
 */
public interface AlertParameters
{
    static public final AlertParameter<Integer> PARAM_OVERBOUGHT_LIMIT = new AlertParameter<Integer>(
            "high-rsi-limit",
            "Overbought (high RSI)",
            null,
            new IntegerConverter(), new RsiValidator());
    static public final AlertParameter<Integer> PARAM_OVERSOLD_LIMIT = new AlertParameter<Integer>(
            "low-rsi-limit",
            "Oversold (low RSI)",
            null,
            new IntegerConverter(), new RsiValidator());

    static public final AlertParameter<Integer> PARAM_FOR_LAST_PERIODS = new AlertParameter<Integer>(
            "for-last-periods", "For last periods", null, new IntegerConverter(), new PositiveNumberValidator(false));

    static public final AlertParameter PARAM_WATCHLIST_NAME = new AlertParameter("watch-list-name", "Name", new WatchListNamesRetriever(), null, new StringNotEmptyValidator());

    String NAME_OBS_SIGNAL = "obs-signal";
    String NAME_OSS_SIGNAL = "oss-signal";

    static public final AlertConstant<Signal> CONST_MACD_OBS = new AlertConstant<Signal>(NAME_OBS_SIGNAL, "MACD Buy Signal", Signal.MACD_OBS);
    static public final AlertConstant<Signal> CONST_EMA_OBS = new AlertConstant<Signal>(NAME_OBS_SIGNAL, "EMA Buy Signal", Signal.EMA_OBS);
    static public final AlertConstant<Signal> CONST_MACD_OSS = new AlertConstant<Signal>(NAME_OSS_SIGNAL, "MACD Sell Signal", Signal.MACD_OSS);
    static public final AlertConstant<Signal> CONST_EMA_OSS = new AlertConstant<Signal>(NAME_OSS_SIGNAL, "EMA Sell Signal", Signal.EMA_OSS);
}
