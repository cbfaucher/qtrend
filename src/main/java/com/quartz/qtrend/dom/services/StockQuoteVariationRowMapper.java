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
import lombok.RequiredArgsConstructor;
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
@RequiredArgsConstructor
public class StockQuoteVariationRowMapper implements RowMapper<StockQuoteVariation> {
    final private Ticker exchange;
    final private Ticker ticker;

    public StockQuoteVariationRowMapper(StockQuote pQuote) {
        this(pQuote.getStockExchange(), pQuote.getTicker());
    }

    public StockQuoteVariation mapRow(ResultSet pRs, int rowNum) throws SQLException {
        val ticker = (this.ticker != null
                      ? this.ticker
                      : new Ticker(pRs.getString("ticker")));

        return StockQuoteVariationImpl.builder()
                                      .stockExchange(exchange)
                                      .ticker(ticker)
                                      .closeVariation1day(pRs.getFloat("CLOSEVAR1"))
                                      .closeVariation3days(pRs.getFloat("CLOSEVAR3"))
                                      .closeVariation7days(pRs.getFloat("CLOSEVAR7"))
                                      .diffEma7(pRs.getFloat("DIFFSTEMA"))
                                      .diffEma28(pRs.getFloat("DIFFLTEMA"))
                                      .diffEma56(pRs.getFloat("DIFFEMA56"))
                                      .diffEma112(pRs.getFloat("DIFFEMA112"))
                                      .rsi(pRs.getFloat("RSI"))
                                      .langfordSignal(pRs.getString("SIGNAL"))
                                      .date(DateUtilities.toLocalDate(pRs.getDate("DATE")))
                                      .close(new Price(pRs.getFloat("CLOSE")))
                                      .volume(pRs.getLong("VOLUME"))
                                      .build();
    }
}
