/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.watchlists;

import com.quartz.qtrend.TrendTestCase;
import com.quartz.qtrend.Bootstrap;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qutilities.logging.LogManager;
import junit.framework.Test;
import junit.framework.TestSuite;

import java.util.Collection;

/**
 * Unit Test cases for {@link WatchListService}
 *
 * @author lmcchbf
 * @since 30-May-2007
 */
public class WatchListServiceTest extends TrendTestCase
{
    static public final Test suite()
    {
        return new TestSuite(WatchListServiceTest.class);
    }	

    private WatchListService service;

    public WatchListServiceTest(String name)
    {
        super(name, true);
    }

    protected void setUp() throws Exception
    {
        LogManager.setLevel("org.springframework", "DEBUG");

        super.setUp();

        service = (WatchListService) Bootstrap.getApplicationcontext().getBean("QTrend.WatchListsService");
    }

    public void test_createLoad() throws Exception
    {
        service.delete(this.getName());

        try
        {
            assertEquals(false, service.exists(this.getName()));

            final WatchList watchList = service.create(this.getName());

            assertNotNull(watchList);

            assertEquals(true, service.exists(this.getName()));
            assertEquals(true, service.exists(watchList.getName()));

            //  now load
            final WatchList loaded = service.load(this.getName());
            assertNotNull(loaded);

            assertEquals(getName(), loaded.getName());
            assertEquals(null, loaded.getDescription());
            assertEquals(0, loaded.getTickers().size());
        }
        catch (Exception e)
        {
            e.printStackTrace(System.err);

            throw e;
        }
        finally
        {
            service.delete(this.getName());

            assertEquals(false, service.exists(this.getName()));
        }
    }

    public void test_saveWithTicker() throws Exception
    {
    	service.delete(this.getName());

        final WatchList wl = service.create(this.getName());

        wl.add(new Ticker("TBC.TO"));
        wl.add(new Ticker("YRI.TO"));
        wl.add(new Ticker("L.TO"));

        service.save(wl);

        final WatchList copy = service.load(this.getName());
        final Collection<Ticker> expectedTickers = wl.getTickers();
        final Collection<Ticker> actualTickers = copy.getTickers();
        assertEquals(expectedTickers, actualTickers);
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
