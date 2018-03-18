/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.langford;

import com.quartz.qtrend.Signal;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.helpers.EMA;
import com.quartz.qtrend.dom.helpers.MACD;
import com.quartz.qtrend.dom.helpers.RSI;
import lombok.*;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
@RequiredArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
@Getter
@Setter //deprecated!
@EqualsAndHashCode(of = {"shortTermEma", "longTermEma", "rsi", "macd"})
public class LangfordDataImpl implements LangfordData
{
    final private StockQuote stockQuote;
    private RSI rsi;
    private EMA shortTermEma;
    private EMA longTermEma;
    private EMA ema56;
    private EMA ema112;
    private MACD macd;
    private String variation = "";
    private Signal signal = null;
    private Float incomingSignal = null;
}
