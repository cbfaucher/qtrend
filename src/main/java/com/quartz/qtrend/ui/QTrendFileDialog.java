/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.ui;

import com.quartz.qtrend.QTrendConstants;
import com.quartz.qtrend.QTrendBeanNames;
import com.quartz.qutilities.util.QUserProperties;

import javax.swing.*;
import java.io.File;
import java.awt.*;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class QTrendFileDialog extends JFileChooser
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final private QUserProperties userProperties;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public QTrendFileDialog()
    {
        userProperties = QTrendBeanNames.USER_PROPERTIES.getBean();
        this.setCurrentDirectory(new File(userProperties.getProperty(
                QTrendConstants.UserPropertyNames.USERPROP_IMPORT_DIRECTORY, System.getProperty("user.home"))));
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public int showOpenDialog(Component parent) throws HeadlessException
    {
        final int result = super.showOpenDialog(parent);

        if (result == JFileChooser.APPROVE_OPTION)
        {
            String directory = null;

            if (isMultiSelectionEnabled())
            {
                final File[] selectedFiles = getSelectedFiles();
                if (selectedFiles.length > 0) directory = selectedFiles[0].getParent();
            }
            else
            {
                if (getSelectedFile() != null)
                {
                    directory = getSelectedFile().getParent();
                }
            }

            userProperties.setProperty(QTrendConstants.UserPropertyNames.USERPROP_IMPORT_DIRECTORY, directory);
        }
        
        return result;


    }
    ///////////////////////////////////////
    ////    INNER CLASSES
}
