/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.alerts;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.functors.InstanceofPredicate;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import com.quartz.qtrend.dom.WatchListAlertAction;

/**
 * The meta-information about alerts.
 *
 * @author Christian
 * @since Quartz...
 */
public enum AlertName implements AlertParameters
{
    OBS_BY_MACD("OBS by MACD", false, new FindObsAction(), CONST_MACD_OBS, PARAM_OVERSOLD_LIMIT, PARAM_FOR_LAST_PERIODS),
    OBS_BY_EMA("OBS by EMA", false, new FindObsAction(), CONST_EMA_OBS, PARAM_FOR_LAST_PERIODS),
    OSS_BY_MACD("OSS by MACD", false, new FindOssAction(), CONST_MACD_OSS, PARAM_OVERBOUGHT_LIMIT, PARAM_FOR_LAST_PERIODS),
    OSS_BY_EMA("OSS by EMA", false, new FindOssAction(), CONST_EMA_OSS, PARAM_FOR_LAST_PERIODS),
    LOW_RSI ("Low RSI", false, new LowRsiAlertAction(), PARAM_OVERSOLD_LIMIT),
    HIGH_RSI("High RSI", false, new HighRsiAlertAction(), PARAM_OVERBOUGHT_LIMIT),
    WATCHLIST("Display Watchlist", true, new WatchListAlertAction(), PARAM_WATCHLIST_NAME);

    private static final String WATCHLIST_ALERT_SEPARATOR = "/";

    final private String displayName;
    final private boolean multipleSupported;
    final private IAlertAction alertAction;
    final private Map<String, IAlertField> parameters = new HashMap<String, IAlertField>();

    AlertName(String pDisplayName)
    {
        this(pDisplayName, false, null);
    }

    AlertName(String pDisplayName, boolean pMultipleSupported, final IAlertAction pAction, IAlertField ... pFields)
    {
        displayName = pDisplayName;
        multipleSupported = pMultipleSupported;
        alertAction = pAction;

        for (final IAlertField p : pFields)  parameters.put(p.getName(), p);
    }

    public String getDisplayName()
    {
        return displayName;
    }

    public boolean isMultipleSupported()
    {
        return multipleSupported;
    }

    public IAlertAction getAlertAction()
    {
        return alertAction;
    }

    /**
     * @deprecated Use parameters!
     */
    static public String makeWatchlistAlertName(final String pWatchListName)
    {
        return WATCHLIST.getDisplayName() + WATCHLIST_ALERT_SEPARATOR + pWatchListName;
    }

    /**
     * @deprecated Use parameters!
     */
    static public  String extractWatchlistName(String wlAlert)
    {
        final int sepIndex = wlAlert.indexOf(WATCHLIST_ALERT_SEPARATOR);
        if (sepIndex < 0) return null;
        return wlAlert.substring(sepIndex + 1).trim();
    }

    public <T extends IAlertField>T getParameter(String pParameterName)
    {
        if (!parameters.containsKey(pParameterName)) throw new IllegalArgumentException("Unkonwn parameter: " + pParameterName);
        return (T) parameters.get(pParameterName);
    }

    public Collection<IAlertParameter> getParameters()
    {
        final ArrayList<IAlertParameter> returnValue = new ArrayList<IAlertParameter>();

        CollectionUtils.select(parameters.values(),
                               InstanceofPredicate.getInstance(IAlertParameter.class),
                               returnValue);

        return returnValue;
    }

    public Collection<IAlertConstant> getConstants()
    {
        final ArrayList<IAlertConstant> constants = new ArrayList<IAlertConstant>();

        CollectionUtils.select(parameters.values(),
                               InstanceofPredicate.getInstance(IAlertConstant.class),
                               constants);

        return constants;
    }
}
