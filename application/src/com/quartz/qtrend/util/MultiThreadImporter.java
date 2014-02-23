/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.util;

import com.quartz.qutilities.io.FileUtilities;
import com.quartz.qutilities.jobrunner.DefaultJob;
import com.quartz.qutilities.jobrunner.JobList;
import com.quartz.qutilities.jobrunner.JobRunner;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.util.MessageHandler;
import com.quartz.qutilities.util.Output;

import java.io.*;
import java.util.List;

/**
 *
 *
 * @author Christian
 * @since Quartz...
 */
public class MultiThreadImporter implements Importer
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(MultiThreadImporter.class);

    ///////////////////////////////////////
    ////    STATIC METHODS

    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final private JobRunner     jobRunner;
    final private int           numberOfBatches;
    final private LineParser lineParser;

    private Progress  progress;
    private Output output;
    boolean ignoreFirstLine = false;

    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public MultiThreadImporter(LineParser pLineParser, JobRunner pJobRunner, int pNumberOfBatches, boolean pIgnoreFirstLine, Output pOutput, Progress pProgress)
    {
        jobRunner = pJobRunner;
        numberOfBatches = pNumberOfBatches;
        lineParser = pLineParser;
        ignoreFirstLine = pIgnoreFirstLine;
        output = pOutput;
        progress = pProgress;
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public Progress getProgress()
    {
        return progress;
    }

    public void setProgress(Progress pProgress)
    {
        progress = pProgress;
    }

    public void setOutput(Output pOutput)
    {
        output = pOutput;
    }

    public Output getOutput()
    {
        return output;
    }

    public boolean isIgnoreFirstLine()
    {
        return ignoreFirstLine;
    }

    public void setIgnoreFirstLine(boolean pIgnoreFirstLine)
    {
        ignoreFirstLine = pIgnoreFirstLine;
    }

    public void importFile(File pFileToImport) throws ImporterException
    {
        final File successDir = new File(pFileToImport.getParent(), "success");
        if (successDir.exists() == false) successDir.mkdirs();

        BufferedWriter errorWriter = null;

        try
        {
            errorWriter = new BufferedWriter(openErrorEntryWriter(pFileToImport));

            if (progress != null)
            {
                progress.setText("Importing " + pFileToImport.getName() + "...");
            }

            final File selectedFile = pFileToImport;

            final List<String> lines = FileUtilities.loadFile(selectedFile);

            if(ignoreFirstLine) lines.remove(0);

            //  reset progress bar
            progress.setMinMax(0, lines.size());
            progress.reset();

            final int range = lines.size() / numberOfBatches;

            final JobList jobs = new JobList();

            for (int i = 0; i < numberOfBatches; i++)
            {
                final int min = i * range;
                final int max = (i == (numberOfBatches - 1) ? lines.size() : (i+1) * range);

                jobRunner.runJob(new ImportTask(jobs, lineParser, lines, min, max, errorWriter));
            }

            jobs.waitForJobs();

            output.writeln("File " + pFileToImport.getName() + " IMPORTED.");
        }
        catch (IOException e)
        {
            LOG.error("I/O Error!   Could not loadStockQuoteOnly " + pFileToImport.getAbsolutePath(), e);
        }
        catch (InterruptedException e)
        {
            LOG.error("Interrupted!  Could not loadStockQuoteOnly " + pFileToImport.getAbsolutePath(), e);
        }
        finally
        {
            pFileToImport.renameTo(
                    new File(successDir, pFileToImport.getName()));

            if (errorWriter != null)
            {
                try
                {
                    errorWriter.flush();
                    errorWriter.close();
                }
                catch (IOException e)
                {
                    LOG.warn("Could not saveQuoteOnly the ERROR logs...");
                }
            }
        }
    }

    private Writer openErrorEntryWriter(File pSelectedFile) throws IOException
    {
        final File directory = new File(pSelectedFile.getParent(), "errors");
        if (directory.exists() == false)
        {
            if (directory.mkdirs() == false) throw new IOException("Could not createSqlParameterValue Errors directory!");
        }

        return new FileWriter(new File(directory, pSelectedFile.getName() + ".errors.csv"));
    }


    ///////////////////////////////////////
    ////    INNER CLASSES

    private class ImportTask extends DefaultJob
    {
        final private JobList jobList;
        final private LineParser lineParser;
        final private List<String> lines;
        final private int start;
        final private int end;
        final private BufferedWriter errorWriter;

        ImportTask(JobList pJobList, LineParser pLineParser, List<String> pLines, int pStart, int pEnd, BufferedWriter pErrorWriter)
        {
            jobList = pJobList;

            jobList.add(this);

            lineParser = pLineParser;
            lines = pLines;
            start = pStart;
            end = pEnd;
            errorWriter = pErrorWriter;
        }

        public Object runJob() throws Exception
        {

            for (int i = start; i < end; i++)
            {
                final String line = lines.get(i).trim();

                try
                {
                    lineParser.parseLine(line);
                }
                catch (LineParserException e)
                {
                    try
                    {
                        errorWriter.write(line + "\n");
                    }
                    catch (IOException e1)
                    {
                        //  fuck it
                    }
                }
            }

            return null;
        }

        public void onFinally()
        {
            jobList.remove(this);
        }
    }
}
