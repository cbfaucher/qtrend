/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.services;

import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.StockQuoteImpl;
import com.quartz.qtrend.dom.services.readers.*;
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
public class LoadStockQuoteOnlyRowMapper implements RowMapper<StockQuote>
{
    static private final IFieldReader[] ALL_STOCK_QUOTE_READERS = {
        new AverageVolumeReader(),
        new CloseReader(),
        new DateReader(),
//        new Ema7Reader(),
//        new Ema28Reader(),
//        new Ema56Reader(),
//        new Ema112Reader(),
        new ExchangeReader(),
        new HighReader(),
        new IDReader(),
        new LowReader(),
//        new MacdReader(),
//        new NextSignalReader(),
        new OpenReader(),
        new PeriodSequenceReader(),
        new PriceDifferenceReader(),
//        new RsiReader(),
//        new SignalReader(),
        new TickerReader(),
//        new VariationReader(),
        new VolumeReader()
    };

    public StockQuote mapRow(ResultSet rs, int rowNum) throws SQLException
    {
        val quote = new StockQuoteImpl();

        for (IFieldReader fieldReader : ALL_STOCK_QUOTE_READERS)
        {
            fieldReader.read(rs, quote);
        }

        return quote;
    }
}
