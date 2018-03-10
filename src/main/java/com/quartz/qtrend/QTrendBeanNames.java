/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend;

import com.quartz.qutilities.spring.BeanFactorySingleton;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public enum QTrendBeanNames
{
    PROPERTIES("QTrendProperties"),
    USER_PROPERTIES("QTrendUserProperties"),
    MAIN_FRAME("QTrendFrame"),
    EXCHANGE_RULE_MANAGER("QTrend.ImportRuleManager"),
    //todo: inject this dep.
    STOCK_QUOTE_LIST_SERVICE("QTrend.StockQuoteListService"),
    HTTP_PROXY("HTTP.Proxy"),
    YAHOO_SERVICE("QTrend.YahooService"),
    MAIL_OUTPUT("QTrend.MailOutput")
    ;

    final private String beanName;

    QTrendBeanNames(String pBeanName)
    {
        beanName = pBeanName;
    }

    public String getBeanName()
    {
        return beanName;
    }

    public <T>T getBean()
    {
        return (T) BeanFactorySingleton.getBean(beanName);
    }
}
