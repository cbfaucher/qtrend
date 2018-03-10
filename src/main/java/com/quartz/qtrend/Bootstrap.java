/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend;

import org.springframework.context.support.GenericApplicationContext;
import org.springframework.beans.factory.xml.XmlBeanDefinitionReader;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import org.springframework.util.xml.XmlValidationModeDetector;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ClassPathResource;
import com.quartz.qutilities.spring.BeanFactorySingleton;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class Bootstrap
{
    private static final GenericApplicationContext applicationContext = new GenericApplicationContext();

    static public void destroy()
    {
        applicationContext.close();
    }

    public static void init(final QTrendMode pMode)
    {
        XmlBeanDefinitionReader reader = new XmlBeanDefinitionReader(applicationContext);

        //  todo: how do we do validation in Java7 ?!
        //reader.setValidationMode(XmlValidationModeDetector.VALIDATION_XSD);
        reader.loadBeanDefinitions(pMode.getBeansResources());

        //  QTrend properties
        PropertyPlaceholderConfigurer jdbcCfg = new PropertyPlaceholderConfigurer();
        jdbcCfg.setLocation(new ClassPathResource("/config/com.quartz.qtrend.properties"));
        jdbcCfg.postProcessBeanFactory(applicationContext.getBeanFactory());

        BeanFactorySingleton.setBeanFactory(applicationContext);
    }

    public static GenericApplicationContext getApplicationcontext()
    {
        return applicationContext;
    }
}
