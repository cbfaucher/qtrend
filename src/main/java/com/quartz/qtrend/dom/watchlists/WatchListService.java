/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.watchlists;

import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qutilities.spring.transactions.QTransactionCallback;
import com.quartz.qutilities.spring.transactions.QTransactionTemplate;
import com.quartz.qutilities.spring.transactions.QTransactionTemplateException;
import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.transaction.TransactionStatus;
import org.springframework.dao.EmptyResultDataAccessException;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Service methods for Watchlists.
 *
 * @author Christian
 * @since Quartz...
 */
public class WatchListService implements IWatchListService
{
    private static final String SQL_NEXT_WATCHLIST_PK = "select nextval('watchlistseq');";
    static private final String SQL_COUNT_WATCHLIST_NAME = "select count(name) as COUNT from watchlists where name=?;";
    static private final String SQL_INSERT_WATCHLIST = "insert into watchlists(id, name, description) values (?, ?, ?);";
    private static final String SQL_UPDATE_WATCHLIST = "update watchlists set name=?, description=? where id=?;";
    private static final String SQL_SELECT_WATCHLIST_BY_NAME = "select * from watchlists where name=?";
    private static final String SQL_SELECT_WATCHLIST_TICKERS = "select * from watchlisttickers where refid=? order by ticker;";
    private static final String SQL_DELETE_WATCHLIST_TICKERS = "delete from watchlisttickers where refid=?;";
    private static final String SQL_INSERT_WATCHLIST_TICKERS = "insert into watchlisttickers(refid, ticker) values (?, ?);";
    private static final String SQL_DELETE_WATCHLIST_BY_NAME = "delete from watchlists where name=?";
    private static final String SQL_DELETE_WATCHLIST_BY_ID = "delete from WatchLists where id=?;";
    private static final String SQL_SELECT_SINGLE_WATCHLIST_DESCRIPTION = "select description from watchlists where name=?;";

    private SimpleJdbcTemplate   jdbcTemplate = null;
    private QTransactionTemplate transactionTemplate = null;
    
    public WatchListService()
    {
    }

    public void setJdbcTemplate(SimpleJdbcTemplate pSimpleJdbcTemplate)
    {
        jdbcTemplate = pSimpleJdbcTemplate;
    }

    public void setTransactionTemplate(QTransactionTemplate pTransactionTemplate)
    {
        transactionTemplate = pTransactionTemplate;
    }

    public List<String> getWatchListNames()
    {
        return jdbcTemplate.query("select distinct name from watchlists order by name;",
                                  new StringRowMapper("name"));
    }

    public WatchList create(final String pName) throws DuplicateWatchlistNameException
    {
        try
        {
            return transactionTemplate.execute(new QTransactionCallback<WatchList>()
            {
                public WatchList doInTransaction(TransactionStatus status) throws DuplicateWatchlistNameException
                {
                    //  check if it exists
                    if (exists(pName) == true) throw new DuplicateWatchlistNameException(pName);

                    //  get next pk
                    final long pk = jdbcTemplate.queryForLong(SQL_NEXT_WATCHLIST_PK);

                    //  save
                    jdbcTemplate.update(SQL_INSERT_WATCHLIST, new Object[] {pk, pName, null});

                    return new WatchListImpl(pk, pName);
                }
            });
        }
        catch (QTransactionTemplateException e)
        {
            if (e.getCause() instanceof DuplicateWatchlistNameException) throw (DuplicateWatchlistNameException) e.getCause();
            else throw e;
        }
    }

    public WatchList load(final String pName) throws WatchListDoesNotExistException
    {
        if (pName == null) throw new IllegalArgumentException("Name not specified.");

        try
        {
            return transactionTemplate.execute(new QTransactionCallback<WatchList>()
            {
                public WatchList doInTransaction(TransactionStatus status) throws Exception
                {
                    //  first load watch list itself
                    final WatchListImpl watchList = (WatchListImpl)
                            jdbcTemplate.queryForObject(
                                    SQL_SELECT_WATCHLIST_BY_NAME,
                                    new ParameterizedRowMapper<WatchListImpl>()
                                    {
                                        public WatchListImpl mapRow(ResultSet rs, int rowNum) throws SQLException
                                        {
                                            return new WatchListImpl(
                                                    rs.getLong("id"),
                                                    StringUtils.trim(rs.getString("name")),
                                                    StringUtils.trim(rs.getString("description")));
                                        }
                                    },
                                    pName);

                    //  then load tickers...
                    jdbcTemplate.query(SQL_SELECT_WATCHLIST_TICKERS,
                                       new ParameterizedRowMapper<Ticker>() {
                                           public Ticker mapRow(ResultSet rs, int rowNum) throws SQLException
                                           {
                                               final Ticker ticker = new Ticker(rs.getString("ticker").trim());
                                               watchList.add(ticker);
                                               return ticker;
                                           }
                                       },
                                       watchList.getId());

                    return watchList;
                }
            });
        }
        catch (QTransactionTemplateException e)
        {
            if (e.getCause() instanceof WatchListDoesNotExistException) throw (WatchListDoesNotExistException) e.getCause();
            else if (e.getCause() instanceof EmptyResultDataAccessException) throw new WatchListDoesNotExistException(pName);
            else throw e;

        }
    }

    public boolean exists(String pWatchListName)
    {
        //  no need to txn: single operation
        return (jdbcTemplate.queryForInt(SQL_COUNT_WATCHLIST_NAME, new Object[] {pWatchListName}) > 0);
    }

    public void save(final WatchList pWatchList)
    {
        transactionTemplate.execute(new QTransactionCallback<Object>()
        {
            public Object doInTransaction(TransactionStatus status) throws Exception
            {
                jdbcTemplate.update(SQL_UPDATE_WATCHLIST, pWatchList.getName(), pWatchList.getDescription(), pWatchList.getId());

                //  delete actual tickers
                jdbcTemplate.update(SQL_DELETE_WATCHLIST_TICKERS, pWatchList.getId());

                //  then save tickers...
                for (Ticker t : pWatchList.getTickers())
                {
                    jdbcTemplate.update(SQL_INSERT_WATCHLIST_TICKERS, pWatchList.getId(), t.toString());
                }

                return null;
            }
        });
    }

    public void delete(WatchList pWatchList)
    {
        jdbcTemplate.update(SQL_DELETE_WATCHLIST_BY_ID, pWatchList.getId());
    }

    public void delete(String pName)
    {
        //  no need to txn: single operation
        jdbcTemplate.update(SQL_DELETE_WATCHLIST_BY_NAME, new Object[] {pName});
    }

    public String getDescription(String pWatchListName)
    {
        return jdbcTemplate.queryForObject(SQL_SELECT_SINGLE_WATCHLIST_DESCRIPTION,
                                           new StringRowMapper("description", ""),
                                           pWatchListName);
    }

}
