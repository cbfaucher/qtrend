/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.services;

import org.springframework.jdbc.core.SqlParameterValue;
import com.quartz.qtrend.dom.helpers.RSI;
import com.quartz.qtrend.dom.helpers.EMA;
import com.quartz.qtrend.dom.helpers.Price;

import java.sql.Types;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
final public class ServicesHelper
{
    static public SqlParameterValue createSqlParameterValue(RSI pRsi)
    {
        return new SqlParameterValue(Types.FLOAT, (pRsi != null ? new Float(pRsi.rsi) : null));
    }

    static public SqlParameterValue createSqlParameterValue(Price pPrice)
    {
        return new SqlParameterValue(Types.FLOAT, (pPrice != null ? new Float(pPrice.price) : null));
    }

    static public SqlParameterValue createSqlParameterValue(EMA pEma)
    {
        return new SqlParameterValue(Types.FLOAT, (pEma != null ? new Float(pEma.ema) : null));
    }

}
