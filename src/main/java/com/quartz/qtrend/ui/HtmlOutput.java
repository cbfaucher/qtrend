/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.ui;

import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.util.Output;

import javax.swing.*;
import javax.swing.text.html.HTMLDocument;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class HtmlOutput extends JEditorPane implements Output
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final private HTMLDocument document;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public HtmlOutput()
    {
        super("text/html", "");

        setEditable(false);

        document = (HTMLDocument) this.getDocument();
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void setPosition(int pCharIndex)
    {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    public void write(String pText)
    {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    public void clear()
    {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    public void writeln(String pText)
    {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    public void writeln()
    {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
