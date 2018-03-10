/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.rules;

import org.springframework.beans.factory.FactoryBean;
import org.springframework.core.io.Resource;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;

import java.io.InputStream;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class RuleManagerFactory implements FactoryBean
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(RuleManagerFactory.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private Resource exchangeConfigurationResource = null;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public RuleManagerFactory()
    {
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setExchangeConfigurationResource(Resource pExchangeConfigurationResource)
    {
        LOG.info("Loading RuleManager from " + pExchangeConfigurationResource.getDescription());
        exchangeConfigurationResource = pExchangeConfigurationResource;
    }

    public Object getObject() throws Exception
    {
        if (exchangeConfigurationResource == null) throw new Exception("Exchange Configuration resource not specified!");

        final RuleManager ruleManager = new RuleManager();

        if (exchangeConfigurationResource.exists())
        {
            SAXParserFactory factory = SAXParserFactory.newInstance();
            factory.setValidating(true);
            SAXParser saxParser = factory.newSAXParser();
            final InputStream is = exchangeConfigurationResource.getURL().openStream();
            saxParser.parse(is, new ExchangeConfigurationSaxHandler(ruleManager));
        }
        else
        {
            LOG.warn(exchangeConfigurationResource.getDescription() + " is not found!  Perhaps you should createSqlParameterValue it?\nSee conf/exchange-configuration-template.xml for startup!");
        }

        return ruleManager;
    }

    public Class getObjectType()
    {
        return RuleManager.class;
    }

    public boolean isSingleton()
    {
        return true;
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
