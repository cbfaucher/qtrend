/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.exchanges;

import com.quartz.qtrend.dom.AbstractStockQuoteImpl;
import com.quartz.qtrend.dom.helpers.Price;
import com.quartz.qtrend.dom.helpers.Ticker;
import lombok.Builder;
import lombok.Getter;
import org.joda.time.LocalDate;


/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
@Getter
public class StockQuoteVariationImpl extends AbstractStockQuoteImpl implements StockQuoteVariation
{
    final private float closeVariation1day;
    final private float closeVariation3days;
    final private float closeVariation7days;

    final private float diffEma7;
    final private float diffEma28;
    final private float diffEma56;
    final private float diffEma112;

    final private float rsi;
    final private String langfordSignal;

    @Builder(toBuilder = true)
    public StockQuoteVariationImpl(Ticker stockExchange, Ticker ticker, String tickerName, LocalDate date, Price close, Price mininumClose, Price maximumClose, long volume, long averageVolume, int tickerCount, float closeVariation1day, float closeVariation3days, float closeVariation7days, float diffEma7, float diffEma28, float diffEma56, float diffEma112, float rsi, String langfordSignal) {
        super(stockExchange, ticker, tickerName, date, close, mininumClose, maximumClose, volume, averageVolume, tickerCount);
        this.closeVariation1day = closeVariation1day;
        this.closeVariation3days = closeVariation3days;
        this.closeVariation7days = closeVariation7days;
        this.diffEma7 = diffEma7;
        this.diffEma28 = diffEma28;
        this.diffEma56 = diffEma56;
        this.diffEma112 = diffEma112;
        this.rsi = rsi;
        this.langfordSignal = langfordSignal;
    }
}
