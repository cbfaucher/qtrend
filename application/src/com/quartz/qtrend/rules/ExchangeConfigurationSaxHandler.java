/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.rules;

import org.xml.sax.helpers.DefaultHandler;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.Attributes;
import org.apache.commons.lang.StringUtils;

import java.io.IOException;
import java.io.InputStream;

import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.rules.imports.PriceVsVolumeRatioRule;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
class ExchangeConfigurationSaxHandler extends DefaultHandler
{
    final private RuleManager     ruleManager;
    private ExchangeRules   currentExchange = null;
    private ITickerRule     currentTickerRule = null;

    ExchangeConfigurationSaxHandler(RuleManager pRuleManager)
    {
        ruleManager = pRuleManager;
    }

    /**
     * If the systemId is 'exchange-configuration.dtd', loads it from classpath.  Otherwise, returns null.
     */
    public InputSource resolveEntity(String publicId, String systemId) throws IOException, SAXException
    {
        if (systemId != null)
        {
            if (systemId.endsWith("exchange-configuration.dtd"))
            {
                final InputStream dtdIS = getClass().getResourceAsStream("/exchange-configuration.dtd");
                if (dtdIS != null)
                {
                    return new InputSource(dtdIS);
                }
            }
        }

        return super.resolveEntity(publicId, systemId);
    }

    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException
    {
        if (qName.equals("exchange-configuration"))
        {
            handleExchangeConfigurationElement();
        }
        else if (qName.equals("exchange"))
        {
            handleExchangeElement(attributes);
        }
        else if (qName.equals("includes"))
        {
            handleIncludesElement();
        }
        else if (qName.equals("excludes"))
        {
            handleExcludesElement();
        }
        else if (qName.equals("ticker"))
        {
            handleTickerElement(attributes);
        }
        else if (qName.equals("price-volume-ratio"))
        {
            handlePriceVolumeRatio(attributes);
        }
        else if (qName.equals("all"))
        {
            handleAllElement();
        }

    }

    private void handlePriceVolumeRatio(Attributes pAttributes) throws SAXException
    {
        final int capitalInvested = getAttributeAsInt(pAttributes, "average-capital-invested", 1000);
        final float threshold = getAttributeAsFloat(pAttributes, "threshold", 0.05f);

        final PriceVsVolumeRatioRule rule = new PriceVsVolumeRatioRule();
        rule.setCapitalInvested(capitalInvested);
        rule.setThreshold(threshold);

        currentExchange.setPriceVsVolumeRatioRule(rule);
    }

    private void handleAllElement()
    {
        currentTickerRule.setAll(true);
    }

    private void handleTickerElement(Attributes pAttributes)
    {
        final String ticker = pAttributes.getValue("ticker");
        if (StringUtils.isNotBlank(ticker))
        {
            currentTickerRule.addTicker(ticker);
        }
    }

    private void handleExcludesElement()
    {
        currentTickerRule = currentExchange.getExcludeTickersRule();
    }

    private void handleIncludesElement()
    {
        currentTickerRule = currentExchange.getIncludeTickersRule();
    }

    private void handleExchangeElement(Attributes pAttributes) throws SAXException
    {
        final String name = pAttributes.getValue("name");
        if (name == null) throw new SAXException("Exchange Name not specified!");

        final ExchangeRules exchangeRules = new ExchangeRules(new Ticker(name));

        final long minimumVolume = getAttributeAsLong(pAttributes, "minimum-volume", 0);
        exchangeRules.setMinimumVolume(minimumVolume);

        final float minimumPrice = getAttributeAsFloat(pAttributes, "minimum-price", 0.0f);
        exchangeRules.setMinimumPrice(minimumPrice);

        final float maximumPrice = getAttributeAsFloat(pAttributes, "maximum-price", Float.MAX_VALUE);
        exchangeRules.setMaximumPrice(maximumPrice);

        ruleManager.addExchange(exchangeRules);

        currentExchange = exchangeRules;
    }

    private float getAttributeAsFloat(Attributes pAttributes, final String pAttName, final float pDefaultValue) throws SAXException
    {
        try
        {
            final String str = pAttributes.getValue(pAttName);
            if (StringUtils.isBlank(str)) return pDefaultValue;
            return Float.valueOf(str);
        }
        catch (NumberFormatException e)
        {
            throw new SAXException(e);
        }
    }

    private long getAttributeAsLong(Attributes pAttributes, final String pAttName, final long pDefaultValue) throws SAXException
    {
        try
        {
            final String str = pAttributes.getValue(pAttName);
            if (StringUtils.isBlank(str)) return pDefaultValue;
            return Long.parseLong(str);
        }
        catch (NumberFormatException e)
        {
            throw new SAXException(e);
        }
    }

    private int getAttributeAsInt(Attributes pAttributes, final String pAttName, final int pDefaultValue) throws SAXException
    {
        try
        {
            final String str = pAttributes.getValue(pAttName);
            if (StringUtils.isBlank(str)) return pDefaultValue;
            return Integer.parseInt(str);
        }
        catch (NumberFormatException e)
        {
            throw new SAXException(e);
        }
    }

    private void handleExchangeConfigurationElement()
    {
        //  nothing to do!
    }

    public void endElement(String uri, String localName, String qName) throws SAXException
    {
        super.endElement(uri, localName, qName);    //To change body of overridden methods use File | Settings | File Templates.
    }
}
