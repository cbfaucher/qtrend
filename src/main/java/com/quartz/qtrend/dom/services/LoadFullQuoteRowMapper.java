/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.services;

import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.aroon.services.LoadAroonRowMapper;
import com.quartz.qtrend.dom.dao.StockQuoteLoadContext;
import com.quartz.qtrend.dom.exchanges.StockQuoteVariation;
import com.quartz.qtrend.dom.langford.services.LangfordDataRowMapper;
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
public class LoadFullQuoteRowMapper implements RowMapper<StockQuote>
{
    final private StockQuoteLoadContext loadContext;

    public StockQuote mapRow(ResultSet rs, int rowNum) throws SQLException
    {
//        final StockQuote quote = stockQuoteDao.loadStockQuoteOnly(pResultSet, pContext);
        val quote = new LoadStockQuoteOnlyRowMapper().mapRow(rs, rowNum);

        if (loadContext != null)
        {
            if (loadContext.isRowContainsLangford())
            {
                quote.setLangfordData(new LangfordDataRowMapper(quote).mapRow(rs, rowNum));
            }

            if (loadContext.isRowContainsAroonShortTerm())
            {
                quote.setAroonShortTerm(new LoadAroonRowMapper(quote, 7).mapRow(rs, rowNum));
            }
            if (loadContext.isRowContainsAroonLongTerm())
            {
                quote.setAroonLongTerm(new LoadAroonRowMapper(quote, 28).mapRow(rs, rowNum));
            }

            //  if variations are present
            if (loadContext.isRowContainsVariations() == true)
            {
                final StockQuoteVariation variation = new StockQuoteVariationRowMapper(quote).mapRow(rs, rowNum);
                quote.setVariation(variation);
            }

        }

        return quote;

    }
}
