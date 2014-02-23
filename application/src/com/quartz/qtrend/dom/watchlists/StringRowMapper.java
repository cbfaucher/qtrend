/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.watchlists;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.apache.commons.lang.StringUtils;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class StringRowMapper implements ParameterizedRowMapper<String>
{
    final private String columnName;
    final private String valueIfNull;

    public StringRowMapper(String pColumnName)
    {
        this(pColumnName, null);
    }

    public StringRowMapper(String pColumnName, String pValueIfNull)
    {
        columnName = pColumnName;
        valueIfNull = pValueIfNull;
    }

    public String mapRow(ResultSet rs, int rowNum) throws SQLException
    {
        final String s = StringUtils.trim(rs.getString(columnName));
        return (s != null ? s : valueIfNull);
    }
}
