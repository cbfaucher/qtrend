/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.services;

import com.quartz.qtrend.dom.FullTickerName;
import com.quartz.qtrend.dom.helpers.Ticker;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class FullTickerNameRowMapper implements ParameterizedRowMapper<FullTickerName>
{
    public FullTickerNameRowMapper()
    {
    }

    public FullTickerName mapRow(ResultSet rs, int rowNum) throws SQLException
    {
        final Ticker exchange = new Ticker(rs.getString("stockexchange").trim());
        final Ticker ticker = loadTicker(exchange, rs.getString("ticker").trim());
        final String name = rs.getString("name").trim();

        return new FullTickerName(exchange, ticker, name);
    }

    private Ticker loadTicker(final Ticker pExchange, final String pTicker)
    {
        String tickerAsString = pTicker;

        //  todo: make this configurable through exchange configuration!
        if (isTSE(pExchange))
        {
            tickerAsString = normalize(tickerAsString, ".TO");
        }
        else if (isVSE(pExchange))
        {
            tickerAsString = normalize(tickerAsString, ".V");
        }

        return new Ticker(tickerAsString);
    }

    private String normalize(String pTickerAsString, final String pExchangeExtension)
    {
        if (pTickerAsString.endsWith(pExchangeExtension))
        {
            pTickerAsString = pTickerAsString.substring(0, pTickerAsString.length() - pExchangeExtension.length());
            pTickerAsString = pTickerAsString.replaceAll("\\.", "/");
        }

        pTickerAsString = pTickerAsString + pExchangeExtension;
        return pTickerAsString;
    }

    private boolean isTSE(final Ticker pExchange)
    {
        return pExchange.equals(new Ticker("TSE"));
    }

    private boolean isVSE(final Ticker pExchange)
    {
        return pExchange.equals(new Ticker("VSE"));
    }
}
