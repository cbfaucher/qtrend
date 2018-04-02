/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.watchlists;

import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qutilities.spring.transactions.QTransactionTemplateException;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Service methods for Watchlists.
 *
 * @author Christian
 * @since Quartz...
 */
@Component("QTrend.WatchListsService")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class WatchListService implements IWatchListService {

    //  todo: SQL
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

    private final JdbcTemplate jdbcTemplate;

    public List<String> getWatchListNames() {
        return jdbcTemplate.query("select distinct name from watchlists order by name;",
                                  new StringRowMapper("name"));
    }

    @Transactional
    public WatchList create(final String pName) throws DuplicateWatchlistNameException {
        try {
            //  check if it exists
            if (exists(pName)) throw new DuplicateWatchlistNameException(pName);

            //  get next pk
            final long pk = jdbcTemplate.queryForObject(SQL_NEXT_WATCHLIST_PK, Long.class);

            //  save
            jdbcTemplate.update(SQL_INSERT_WATCHLIST, pk, pName, null);

            return new WatchListImpl(pk, pName);
        } catch (QTransactionTemplateException e) {
            if (e.getCause() instanceof DuplicateWatchlistNameException)
                throw (DuplicateWatchlistNameException) e.getCause();
            else throw e;
        }
    }

    @Transactional
    public WatchList load(final String pName) throws WatchListDoesNotExistException {
        if (pName == null) throw new IllegalArgumentException("Name not specified.");

        try {
            //  first load watch list itself
            final WatchListImpl watchList = jdbcTemplate.queryForObject(
                    SQL_SELECT_WATCHLIST_BY_NAME,
                    (rs, rowNum) -> new WatchListImpl(
                            rs.getLong("id"),
                            StringUtils.trim(rs.getString("name")),
                            StringUtils.trim(rs.getString("description"))),
                    pName);

            //  then load tickers...
            jdbcTemplate.query(SQL_SELECT_WATCHLIST_TICKERS,
                               (rs, rowNum) -> {
                                   final Ticker ticker = new Ticker(rs.getString("ticker").trim());
                                   watchList.add(ticker);
                                   return ticker;
                               },
                               watchList.getId());

            return watchList;
        } catch (QTransactionTemplateException e) {
            if (e.getCause() instanceof WatchListDoesNotExistException)
                throw (WatchListDoesNotExistException) e.getCause();
            else if (e.getCause() instanceof EmptyResultDataAccessException)
                throw new WatchListDoesNotExistException(pName);
            else throw e;

        }
    }

    public boolean exists(String pWatchListName) {
        //  no need to txn: single operation
        return (jdbcTemplate.queryForObject(SQL_COUNT_WATCHLIST_NAME, Integer.class, pWatchListName) > 0);
    }

    @Transactional
    public void save(final WatchList pWatchList) {
        jdbcTemplate.update(SQL_UPDATE_WATCHLIST, pWatchList.getName(), pWatchList.getDescription(), pWatchList.getId());

        //  delete actual tickers
        jdbcTemplate.update(SQL_DELETE_WATCHLIST_TICKERS, pWatchList.getId());

        //  then save tickers...
        for (Ticker t : pWatchList.getTickers()) {
            jdbcTemplate.update(SQL_INSERT_WATCHLIST_TICKERS, pWatchList.getId(), t.toString());
        }
    }

    public void delete(WatchList pWatchList) {
        jdbcTemplate.update(SQL_DELETE_WATCHLIST_BY_ID, pWatchList.getId());
    }

    public void delete(String pName) {
        //  no need to txn: single operation
        jdbcTemplate.update(SQL_DELETE_WATCHLIST_BY_NAME, pName);
    }

    public String getDescription(String pWatchListName) {
        return jdbcTemplate.queryForObject(SQL_SELECT_SINGLE_WATCHLIST_DESCRIPTION,
                                           new StringRowMapper("description", ""),
                                           pWatchListName);
    }

}
