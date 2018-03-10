/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.aroon.services;

import com.quartz.qtrend.dom.aroon.Aroon;
import com.quartz.qtrend.dom.aroon.IAroonParent;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class LoadAroonRowMapper implements ParameterizedRowMapper<Aroon>
{
    private final IAroonParent parent;
    private final int period;

    public LoadAroonRowMapper(IAroonParent pParent, int pPeriod)
    {
        parent = pParent;
        period = pPeriod;
    }

    public Aroon mapRow(ResultSet rs, int rowNum) throws SQLException
    {
        final Aroon aroon = new Aroon(parent, period);
        aroon.setAroonUp(rs.getFloat("AROONUP"));
        aroon.setAroonDown(rs.getFloat("AROONDOWN"));
        return aroon;
    }
}
