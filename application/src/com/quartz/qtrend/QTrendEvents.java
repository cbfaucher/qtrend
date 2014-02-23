/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public interface QTrendEvents
{
    static public final String FIND_INCOMING_OBS_SIGNALS = "Event.FindIncomingObsSignals";
    static public final String FIND_INCOMING_OSS_SIGNALS = "Event.FindIncomingOssSignals";
    static public final String FIND_PRICE_DROPS          = "Event.FindPriceDrops";

    static public final String SHOW_HISTORY = "Event.ShowHistory";
    static public final String SHOW_GRAPHIC = "Event.ShowGraphic";
    static public final String SHOW_STOCKCHART_GRAPHICS = "Event.ShowStockChartsGraphic";
    String FIND_OVERSOLD_STOCKS = "Event.FindOversoldStocks";
    String FIND_OVERBOUGHT_STOCKS = "Event.FindOverboughtStocks";
    String ESTIMATE_PROFIT_OR_LOSS = "Event.EstimateProfitOrLoss";
    String NEW_WINDOW = "Event.NewWindow";
    String IMPORT_EOD_DATA = "Event.ImportEodData";
    String IMPORT_TICKER_HISTORY = "Event.ImportTickerHistory";
    String IMPORT_TICKER_NAMES = "Event.ImportTickerNames";
    String CLOSE_WINDOW = "Event.CloseWindow";
    String EXIT = "Event.Exit";
}
