package com.quartz.qtrend.util;

import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.StockQuoteNavigator;
import lombok.RequiredArgsConstructor;
import lombok.val;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
public class SimpleStockQuoteNavigator implements StockQuoteNavigator
{
    final private java.util.List<StockQuote> quotes;

    public boolean supportsGetPreviousQuote()
    {
        return true;
    }

    public boolean supportsGetPreviousQuotes()
    {
        return true;
    }

    public StockQuote getPreviousQuote(StockQuote pThisStock) throws StockException
    {
        final int index = quotes.indexOf(pThisStock);
        return (index > 0 ? quotes.get(index - 1) : null);
    }

    public List<StockQuote> getPreviousQuotes(StockQuote pThisQuote, int pNbPrevious, boolean pIncludeMe) throws StockException
    {
        val index = pThisQuote.getPeriodSequence() - 1;
        val previousQuotes = new ArrayList<StockQuote>();

        if (index == 0)
        {
            if (pIncludeMe) previousQuotes.add(pThisQuote);
            return previousQuotes;
        }

        final int begin = (index < pNbPrevious
                           ? 0
                           : (pIncludeMe ? index - pNbPrevious + 1 : index - pNbPrevious));
        final int end = (pIncludeMe ? index : index - 1);

        for (int i = begin; i <= end; i++)
        {
            previousQuotes.add(quotes.get(i));
        }

        return previousQuotes;
    }
}
