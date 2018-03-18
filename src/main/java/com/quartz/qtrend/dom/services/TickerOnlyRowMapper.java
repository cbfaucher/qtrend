/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.services;

import com.quartz.qtrend.dom.helpers.Ticker;
import lombok.RequiredArgsConstructor;
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
public class TickerOnlyRowMapper implements RowMapper<Ticker>
{
    final private String columnName;

    /**
     * Ctor, with column name 'ticker'
     */
    TickerOnlyRowMapper()
    {
        this("ticker");
    }

    public Ticker mapRow(ResultSet rs, int rowNum) throws SQLException
    {
        return new Ticker(rs.getString(columnName).trim());
    }
}
