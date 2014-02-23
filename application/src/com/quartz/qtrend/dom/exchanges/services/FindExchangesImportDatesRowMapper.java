/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.exchanges.services;

import com.quartz.qtrend.dom.ImportDates;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * This {@link ParameterizedRowMapper} extracts last import dates (min and max) for each exchanges.
 *
 * @author Christian
 * @since Quartz...
 */
class FindExchangesImportDatesRowMapper implements ParameterizedRowMapper<ImportDates>
{
    public FindExchangesImportDatesRowMapper()
    {
    }

    public ImportDates mapRow(ResultSet rs, int rowNum) throws SQLException
    {
        return new ImportDates(
                        rs.getString("stockexchange").trim(),
                        rs.getDate("mindate"),
                        rs.getDate("maxdate"),
                        rs.getInt("nbperiods"));
    }
}
