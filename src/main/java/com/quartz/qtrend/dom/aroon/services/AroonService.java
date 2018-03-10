/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.aroon.services;

import com.quartz.qtrend.QTrendBeanNames;
import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.aroon.Aroon;
import com.quartz.qtrend.dom.aroon.IAroonParent;
import com.quartz.qtrend.dom.helpers.Price;
import com.quartz.qutilities.spring.transactions.QTransactionCallback;
import com.quartz.qutilities.spring.transactions.QTransactionTemplate;
import com.quartz.qutilities.util.DateUtilities;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.transaction.TransactionStatus;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Service methods for aroon.
 *
 * @author Christian
 * @since Quartz...
 */
public class AroonService
{
    static private final String SQL_DELETE_BY_REFID_AND_PERIOD = "delete from aroon where refid=? and period=?;";
    static private final String SQL_INSERT_BY_REFID_AND_PERIOD = "insert into aroon (refid, period, aroonup, aroondown) values(?, ?, ?, ?);";
    static private final String SQL_LOAD_AROON_BY_ID_AND_PERIOD = "select Aroon.* from stockquotes inner join aroon on id=refid where id=? and period=?;";

    final static private String SQL_FIND_PERIODSEQUENCE_WITH_HIGH_PRICE =
            "select date, periodsequence, close " +
            "from stockquotes " +
            "where ticker=? and periodsequence <= ? " +
            "order by periodsequence " +
            "limit ?;";
    //todo: THis SQL is same as above?!
    final static private String SQL_FIND_PERIODSEQUENCE_WITH_LOW_PRICE =
            "select date, periodsequence, close " +
            "from stockquotes " +
            "where ticker=? and periodsequence <= ? " +
            "order by periodsequence desc " +
            "limit ?;";
    
    
    //  brand new way!
    private SimpleJdbcTemplate   jdbcTemplate = null;
    private QTransactionTemplate transactionTemplate = null;

    public AroonService()
    {
    }

    public void setJdbcTemplate(SimpleJdbcTemplate pJdbcTemplate)
    {
        jdbcTemplate = pJdbcTemplate;
    }

    public void setTransactionTemplate(QTransactionTemplate pTransactionTemplate)
    {
        transactionTemplate = pTransactionTemplate;
    }

    public Aroon create(IAroonParent pParent, int pPeriod) throws StockException
    {
        final Aroon aroon = new Aroon(pParent, pPeriod);
        calculate(aroon);
        return aroon;
    }

    public void calculate(Aroon aroon) throws StockException
    {
        final IAroonParent parent = aroon.getParent();
        final int periodSequence = parent.getPeriodSequence();
        final int period = aroon.getPeriod();

        //  not enough periods yet
        if (periodSequence < period)
        {
            aroon.setAroonUp(0f);
            aroon.setAroonDown(0f);
            return;
        }

        final int periodWithHighPrice = getPeriodSequenceWithHighPrice(parent, period);
        final int periodWithLowPrice = getPeriodSequenceWithLowPrice(parent, period);


        //Aroon(up) = ((total_num_of_periods - num_of_periods_since_highest_close) / total_num_of_periods) x 100
        final int numPeriodSinceHighClose = parent.getPeriodSequence() - periodWithHighPrice;
        final float aroonUp = ((float)(period - numPeriodSinceHighClose)) / period * 100.0f;
        aroon.setAroonUp(aroonUp);
        //Aroon(down) = ((total_num_of_periods - num_of_periods_since_lowest_close) / total_num_of_periods)) x 100
        final int numPeriodSinceLowestClose = parent.getPeriodSequence() - periodWithLowPrice;
        final float aroonDown = ((float)(period - numPeriodSinceLowestClose)) / period * 100.0f;
        aroon.setAroonDown(aroonDown);
    }

    public Aroon load(final IAroonParent pParent, final int pPeriod) throws StockException
    {
        return jdbcTemplate.queryForObject(SQL_LOAD_AROON_BY_ID_AND_PERIOD,
                                           new LoadAroonRowMapper(pParent, pPeriod),
                                           pParent.getId(),
                                           pPeriod);
    }

    public void save(final Aroon pAroon) throws StockException
    {
        transactionTemplate.execute(new QTransactionCallback<Object>()
        {
            public Object doInTransaction(TransactionStatus status) throws Exception
            {
                final long id = pAroon.getParent().getId();
                final int period = pAroon.getPeriod();

                jdbcTemplate.update(SQL_DELETE_BY_REFID_AND_PERIOD, id, period);

                jdbcTemplate.update(SQL_INSERT_BY_REFID_AND_PERIOD,
                                    id, period, pAroon.getAroonUp(), pAroon.getAroonDown());

                return null;  //    nothing to return
            }
        });
    }

    private int getPeriodSequenceWithHighPrice(IAroonParent pQuote, int pPeriod) 
    {
        //LOG.debug("Finding period with highest price (" + pQuote.getTicker() + ", " + pQuote.getPeriodSequence() + ", " + pPeriod + ")");
        final List<PeriodPrice> periodPrices = jdbcTemplate.query(
                SQL_FIND_PERIODSEQUENCE_WITH_HIGH_PRICE,
                new PeriodPriceRowMapper(),
                pQuote.getTicker().toString(),
                pQuote.getPeriodSequence(),
                pPeriod);

        PeriodPrice found = null;

        for (PeriodPrice p : periodPrices)
        {
            if (found == null)
            {
                found = p;
                continue;
            }

            if (p.close.price >= found.close.price)
            {
                found = p;
            }
        }

        return found.periodSequence;
    }

    public int getPeriodSequenceWithLowPrice(IAroonParent pQuote, int pPeriod) throws StockException
    {
        final List<PeriodPrice> periodPrices =
                jdbcTemplate.query(SQL_FIND_PERIODSEQUENCE_WITH_LOW_PRICE,
                                   new PeriodPriceRowMapper(),
                                   pQuote.getTicker().toString(),
                                   pQuote.getPeriodSequence(),
                                   pPeriod);

        PeriodPrice found = null;

        for (PeriodPrice p : periodPrices)
        {
            if (found == null)
            {
                found = p;
                continue;
            }

            if (p.close.price <= found.close.price)
            {
                found = p;
            }
        }

        return found.periodSequence;

    }

    public void loadAroonIfNeeded(List<StockQuote> pQuotes) throws StockException
    {
        //  todo: verify if this works (TBC.TO on prod db).
        for (StockQuote sq : pQuotes)
        {
            if (sq.hasAroonShortTerm() == false)
            {
                sq.setAroonShortTerm(load(sq, 7));
            }

            if (sq.hasAroonLongTerm() == false)
            {
                sq.setAroonLongTerm(load(sq, 28));
            }
        }
    }

    private static class PeriodPriceRowMapper implements ParameterizedRowMapper<PeriodPrice>
    {
        public PeriodPrice mapRow(ResultSet rs, int rowNum) throws SQLException
        {
            return new PeriodPrice(DateUtilities.toYearMonthDay(rs.getDate("DATE")),
                                   rs.getInt("PERIODSEQUENCE"),
                                   new Price(rs.getFloat("CLOSE")));
        }
    }

}
