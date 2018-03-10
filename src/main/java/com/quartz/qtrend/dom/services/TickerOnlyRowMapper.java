/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.services;

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
public class TickerOnlyRowMapper implements ParameterizedRowMapper<Ticker>
{
    final private String columnName;

    /**
     * Ctor, with column name 'ticker'
     */
    public TickerOnlyRowMapper()
    {
        this("ticker");
    }

    public TickerOnlyRowMapper(final String pColumnName)
    {
        columnName = pColumnName;
    }

    public Ticker mapRow(ResultSet rs, int rowNum) throws SQLException
    {
        return new Ticker(rs.getString(columnName).trim());
    }
}
