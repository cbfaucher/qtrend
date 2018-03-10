/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.dao;

import com.quartz.qtrend.StockRuntimeException;
import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.services.LoadStockQuoteOnlyRowMapper;
import com.quartz.qtrend.dom.services.ServicesHelper;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.spring.transactions.QTransactionCallback;
import com.quartz.qutilities.spring.transactions.QTransactionTemplate;
import com.quartz.qutilities.util.DateUtilities;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.transaction.TransactionStatus;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class StockQuoteDAO implements InitializingBean
{
    static private final ILog LOG = LogManager.getLogger(StockQuoteDAO.class);

    private static final String SQL_INSERT_STOCK =
            "INSERT INTO StockQuotes(ID, STOCKEXCHANGE, TICKER, PERIODSEQUENCE, DATE, TIME, OPEN, HIGH, LOW, CLOSE, PRICEDIFFERENCE, VOLUME, AVERAGEVOLUME) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String SQL_UPDATE_STOCK =
            "UPDATE StockQuotes " +
            "SET STOCKEXCHANGE=?, TICKER=?, PERIODSEQUENCE=?, DATE=?, TIME=?, " +
            "OPEN=?, HIGH=?, LOW=?, CLOSE=?, PRICEDIFFERENCE=?, VOLUME=?, AVERAGEVOLUME=?" +
            "WHERE ID=?;";
    private static final String SQL_SELECT_NEXT_ID = "select nextval('qtrendseq');";
    private static final String SQL_NEXT_SEQUENCE_FOR_EXCHANGE =
            "SELECT (MAX(PERIODSEQUENCE) + 1) AS NEXTSEQUENCE FROM STOCKQUOTES WHERE TICKER=?;";

    //  brand new way!
    private SimpleJdbcTemplate   jdbcTemplate = null;
    private QTransactionTemplate transactionTemplate = null;

    public StockQuoteDAO()
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

    public void afterPropertiesSet() throws Exception
    {
        if (jdbcTemplate == null) throw new IllegalStateException("JDBC Template not set.");
        if (transactionTemplate == null) throw new IllegalStateException("Transactio Template not set.");
    }

    public StockQuote loadStockQuoteOnly(ResultSet pResultSet, StockQuoteLoadContext pContext) 
    {
        try
        {
            return new LoadStockQuoteOnlyRowMapper().mapRow(pResultSet, 1);
        }
        catch (SQLException e)
        {
            throw new StockRuntimeException(e);
        }
    }

    public StockQuote insert(final StockQuote pStockQuote)
    {
        LOG.info("Inserting new StockQuote("
                 + pStockQuote.getTicker() + "/" + pStockQuote.getDate()
                 + ")...");

        return transactionTemplate.execute(new QTransactionCallback<StockQuote>()
        {
            public StockQuote doInTransaction(TransactionStatus status) throws Exception
            {
                final long pk = jdbcTemplate.queryForLong(SQL_SELECT_NEXT_ID);
                pStockQuote.setId(pk);

                final int nextPeriodSequence = jdbcTemplate.queryForInt(SQL_NEXT_SEQUENCE_FOR_EXCHANGE, pStockQuote.getTicker().toString());
                pStockQuote.setPeriodSequence(nextPeriodSequence);

                if (jdbcTemplate.update(
                        SQL_INSERT_STOCK,
                        pk,
                        pStockQuote.getStockExchange().toString(),
                        pStockQuote.getTicker().toString(),
                        pStockQuote.getPeriodSequence(),
                        DateUtilities.toJavaSqlDate(pStockQuote.getDate()),
                        pStockQuote.getTime(),
                        ServicesHelper.createSqlParameterValue(pStockQuote.getOpen()),
                        ServicesHelper.createSqlParameterValue(pStockQuote.getHigh()),
                        ServicesHelper.createSqlParameterValue(pStockQuote.getLow()),
                        ServicesHelper.createSqlParameterValue(pStockQuote.getClose()),
                        pStockQuote.getPriceDifference(),
                        pStockQuote.getVolume(),
                        pStockQuote.getAverageVolume()) != 1)
                {
                    throw new StockException("Could not insert ticker: " + pStockQuote.getTicker());
                }

                return pStockQuote;
            }
        });
    }

    public StockQuote update(StockQuote pStockQuote) throws StockException
    {
        LOG.info("Updating StockQuote: "
                 + pStockQuote.getTicker() + "/" + pStockQuote.getDate() + "/PK=" + pStockQuote.getId());

        if (jdbcTemplate.update(
                SQL_UPDATE_STOCK,
                pStockQuote.getStockExchange().toString(),
                pStockQuote.getTicker().toString(),
                pStockQuote.getPeriodSequence(),
                DateUtilities.toJavaSqlDate(pStockQuote.getDate()),
                pStockQuote.getTime(),
                ServicesHelper.createSqlParameterValue(pStockQuote.getOpen()),
                ServicesHelper.createSqlParameterValue(pStockQuote.getHigh()),
                ServicesHelper.createSqlParameterValue(pStockQuote.getLow()),
                ServicesHelper.createSqlParameterValue(pStockQuote.getClose()),
                pStockQuote.getPriceDifference(),
                pStockQuote.getVolume(),
                pStockQuote.getAverageVolume(),
                pStockQuote.getId()) != 1)
        {
            throw new StockException("Could not update stock!");
        }

        return pStockQuote;
    }

    /**
     * Saves the quote only
     * @param pStockQuote
     * @return
     * @throws StockException
     */
    public boolean saveQuoteOnly(StockQuote pStockQuote) throws StockException
    {
        if (pStockQuote.getId() < 0)
        {
            insert(pStockQuote);

            return true;
        }
        else
        {
            update(pStockQuote);

            return false;
        }
    }

}
