/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.ui.exchanges;

import javax.swing.*;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class ButtonPanel extends JPanel implements ActionListener
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    private ActionListener actionListener;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public ButtonPanel()
    {
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    void setActionListener(ActionListener pActionListener)
    {
        actionListener = pActionListener;
    }

    public void actionPerformed(ActionEvent e)
    {
        actionListener.actionPerformed(e);
    }

    public void setOkButton(JButton pButton)
    {
        pButton.addActionListener(this);
        add(pButton);
    }

    public void setCancelButton(JButton pButton)
    {
        pButton.addActionListener(this);
        add(pButton);
    }

    ///////////////////////////////////////
    ////    INNER CLASSES
}
