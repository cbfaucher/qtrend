/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.services;

import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.yahoo.UpdateInformation;
import org.joda.time.YearMonthDay;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
class GetUpdateInformation implements ParameterizedRowMapper<UpdateInformation>
{
    GetUpdateInformation()
    {
    }

    public UpdateInformation mapRow(ResultSet rs, int rowNum) throws SQLException
    {
        final Ticker ticker = new Ticker(rs.getString("TICKER").trim());
        return new UpdateInformation(
                new Ticker(rs.getString("STOCKEXCHANGE").trim()),
                ticker,
                rs.getInt("LASTSEQUENCE"),
                new YearMonthDay(rs.getDate("LASTDATE").getTime()));
    }
}
