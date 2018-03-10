/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.tasks;

import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.util.QProperties;
import org.joda.time.YearMonthDay;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class MailOutput implements Output, InitializingBean
{
    private QProperties properties;
    private MailSender  mailSender;
    private SimpleMailMessage mailTemplate;

    private StringBuffer buffer = new StringBuffer();

    public MailOutput()
    {
    }

    public void setMailSender(MailSender pMailSender)
    {
        mailSender = pMailSender;
    }

    public void setMailTemplate(SimpleMailMessage pMailTemplate)
    {
        mailTemplate = pMailTemplate;
    }

    public void afterPropertiesSet() throws Exception
    {
        if (mailSender == null) throw new IllegalStateException("MailSender not set.");
        if (mailTemplate == null) throw new IllegalStateException("Mail Template not set.");
    }

    public void write(String pText)
    {
        buffer.append(pText);
    }

    public void writeln(String pText)
    {
        buffer.append(pText).append("\n");
    }

    public void writeln()
    {
        buffer.append("\n");
    }

    public void clear()
    {
        buffer = new StringBuffer();
    }

    public void selectAll()
    {
        throw new UnsupportedOperationException();
    }

    public String getSelectedText()
    {
        throw new UnsupportedOperationException();
    }

    public void setPosition(int pCharIndex)
    {
        throw new UnsupportedOperationException();
    }

    public void send()
    {
        // Create a thread safe "copy" of the template message and customize it
        SimpleMailMessage msg = new SimpleMailMessage(this.mailTemplate);
        //msg.setTo(order.getCustomer().getEmailAddress());
        msg.setSubject("QTrend Alerts - " + new YearMonthDay());
        msg.setText(buffer.toString());
        this.mailSender.send(msg);
    }
}
