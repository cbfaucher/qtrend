/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
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
public class StockRuntimeException extends RuntimeException
{
    public StockRuntimeException(String message)
    {
        super(message);
    }

    public StockRuntimeException(String message, Throwable cause)
    {
        super(message, cause);
    }

    public StockRuntimeException(Throwable cause)
    {
        super(cause);
    }
}
