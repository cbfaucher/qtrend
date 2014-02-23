/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.langford.services;

import com.quartz.qtrend.Signal;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.helpers.EMA;
import com.quartz.qtrend.dom.helpers.MACD;
import com.quartz.qtrend.dom.helpers.RSI;
import com.quartz.qtrend.dom.langford.LangfordData;
import com.quartz.qtrend.dom.langford.LangfordDataImpl;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class LangfordDataRowMapper implements ParameterizedRowMapper<LangfordData>
{
    private final StockQuote quote;

    public LangfordDataRowMapper(StockQuote pQuote)
    {
        quote = pQuote;
    }

    public LangfordData mapRow(ResultSet rs, int rowNum) throws SQLException
    {
        final LangfordDataImpl langfordData = new LangfordDataImpl(quote);
        langfordData.setRsi(new RSI(rs.getFloat("RSI")));
        langfordData.setShortTermEma(new EMA(rs.getFloat("STEMA")));
        langfordData.setLongTermEma(new EMA(rs.getFloat("LTEMA")));
        langfordData.setEma56(new EMA(rs.getFloat("EMA56")));
        langfordData.setEma112(new EMA(rs.getFloat("EMA112")));
        langfordData.setMacd(new MACD(
                rs.getFloat("MACD"),
                rs.getFloat("EMADIFFERENCE"),
                rs.getFloat("MACDSTEMA"),
                rs.getFloat("MACDLTEMA") ));
        final String variation = rs.getString("VARIATION");
        langfordData.setVariation(variation != null ? variation.toString() : null);
        final String signal = rs.getString("SIGNAL");
        langfordData.setSignal(Signal.fromCode(signal != null ? signal.trim() : null));
        langfordData.setIncomingSignal(rs.getFloat("NEXTSIGNAL"));

        quote.setLangfordData(langfordData);

        return langfordData;
    }
}
