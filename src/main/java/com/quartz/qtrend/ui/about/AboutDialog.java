/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.ui.about;

import com.quartz.qutilities.swing.SwingUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class AboutDialog extends JDialog
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final private JTextArea text = new JTextArea();
    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public AboutDialog()
            throws HeadlessException, VersionInformationNotFoundException
    {
        setModal(true);
        setTitle("About QTrend...");
        addWindowListener(new WindowAdapter()
        {
            public void windowClosing(WindowEvent e)
            {
                close();
            }
        });

        getContentPane().setLayout(new BorderLayout(5, 5));

        //  text area
        text.setEditable(false);
        final Properties properties = loadVersionInfo();
        text.append("QTrend\n");
        text.append("======\n\n");
        text.append("Build Number: " + properties.getProperty("build.number"));
        text.append("\n\n");
        text.append("Database Schema Version: ");
        text.append(properties.getProperty("database.schema"));
        text.append("\n\n");
        text.append("Support: ");
        text.append(properties.getProperty("support.email"));
        text.append("\n\n");
        text.append("TODO: Copyrights");
        getContentPane().add(BorderLayout.CENTER, new JScrollPane(text));

        //  ok button
        final JPanel buttonPanel = new JPanel(new FlowLayout(FlowLayout.CENTER));
        final JButton okButton = new JButton();
        okButton.setText("Ok");
        okButton.setMnemonic(KeyEvent.VK_O);
        okButton.addActionListener(new ActionListener()
        {
            public void actionPerformed(ActionEvent e)
            {
                close();
            }
        });
        buttonPanel.add(okButton);
        getContentPane().add(BorderLayout.SOUTH, buttonPanel);

        //  size
        setSize(400, 300);
        SwingUtils.centerWindow(this);
    }

    private void close()
    {
        setVisible(false);
        dispose();
    }

    private Properties loadVersionInfo() throws VersionInformationNotFoundException
    {
        final Properties properties = new Properties();
        final InputStream is = getClass().getResourceAsStream("/src/main/resources/com.quartz.qtrend-version.properties");
        if (is == null) throw new VersionInformationNotFoundException();


        try
        {
            properties.load(is);
        }
        catch (IOException e)
        {
            throw new VersionInformationNotFoundException(e);
        }
        finally
        {
            try
            {
                is.close();
            }
            catch (IOException e)
            {
                //  silent
            }
        }

        return properties;
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    ///////////////////////////////////////
    ////    INNER CLASSES
}
