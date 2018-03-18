/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.services;

import com.quartz.qtrend.dom.FullTickerName;
import com.quartz.qtrend.dom.helpers.Ticker;
import lombok.NoArgsConstructor;
import lombok.val;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
@NoArgsConstructor
public class FullTickerNameRowMapper implements RowMapper<FullTickerName>
{
    public FullTickerName mapRow(ResultSet rs, int rowNum) throws SQLException
    {
        val exchange = new Ticker(rs.getString("stockexchange").trim());
        val ticker = loadTicker(exchange, rs.getString("ticker").trim());
        val name = rs.getString("name").trim();

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
