/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.watchlists;

import com.quartz.qtrend.dom.helpers.Ticker;
import lombok.val;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.stream.Collectors;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

/**
 * Unit Test cases for {@link WatchListService}
 *
 * @author lmcchbf
 * @since 30-May-2007
 */
@SpringBootTest(classes = WatchListServiceTestApplication.class)
@RunWith(SpringJUnit4ClassRunner.class)
public class WatchListServiceTest
{
    @Autowired
    private WatchListService service;

    @org.junit.Test
    public void createLoad() throws Exception
    {
        val ticker = "TEST";

        service.delete(ticker);

        try {
            val watchList = service.create(ticker);

            assertNotNull(watchList);

            assertEquals(true, service.exists(ticker));
            assertEquals(true, service.exists(watchList.getName()));

            //  now load
            val loaded = service.load(ticker);
            assertNotNull(loaded);

            assertEquals(ticker, loaded.getName());
            assertEquals(null, loaded.getDescription());
            assertEquals(0, loaded.getTickers().size());
        } finally {
            service.delete(ticker);
        }
    }

    @org.junit.Test
    public void test_saveWithTicker() throws Exception
    {
        val ticker = "TEST";

    	service.delete(ticker);

        final WatchList wl = service.create(ticker);

        wl.add(new Ticker("TBC.TO"));
        wl.add(new Ticker("YRI.TO"));
        wl.add(new Ticker("L.TO"));

        service.save(wl);

        final WatchList copy = service.load(ticker);
        val expectedTickers = wl.getTickers().stream().sorted().collect(Collectors.toList());
        val actualTickers = copy.getTickers().stream().sorted().collect(Collectors.toList());
        assertEquals(expectedTickers, actualTickers);
    }
}
