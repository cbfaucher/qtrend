/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.watchlists;

import lombok.RequiredArgsConstructor;
import org.springframework.jdbc.core.RowMapper;
import org.apache.commons.lang.StringUtils;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
@RequiredArgsConstructor
public class StringRowMapper implements RowMapper<String>
{
    final private String columnName;
    final private String valueIfNull;

    public StringRowMapper(String pColumnName)
    {
        this(pColumnName, null);
    }

    public String mapRow(ResultSet rs, int rowNum) throws SQLException
    {
        final String s = StringUtils.trim(rs.getString(columnName));
        return (s != null ? s : valueIfNull);
    }
}
