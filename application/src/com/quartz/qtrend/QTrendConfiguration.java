/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class QTrendConfiguration
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static public interface LangfordConfiguration
    {
        int RSI_PERIOD = 14;
        EMAConfiguration SHORT_TERM_EMA_PERIOD = new EMAConfiguration(7);
        EMAConfiguration LONG_TERM_EMA_PERIOD = new EMAConfiguration(28);
        MACDConfiguration MACD_PERIOD = new MACDConfiguration(7, 28, 7);
    }

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    static private int maximumTickerNameLength = 65;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    ///////////////////////////////////////
    ////    INNER CLASSES

    static public class MACDConfiguration
    {
        final public EMAConfiguration shortTermPeriod;
        final public EMAConfiguration longTermPeriod;
        final public EMAConfiguration averagePeriod;

        public MACDConfiguration(int pSt, int pLt, int pAvg)
        {
            shortTermPeriod = new EMAConfiguration(pSt);
            longTermPeriod = new EMAConfiguration(pLt);
            averagePeriod = new EMAConfiguration(pAvg);
        }
    }

    static public class EMAConfiguration
    {
        final public int period;
        public final float alpha;
        public final float beta;

        public EMAConfiguration(int pPeriod)
        {
            period = pPeriod;
            alpha = 2.0f / (1 + period);
            beta = 1 - alpha;
        }

        public boolean equals(Object o)
        {
            if (this == o) return true;
            if (!(o instanceof EMAConfiguration)) return false;

            final EMAConfiguration emaConfiguration = (EMAConfiguration) o;

            if (alpha != emaConfiguration.alpha) return false;
            if (beta != emaConfiguration.beta) return false;
            if (period != emaConfiguration.period) return false;

            return true;
        }

        public int hashCode()
        {
            int result;
            result = period;
            result = 29 * result + alpha != +0.0f ? Float.floatToIntBits(alpha) : 0;
            result = 29 * result + beta != +0.0f ? Float.floatToIntBits(beta) : 0;
            return result;
        }

        public String toString()
        {
            return "EMAConfiguration{" +
                    "period=" + period +
                    ", alpha=" + alpha +
                    ", beta=" + beta +
                    "}";
        }
    }
}
