/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.graphs;

import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.aroon.Aroon;
import com.quartz.qtrend.dom.helpers.Price;
import com.quartz.qtrend.dom.langford.LangfordData;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.xy.DefaultOHLCDataset;
import org.jfree.data.xy.OHLCDataItem;
import org.jfree.data.xy.OHLCDataset;
import org.joda.time.YearMonthDay;

import java.awt.*;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
final public class GraphicFactory
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public GraphicFactory()
    {
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    static public JFreeChart createOpenHighLowCloseChart(java.util.List<StockQuote> pQuotes) throws GraphicFactoryException
    {
        OHLCDataItem[] items = new OHLCDataItem[pQuotes.size()];

        Price lowest = new Price(999999999f);
        Price highest = new Price(0.0f);

        int i = 0;
        for (StockQuote sq : pQuotes)
        {
            final YearMonthDay date = sq.getDate();
            if (date == null) throw new GraphicFactoryException("Null date?!?");
            final Price low = sq.getLow();
            final Price high = sq.getHigh();
            items[i++] = new OHLCDataItem(date.toDateMidnight().toDate(), sq.getOpen().price, high.price, low.price, sq.getClose().price, sq.getVolume());

            if (low.compareTo(lowest) < 0) lowest = low;
            if (high.compareTo(highest) > 0) highest = high;
        }

        final OHLCDataset dataset = new DefaultOHLCDataset("Prices", items);

        final JFreeChart highLowChart = ChartFactory.createHighLowChart("", "Date", "Prices", dataset, false);

        final XYPlot plot = highLowChart.getXYPlot();

        final ValueAxis valueAxis = plot.getRangeAxis();
        valueAxis.setVisible(true);
        valueAxis.setRange(Math.floor(lowest.price * 100f - 10)/100f, Math.ceil(highest.price * 100f + 10)/100f);

        return highLowChart;
    }

    //  todo: put this in Spring.
    static public JFreeChart createMacdChart(java.util.List<StockQuote> pQuotes) throws StockException
    {
        final CategoryDataset dataset = buildMacdDataSet(pQuotes);
        final JFreeChart chart = ChartFactory.createLineChart(
                "",
                "Date",
                "MACD",
                dataset,
                PlotOrientation.VERTICAL,
                false,   //  legend
                true,   //toolip
                true);

        chart.setBackgroundPaint(Color.white);

        final CategoryPlot plot = chart.getCategoryPlot();

        final CategoryAxis domainAxis = plot.getDomainAxis();
        domainAxis.setVisible(false);
        domainAxis.setMaximumCategoryLabelLines(5);
        domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_90);

        return chart;
    }

    static public JFreeChart createRsiChart(java.util.List<StockQuote> pQuotes) throws StockException
    {
        final CategoryDataset dataset = buildRsiDataSet(pQuotes);
        final JFreeChart chart = ChartFactory.createLineChart(
                "",
                "Date",
                "RSI",
                dataset,
                PlotOrientation.VERTICAL,
                false,   //  legend
                true,   //toolip
                true);

        chart.setBackgroundPaint(Color.white);

        final CategoryPlot plot = chart.getCategoryPlot();

        plot.getRangeAxis().setRange(0.0f, 100.0f);

        final CategoryAxis domainAxis = plot.getDomainAxis();
        domainAxis.setVisible(false);
        domainAxis.setMaximumCategoryLabelLines(5);
        domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_90);

        return chart;
    }

    static public JFreeChart createAroonChart(java.util.List<StockQuote> pQuotes, boolean pShortTerm) throws StockException
    {
        final CategoryDataset dataset = buildAroonDataSet(pQuotes, pShortTerm);

        final JFreeChart chart = ChartFactory.createLineChart(
                "",
                "Date",
                "Aroon Osc.",
                dataset,
                PlotOrientation.VERTICAL,
                true,   //  legend
                true,   //toolip
                true);

        chart.setBackgroundPaint(Color.white);

        final CategoryPlot plot = chart.getCategoryPlot();

        plot.getRangeAxis().setRange(-100.0f, 100.0f);

        final CategoryAxis domainAxis = plot.getDomainAxis();
        domainAxis.setVisible(true);
        domainAxis.setMaximumCategoryLabelLines(5);
        domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_90);

        return chart;
    }

    public static JFreeChart createEmaChart(java.util.List<StockQuote> pQuotes) throws StockException
    {
        final DefaultCategoryDataset dataset = new DefaultCategoryDataset();

//        final String closeCategory = "Close Price ($)";
        final String ema7Category = "EMA 7";
        final String ema28Category = "EMA 28";

        float min = 99999999;
        float max = 0;

        for (StockQuote sq : pQuotes)
        {
            final LangfordData langfordData = sq.getLangfordData();

//            final float price = sq.getClose().price;
            final float ema7 = langfordData.getShortTermEma().ema;
            final float ema28 = langfordData.getLongTermEma().ema;

//            if (price < min) min = price;
            if (ema7 < min) min = ema7;
            if (ema28 < min) min = ema28;

//            if (price > max) max = price;
            if (ema7 > max) max = ema7;
            if (ema28 > max) max = ema28;

//            dataset.addValue(price, closeCategory, sq.getDate());
            dataset.addValue(ema7, ema7Category, sq.getDate());
            dataset.addValue(ema28, ema28Category, sq.getDate());
        }

        final JFreeChart chart = ChartFactory.createLineChart(
                "",
                "Date",
                "EMA",
                dataset,
                PlotOrientation.VERTICAL,
                false,   //  legend
                true,   //toolip
                true);

        chart.setBackgroundPaint(Color.white);

        final CategoryPlot plot = chart.getCategoryPlot();

        final CategoryAxis domainAxis = plot.getDomainAxis();
        domainAxis.setVisible(false);
        domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_90);

        final ValueAxis valueAxis = plot.getRangeAxis();
        valueAxis.setRange(Math.floor(min * 100f - 10)/100f, Math.ceil(max * 100f + 10)/100f);        

        return chart;
    }

    static public JFreeChart createVolumeChart(java.util.List<StockQuote> pQuotes)
    {
        final DefaultCategoryDataset dataset = new DefaultCategoryDataset();

        for (StockQuote sq : pQuotes)
        {
            final long volume = sq.getVolume();

            dataset.addValue(volume, "Volume", sq.getDate());
        }

        final JFreeChart chart = ChartFactory.createBarChart(
                "",
                "Date",
                "Volume",
                dataset,
                PlotOrientation.VERTICAL,
                false,   //  legend
                true,   //toolip
                true);

        chart.setBackgroundPaint(Color.white);

        final CategoryPlot plot = chart.getCategoryPlot();

        final CategoryAxis domainAxis = plot.getDomainAxis();
        domainAxis.setVisible(false);
        domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_90);

        return chart;
    }


    static private CategoryDataset buildMacdDataSet(java.util.List<StockQuote> pQuotes) throws StockException
    {
        final String macdDifference = "MACD Diff.";
        final String macd = "MACD";

        final DefaultCategoryDataset dataset = new DefaultCategoryDataset();

        for (StockQuote sq : pQuotes)
        {
            final LangfordData langfordData = sq.getLangfordData();

            dataset.addValue(langfordData.getMacd().emaDifference, macdDifference, sq.getDate());
            dataset.addValue(langfordData.getMacd().macd, macd, sq.getDate());
        }

        return dataset;
    }

    static private CategoryDataset buildRsiDataSet(java.util.List<StockQuote> pQuotes) throws StockException
    {
        final String rsi = "RSI";
        final String lowLimit = "LOW";
        final String highLimit = "HIGH";

        final DefaultCategoryDataset dataset = new DefaultCategoryDataset();

        for (StockQuote sq : pQuotes)
        {
            final LangfordData langfordData = sq.getLangfordData();

//            dataset.addValue(langfordData.getRsi().getRsi(), macdDifference, sq.getDate());
            dataset.addValue(langfordData.getRsi().getRsi(), rsi, sq.getDate());
            dataset.addValue(30.0f, lowLimit, sq.getDate());
            dataset.addValue(70.0f, highLimit, sq.getDate());
        }

        return dataset;
    }

    static private CategoryDataset buildAroonDataSet(java.util.List<StockQuote> pQuotes, boolean pShortTerm) throws StockException
    {
        final String aroonUpKey = "Aroon UP(" + (pShortTerm ? "7" : "28") + ")";
        final String aroonDownKey = "Aroon DN(" + (pShortTerm ? "7" : "28") + ")";
        final String aroonOscillatorKey = "Aroon Osc.";

        final DefaultCategoryDataset dataset = new DefaultCategoryDataset();

        for (StockQuote sq : pQuotes)
        {
            final Aroon aroon = (pShortTerm ? sq.getAroonShortTerm() : sq.getAroonLongTerm());

            dataset.addValue(aroon.getAroonUp(), aroonUpKey, sq.getDate());
            dataset.addValue(aroon.getAroonDown(), aroonDownKey, sq.getDate());
            dataset.addValue(aroon.getOscillator(), aroonOscillatorKey, sq.getDate());
        }

        return dataset;
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
