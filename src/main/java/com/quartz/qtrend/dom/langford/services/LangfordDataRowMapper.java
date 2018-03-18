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
import lombok.RequiredArgsConstructor;
import lombok.val;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
@RequiredArgsConstructor
public class LangfordDataRowMapper implements RowMapper<LangfordData> {
    private final StockQuote quote;

    public LangfordData mapRow(ResultSet rs, int rowNum) throws SQLException {
        val langfordData = LangfordDataImpl.builder()
                                           .stockQuote(quote)
                                           .rsi(new RSI(rs.getFloat("RSI")))
                                           .shortTermEma(new EMA(rs.getFloat("STEMA")))
                                           .longTermEma(new EMA(rs.getFloat("LTEMA")))
                                           .ema56(new EMA(rs.getFloat("EMA56")))
                                           .ema112(new EMA(rs.getFloat("EMA112")))
                                           .macd(new MACD(
                                                   rs.getFloat("MACD"),
                                                   rs.getFloat("EMADIFFERENCE"),
                                                   rs.getFloat("MACDSTEMA"),
                                                   rs.getFloat("MACDLTEMA")))
                                           .variation(Optional.ofNullable(rs.getString("VARIATION"))
                                                              .map(String::toString)
                                                              .orElse(null))
                                           .signal(Optional.ofNullable(rs.getString("SIGNAL"))
                                                           .map(String::trim)
                                                           .map(Signal::fromCode)
                                                           .orElse(null))
                                           .incomingSignal(rs.getFloat("NEXTSIGNAL"))
                                           .build();

        quote.setLangfordData(langfordData);

        return langfordData;
    }
}
