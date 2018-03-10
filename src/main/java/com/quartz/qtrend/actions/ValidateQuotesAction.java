/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.actions;

import com.quartz.qtrend.dom.ValidationMessage;
import com.quartz.qtrend.dom.services.StockQuoteListService;
import com.quartz.qtrend.ui.QTrendFrame;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.swing.events.JFrameAware;
import com.quartz.qutilities.swing.events.QEventHandler;
import com.quartz.qutilities.swing.events.QEventManager;
import com.quartz.qutilities.util.Output;

import java.util.EventObject;
import java.util.List;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class ValidateQuotesAction implements QEventHandler, JFrameAware<QTrendFrame>
{
    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private StockQuoteListService stockQuotesService;
    private QTrendFrame frame = null;
    private Output output = null;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public ValidateQuotesAction()
    {

    }
    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setStockQuotesService(StockQuoteListService pStockQuotesService)
    {
        stockQuotesService = pStockQuotesService;
    }

    public void setFrame(QTrendFrame pQTrendFrame)
    {
        frame = pQTrendFrame;
        output = frame.getOutput();
    }

    public void handleEvent(QEventManager pEventManager, EventObject pEvent, String pCommand)
    {
        output.clear();

        final List<ValidationMessage> messages = stockQuotesService.validate();

        if (messages.size() > 0)
        {
            output.writeln("Errors found!");
            output.writeln("-------------");

            for (ValidationMessage m : messages)
            {
                output.writeln(m.toString());
            }
        }
        else
        {
            output.writeln("Nothing to say!");
        }
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
