/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.util;

import com.quartz.qtrend.ui.ProgressDialog;
import com.quartz.qutilities.util.Output;

import java.io.File;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class ImporterContext
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final public File           fileToImport;
    final public boolean        ignoreFirstLine;
    final public Output         output;
    final public ProgressDialog progressDialog;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public ImporterContext(File pFileToImport, boolean pIgnoreFirstLine, ProgressDialog pProgressDialog, Output pOutput)
    {
        fileToImport = pFileToImport;
        ignoreFirstLine = pIgnoreFirstLine;
        progressDialog = pProgressDialog;
        output = pOutput;
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    ///////////////////////////////////////
    ////    INNER CLASSES
}
