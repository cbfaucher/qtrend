/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.services;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import com.quartz.qtrend.dom.BasicStockInfo;
import com.quartz.qtrend.dom.helpers.Price;
import com.quartz.qtrend.dom.helpers.Ticker;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class BasicStockInfoRowMapper implements ParameterizedRowMapper<BasicStockInfo>
{
    public BasicStockInfoRowMapper()
    {
    }

    public BasicStockInfo mapRow(ResultSet rs, int rowNum) throws SQLException
    {
        return new BasicStockInfo(new Ticker(rs.getString("stockexchange")),
                                  new Ticker(rs.getString("ticker")),
                                  rs.getString("name"),
                                  new Price(0), 0);
    }
}
