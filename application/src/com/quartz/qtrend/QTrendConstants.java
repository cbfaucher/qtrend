/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend;

import com.quartz.qtrend.dom.AbstractStockQuote;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.exchanges.StockQuoteVariation;
import com.quartz.qtrend.dom.services.StockQuoteService;
import com.quartz.qutilities.formatter.*;
import com.quartz.qutilities.spring.BeanFactorySingleton;
import com.quartz.qutilities.util.ToPercentString;
import com.quartz.qutilities.util.ToString;

import java.util.List;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public interface QTrendConstants
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static final int DATE_LENGTH = 12;
    public static final int PRICE_LENGTH = 9;
    public static final int RSI_LENGTH = 10;

    static interface UserPropertyNames
    {
        String USERPROP_IMPORT_DIRECTORY = "import.current.directory";
        String USERPROP_OBS_MAX_RSI = "obs.maximum.rsi";
        String USERPROP_MINIMUM_VOLUME = "minimum.volume";
        String USERPROP_MINIMUM_PRICE = "minimum.price";
        String USERPROP_OSS_MINIMUM_RSI = "oss.minimum.rsi";
        String USERPROP_LAST_EXCHANGE = "last.exchange";
        String USERPROP_LAST_TICKER = "last.ticker";
        String USERPROP_MONTHS_BACK = "months.back";
        String USERPROP_LAST_MINIMUM_DROP = "last.minimum.drop";

        String USERPROP_WIDTH   = "last.width";
        String USERPROP_HEIGHT  = "last.height";
        String USERPROP_X       = "last.x" ;
        String USERPROP_Y       = "last.y" ;
        String USERPROP_LAST_NEXT_SIGNAL_DAYS = "last.many.days.ahead";
        String USERPROP_LAST_SINCE_DATE = "find.last.since.date";
        String USERPROP_ORDERED_ALERTS = "ordered.alerts";
    }

    static public final class Formats
    {
        static public final CellFormat  DATE        = new BeanUtilsCellFormat<AbstractStockQuote>("DATE", "date", null, new CellPresentation(DATE_LENGTH));
        static public final CellFormat  EXCHANGE    = new BeanUtilsCellFormat<AbstractStockQuote>("EXCHANGE", "stockExchange", null, new CellPresentation(10));
        static public final CellFormat  TICKER      = new BeanUtilsCellFormat<AbstractStockQuote>("TICKER", "ticker", null, new CellPresentation(12));
        static public final CellFormat  TICKER_NAME = new TickerNameCellFormat(new CellPresentation(40, CellPresentation.TruncationMode.abbreviate));
        static public final CellFormat  OPEN        = new BeanUtilsCellFormat<AbstractStockQuote>("OPEN", "open.price", null, new CellPresentation(PRICE_LENGTH));
        static public final CellFormat  HIGH        = new BeanUtilsCellFormat<AbstractStockQuote>("HIGH", "high.price", null, new CellPresentation(PRICE_LENGTH));
        static public final CellFormat  LOW         = new BeanUtilsCellFormat<AbstractStockQuote>("LOW", "low.price", null, new CellPresentation(PRICE_LENGTH));
        static public final CellFormat  CLOSE       = new BeanUtilsCellFormat<AbstractStockQuote>("CLOSE", "close.price", null, new CellPresentation(PRICE_LENGTH));
        static public final CellFormat  VOLUME      = new BeanUtilsCellFormat<AbstractStockQuote>("VOLUME", "volume", null, new CellPresentation(10));
        static public final CellFormat  AVERAGEVOLUME = new BeanUtilsCellFormat<AbstractStockQuote>("AVG VOLUME", "averageVolume", null, new CellPresentation(10));
        static public final CellFormat  RSI         = new BeanUtilsCellFormat<StockQuote>("RSI", "langfordData.rsi.rsi", null, new CellPresentation(RSI_LENGTH));
        static public final CellFormat  SIGNAL      = new BeanUtilsCellFormat<StockQuote>("SIGN", "langfordData.signal", null, new CellPresentation(5));
        static public final CellFormat  INCOMING_SIGNAL= new BeanUtilsCellFormat<StockQuote>("INC.SIGN", "langfordData.incomingSignal", new IncomingSignalDay(), new CellPresentation(PRICE_LENGTH));
        static public final CellFormat  VAR_EMA_56  = new BeanUtilsCellFormat<StockQuote>("%EMA56", "variation.diffEma56", new ToPercentString(2), new CellPresentation(PRICE_LENGTH));
        static public final CellFormat  VAR_EMA_112 = new BeanUtilsCellFormat<StockQuote>("%EMA112", "variation.diffEma112", new ToPercentString(2), new CellPresentation(PRICE_LENGTH));
        static public final CellFormat  VAR_1DAY    = new BeanUtilsCellFormat<StockQuote>("%VAR1D", "closeVariation1day", new ToPercentString(2), new CellPresentation(PRICE_LENGTH));
        static public final CellFormat  VAR_3DAY    = new BeanUtilsCellFormat<StockQuote>("%VAR3D", "closeVariation3days", new ToPercentString(2), new CellPresentation(PRICE_LENGTH));
        static public final CellFormat  VAR_7DAY    = new BeanUtilsCellFormat<StockQuote>("%VAR7D", "closeVariation7days", new ToPercentString(2), new CellPresentation(PRICE_LENGTH));
        static public final CellFormat  VAR_RSI     = new BeanUtilsCellFormat<StockQuote>("RSI", "rsi", null, new CellPresentation(RSI_LENGTH));


        static public final RowFormat<List<StockQuote>, StockQuote> DEFAULT_FORMAT
                = new MultipleRowsFormat<List<StockQuote>, StockQuote>(new CellFormat[] {
                    EXCHANGE, TICKER, TICKER_NAME, DATE, OPEN, HIGH, LOW, CLOSE, VOLUME, AVERAGEVOLUME, RSI, SIGNAL, INCOMING_SIGNAL});
        static public final RowFormat<List<StockQuote>, StockQuote> SHORT_FORMAT
                = new MultipleRowsFormat<List<StockQuote>, StockQuote>(new CellFormat[] {
                    DATE, TICKER, OPEN, HIGH, LOW, CLOSE, VOLUME, RSI, SIGNAL, INCOMING_SIGNAL});
        static public final RowFormat<List<StockQuote>, StockQuote> DEFAULT_FORMAT_WITH_EMA56_EMA112
                = new MultipleRowsFormat<List<StockQuote>, StockQuote>(
                        new CellFormat[] {DATE, EXCHANGE, TICKER, TICKER_NAME, CLOSE, VOLUME, RSI, VAR_EMA_56, VAR_EMA_112, SIGNAL, INCOMING_SIGNAL});
        static public final RowFormat<List<StockQuote>, StockQuote> TICKER_DEFAULT_FORMAT_WITH_EMA56_EMA112
                = new MultipleRowsFormat<List<StockQuote>, StockQuote>(
                        new CellFormat[] {DATE, OPEN, HIGH, LOW, CLOSE, VOLUME, AVERAGEVOLUME, RSI, VAR_EMA_56, VAR_EMA_112, SIGNAL, INCOMING_SIGNAL});
        static public final RowFormat<List<StockQuoteVariation>, StockQuoteVariation> PRICE_DROP_FORMAT
                = new MultipleRowsFormat<List<StockQuoteVariation>, StockQuoteVariation>(
                        new CellFormat[] {DATE, EXCHANGE, TICKER, TICKER_NAME, CLOSE, VOLUME, VAR_RSI, VAR_1DAY, VAR_3DAY, VAR_7DAY});

        private static class IncomingSignalDay implements ToString<Float>
        {

            public String toString(Float pObject)
            {
                final Float f = (Float) pObject;

                if (f == null) return "";


                if (f >= 0 && f <= 1)
                {
                    return "1 day";
                }
                else if (f <= 0 && f >= -1)
                {
                    return "-1 day";
                }
                else
                {
                    return ((int) Math.ceil(f)) + " days";
                }
            }
        }

    }

    static public class TickerNameCellFormat extends DynamicCellFormat<AbstractStockQuote>
    {
        final private StockQuoteService stockQuoteService;

        public TickerNameCellFormat(CellPresentation pCellPresentation)
        {
            super("NAME", null, pCellPresentation);

            stockQuoteService = BeanFactorySingleton.getBean("QTrend.StockQuoteService");
        }

        public String getCellContent(AbstractStockQuote pStockQuote) throws FormatException
        {
            return stockQuoteService.getTickerName(pStockQuote.getTicker());
        }
    }
}
