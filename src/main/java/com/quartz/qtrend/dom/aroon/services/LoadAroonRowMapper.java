/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.aroon.services;

import com.quartz.qtrend.dom.aroon.Aroon;
import com.quartz.qtrend.dom.aroon.IAroonParent;
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
public class LoadAroonRowMapper implements RowMapper<Aroon>
{
    private final IAroonParent parent;
    private final int period;

    public Aroon mapRow(ResultSet rs, int rowNum) throws SQLException
    {
        return Aroon.builder()
                    .parent(parent)
                    .period(period)
                    .aroonUp(rs.getFloat("AROONUP"))
                    .aroonDown(rs.getFloat("AROONDOWN"))
                    .build();
    }
}
