/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.ui.menus;

import javax.swing.*;
import javax.swing.text.JTextComponent;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.StringSelection;
import java.awt.*;

/**
 * popup menu for the logging area
 *
 * @author Christian
 * @since Quartz...
 */
public class LoggingPopupMenu extends JPopupMenu
{
    private JTextComponent loggingComponent;

    public LoggingPopupMenu(final JTextComponent pComponent)
    {
        super("Logging");

        loggingComponent = pComponent;

        final JMenuItem copyMI = new JMenuItem();
        copyMI.setText("Copy");
        copyMI.setMnemonic('C');
        copyMI.addActionListener(new CopyAction());
        add(copyMI);

        final JMenuItem selectAllMI = new JMenuItem();
        selectAllMI.setText("Select All");
        selectAllMI.setMnemonic('A');
        selectAllMI.addActionListener(new SelectAllAction());
        add(selectAllMI);

        addSeparator();

        final JMenuItem clearMI = new JMenuItem();
        clearMI.setText("Clear");
        clearMI.setMnemonic('C');
        clearMI.addActionListener(new ClearAction());
        add(clearMI);
    }

    private class ClearAction implements ActionListener
    {
        public void actionPerformed(ActionEvent e)
        {
            loggingComponent.setText("");
        }
    }

    private class SelectAllAction implements ActionListener
    {
        public void actionPerformed(ActionEvent e)
        {
            loggingComponent.selectAll();
        }
    }

    private class CopyAction implements ActionListener
    {
        public void actionPerformed(ActionEvent e)
        {
            final String text = loggingComponent.getSelectedText();
            final Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
            final StringSelection contents = new StringSelection(text);
            clipboard.setContents(contents, contents);
        }
    }
}
