/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.services;

import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.exchanges.StockQuoteVariation;
import com.quartz.qtrend.dom.exchanges.StockQuoteVariationImpl;
import com.quartz.qtrend.dom.helpers.Price;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qutilities.util.DateUtilities;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class StockQuoteVariationRowMapper implements ParameterizedRowMapper<StockQuoteVariation>
{
    final private Ticker exchange;
    final private Ticker ticker;

    public StockQuoteVariationRowMapper(StockQuote pQuote)
    {
        this(pQuote.getStockExchange(), pQuote.getTicker());
    }

    public StockQuoteVariationRowMapper(Ticker pExchange, Ticker pTicker)
    {
        exchange = pExchange;
        ticker = pTicker;
    }

    public StockQuoteVariation mapRow(ResultSet pRs, int rowNum) throws SQLException
    {
        final String ticker = (this.ticker != null ? this.ticker.toString() : pRs.getString("ticker"));
        final StockQuoteVariationImpl variation = new StockQuoteVariationImpl(
                exchange.toString(),
                ticker,
                pRs.getFloat("CLOSEVAR1"),
                pRs.getFloat("CLOSEVAR3"),
                pRs.getFloat("CLOSEVAR7"),
                pRs.getFloat("DIFFSTEMA"),
                pRs.getFloat("DIFFLTEMA"),
                pRs.getFloat("DIFFEMA56"),
                pRs.getFloat("DIFFEMA112"),
                pRs.getFloat("RSI"),
                pRs.getString("SIGNAL"));
        variation.setDate(DateUtilities.toYearMonthDay(pRs.getDate("DATE")));
        variation.setClose(new Price(pRs.getFloat("CLOSE")));
        variation.setVolume(pRs.getLong("VOLUME"));

        return variation;
    }
}
