/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions.helpers;

import com.quartz.qtrend.QTrendConstants;
import com.quartz.qtrend.Signal;
import com.quartz.qtrend.dom.*;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qutilities.formatter.*;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.util.QUserProperties;
import com.quartz.qutilities.util.ToPercentString;

import javax.swing.*;
import java.util.*;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public abstract class AbstractEstimateProfitAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    static private final ILog LOG = LogManager.getLogger(AbstractEstimateProfitAction.class);

    protected static final String USERPROP_FALSE_SIGNAL_PERIOD = "estimate.profit.false.signal.period";

    static private final CellFormat  ESTIMATE_OBS_DATE   = new BeanUtilsCellFormat<ProfitEstimate>("OBS DATE", "obsDate", null, new CellPresentation(QTrendConstants.DATE_LENGTH));
    static private final CellFormat  ESTIMATE_OBS_PRICE  = new BeanUtilsCellFormat<ProfitEstimate>("OBS Price", "obsPrice", null, new CellPresentation(QTrendConstants.PRICE_LENGTH + 1));
    static private final CellFormat  ESTIMATE_OBS_RSI  = new BeanUtilsCellFormat<ProfitEstimate>("OBS RSI", "obs.langfordData.rsi.rsi", null, new CellPresentation(QTrendConstants.RSI_LENGTH + 1));
    static private final CellFormat  ESTIMATE_OSS_DATE   = new BeanUtilsCellFormat<ProfitEstimate>("OSS DATE", "ossDate", null, new CellPresentation(QTrendConstants.DATE_LENGTH));
    static private final CellFormat  ESTIMATE_OSS_PRICE  = new BeanUtilsCellFormat<ProfitEstimate>("OSS Price", "ossPrice", null, new CellPresentation(QTrendConstants.PRICE_LENGTH + 1));
    static private final CellFormat  ESTIMATE_OSS_RSI  = new BeanUtilsCellFormat<ProfitEstimate>("OSS RSI", "oss.langfordData.rsi.rsi", null, new CellPresentation(QTrendConstants.RSI_LENGTH + 1));
    static private final CellFormat  ESTIMATE_PROFIT     = new BeanUtilsCellFormat<ProfitEstimate>("% PROFIT", "percentProfit", new ToPercentString(2), new CellPresentation(QTrendConstants.PRICE_LENGTH));
    static private final CellFormat  ESTIMATE_NB_PERIODS = new BeanUtilsCellFormat<ProfitEstimate>("NB. PER.", "periodLength", null, new CellPresentation(6));
    static private final RowFormat<RegularProfitEstimate, RegularProfitEstimate> ESTIMATE_OBS_PROFIT_FORMAT = new SingleRowFormat<RegularProfitEstimate>(
            new CellFormat[] {
                ESTIMATE_OBS_DATE, ESTIMATE_OBS_PRICE, ESTIMATE_OBS_RSI,
                ESTIMATE_OSS_DATE, ESTIMATE_OSS_PRICE, ESTIMATE_OSS_RSI,
                ESTIMATE_PROFIT, ESTIMATE_NB_PERIODS
            });
    static private final RowFormat<SellShortProfitEstimate, SellShortProfitEstimate> ESTIMATE_OSS_PROFIT_FORMAT = new SingleRowFormat<SellShortProfitEstimate>(
            new CellFormat[] {
                ESTIMATE_OSS_DATE, ESTIMATE_OSS_PRICE, ESTIMATE_OSS_RSI,
                ESTIMATE_OBS_DATE, ESTIMATE_OBS_PRICE, ESTIMATE_OBS_RSI,
                ESTIMATE_PROFIT, ESTIMATE_NB_PERIODS
            });

    //  set by ctors
    private final Signal obsSignal;
    private final Signal ossSignal;
    //  set by spring
    protected QUserProperties userProperties;
    private StockQuoteListService stockQuotesService;
    //  set from frame
    protected QTrendFrame frame = null;
    private Output output = null;
    //  set by questions
    private Ticker ticker;
    protected int obsRsi = 100;   //for MACD only
    protected int ossRsi = 0;     //for MACD only
    private int falseSignal;

    protected AbstractEstimateProfitAction(Signal pObsSignal, Signal pOssSignal)
    {
        obsSignal = pObsSignal;
        ossSignal = pOssSignal;
    }

    public void setUserProperties(QUserProperties pUserProperties)
    {
        userProperties = pUserProperties;
    }

    public void setStockQuotesService(StockQuoteListService pStockQuotesService)
    {
        stockQuotesService = pStockQuotesService;
    }

    public void setFrame(QTrendFrame pQTrendFrame)
    {
        frame = pQTrendFrame;
        output = frame.getOutput();
    }

    protected boolean askQuestions()
    {
        ticker = ActionHelper.getSelectedTickerName(output);
        if (ticker == null)
        {
            ticker = ActionHelper.askTicker(frame);
            if (ticker == null) return false;
        }

        final String falseSignalStr = JOptionPane.showInputDialog(frame,
                                                             "False signal periods (1, 2, ...)?",
                                                             userProperties.getUserPropertyAsInt(USERPROP_FALSE_SIGNAL_PERIOD, 2));
        if (falseSignalStr == null) return false;
        falseSignal = Integer.parseInt(falseSignalStr.trim());
        userProperties.setUserProperty(USERPROP_FALSE_SIGNAL_PERIOD, String.valueOf(falseSignal));

        return true;
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        if (askQuestions() == false) return;

        output.clear();

        LOG.info("Estimating Profits/Loss for Ticker: "+ ticker);

        try
        {
            output.clear();

            showOBSs(ticker, obsRsi, falseSignal);
            showOSSs(ticker, ossRsi, falseSignal);

        }
        catch (StockException e1)
        {
            LOG.error("Could not estimate profits/loss", e1);
        }
        catch (FormatException e1)
        {
            LOG.error("Could not estimate profits/loss", e1);
        }
    }

    private void showOSSs(Ticker pTicker, final int pOssRsi, int pFalseSignalPeriod)
            throws StockException, FormatException
    {
        //  by OSS

        LOG.info("FOR OSS");
        LOG.info("-------");

        final List<StockQuote> obs = stockQuotesService.findAllObsSignals(pTicker, 100f, obsSignal);
        final List<StockQuote> oss = stockQuotesService.findAllOssSignals(pTicker, pOssRsi, ossSignal);

        if (obs.isEmpty() || oss.isEmpty())
        {
            output.writeln("No sufficient data for " + pTicker + " to estimate OSS (Sell High / Buy Low).");
        }
        else
        {
            final List<StockQuote> signals = buildSignals(obs, oss, pFalseSignalPeriod);
            estimateProfitSellHighBuyLow(signals);
        }
    }

    private void showOBSs(Ticker pTicker, final int pObsRsi, int pFalseSignalPeriod)
            throws StockException, FormatException
    {
        LOG.info("FOR OBS");
        LOG.info("-------");

        //  by OBS
        final List<StockQuote> obs = stockQuotesService.findAllObsSignals(pTicker, pObsRsi, obsSignal);
        final List<StockQuote> oss = stockQuotesService.findAllOssSignals(pTicker, 0, ossSignal);

        if (obs.isEmpty() || oss.isEmpty())
        {
            output.writeln("No sufficient data for " + pTicker + " to estimate OBS (Buy Low/Sell High).");
        }
        else
        {
            final List<StockQuote> signals = buildSignals(obs, oss, pFalseSignalPeriod);
            estimateProfitBuyLowSellHigh(signals);
        }
    }

    private List<StockQuote> buildSignals(List<StockQuote> pObs, List<StockQuote> pOss, int pFalseSignalPeriod) throws StockException
    {
        final StockQuoteList signals = new StockQuoteList();

        Collections.addAll(signals, pObs.toArray(new StockQuote[0]));
        Collections.addAll(signals, pOss.toArray(new StockQuote[0]));

        //  sort by date
        Collections.sort(signals, new Comparator<StockQuote>()
        {
            public int compare(StockQuote pStockQuote, StockQuote pStockQuote1)
            {
                return pStockQuote.getDate().compareTo(pStockQuote1.getDate());
            }
        });

        //  remove duplicate signals, e.g. OBS OSS OSS OBS OBS OSS becomes OBS, OSS, OBS, OSS
        StockQuote lastSignal = null;
        for (Iterator iterator = signals.iterator(); iterator.hasNext();)
        {
            StockQuote stockQuote = (StockQuote) iterator.next();

            LOG.info("Signal: " + stockQuote);

            if (lastSignal == null)
            {
                lastSignal = stockQuote;
            }
            else
            {
                final Signal lastQuoteSignal = lastSignal.getLangfordData().getSignal();
                final Signal currentQuoteSignal = stockQuote.getLangfordData().getSignal();
                if (lastQuoteSignal == currentQuoteSignal)
                {
                    //  duplicate signal
                    iterator.remove();
                }
                else
                {
                    //  signal changed
                    lastSignal = stockQuote;
                }
            }
        }

        //  remove false signals
        removeFalseSignals(signals, pFalseSignalPeriod);

        LOG.info("Next are signals found: ");
        for (StockQuote sq : signals) LOG.info("\t" + sq);

        return signals;
    }

    private StockQuoteList removeFalseSignals(final StockQuoteList pSignals, int pFalseSignalPeriod)
    {
        final StockQuoteList falseSignalsRemoved = new StockQuoteList();

        StockQuote pLastSignal = null;
        for (Iterator iterator = pSignals.iterator(); iterator.hasNext();)
        {
            StockQuote stockQuote = (StockQuote) iterator.next();
            if (pLastSignal == null)
            {
                pLastSignal = stockQuote;
                continue;
            }

            //final Period period = new Period(pLastSignal.getDate(), stockQuote.getDate(), PeriodType.days());
            //final int days = period.getDays();
            //if(days > Math.abs(pFalseSignalPeriod))
            if(Math.abs(stockQuote.getPeriodSequence() - pLastSignal.getPeriodSequence()) > pFalseSignalPeriod)
            {
                falseSignalsRemoved.add(pLastSignal);
                //  we keep
                pLastSignal = stockQuote;
            }
            else
            {
                //  both signals are false signals, we forget last and acual
                pLastSignal = null;
            }


        }

        if (pLastSignal != null) falseSignalsRemoved.add(pLastSignal);

        return falseSignalsRemoved;
    }

    private void estimateProfitBuyLowSellHigh(final List<StockQuote> pSignals)
            throws FormatException, StockException
    {
        StockQuote  obs = null;

        output.writeln("\n\nBUY LOW / SELL HIGH\n");

        output.writeln(ESTIMATE_OBS_PROFIT_FORMAT.formatTitle(true));

        float totalPercent = 0.0f;
        int totalPeriods = 0;
        int number = 0;

        for (StockQuote s : pSignals)
        {
            final Signal signal = s.getLangfordData().getSignal();

            if (signal == obsSignal)
            {
                obs = s;
            }
            else if (signal == ossSignal)
            {
                if (obs != null)
                {
                    final RegularProfitEstimate profitEstimate = new RegularProfitEstimate(obs, s);

                    totalPercent += profitEstimate.getPercentProfit();
                    totalPeriods += profitEstimate.getPeriodLength();
                    number++;

                    output.writeln(ESTIMATE_OBS_PROFIT_FORMAT.format(profitEstimate));

//                    printResult(obs.getDate().toString(), String.valueOf(obsPrice),
//                                s.getDate().toString(), String.valueOf(ossPrice),
//                                String.valueOf(toPercent(percent)),
//                                String.valueOf(periodLengh));

                    obs = null;
                }
            }
        }

        displayAverageResults(totalPercent, number, totalPeriods);
    }

    private void estimateProfitSellHighBuyLow(final List<StockQuote> pSignals)
            throws FormatException, StockException
    {
        StockQuote  oss = null;

        output.writeln("\n\nSELL HIGH / BUY LOW\n");

        output.writeln(ESTIMATE_OSS_PROFIT_FORMAT.formatTitle(true));

        float totalPercent = 0.0f;
        int totalPeriods = 0;
        int number = 0;

        for (StockQuote s : pSignals)
        {
            final Signal signal = s.getLangfordData().getSignal();

            if (signal == ossSignal)
            {
                oss = s;
            }
            else if (signal == obsSignal)
            {
                if (oss != null)
                {
                    final SellShortProfitEstimate profitEstimate = new SellShortProfitEstimate(oss, s);

                    totalPercent += profitEstimate.getPercentProfit();
                    totalPeriods += profitEstimate.getPeriodLength();
                    number++;

                    output.writeln(ESTIMATE_OSS_PROFIT_FORMAT.format(profitEstimate));

                    oss = null;
                }
            }
        }

        displayAverageResults(totalPercent, number, totalPeriods);
    }

    private void displayAverageResults(float pTotalPercent, int pNumber, int pTotalPeriods)
    {
        output.writeln("\n AVERAGE RESULT: " + new ToPercentString().toString(pTotalPercent / pNumber) + " in " + (pTotalPeriods / pNumber) + " periods in average.");
    }
}
