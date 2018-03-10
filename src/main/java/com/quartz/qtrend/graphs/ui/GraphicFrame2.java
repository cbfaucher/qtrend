/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.graphs.ui;

import com.quartz.qtrend.dom.StockException;
import com.quartz.qtrend.dom.StockQuote;
import com.quartz.qtrend.dom.helpers.Ticker;
import com.quartz.qtrend.graphs.GraphicFactory;
import com.quartz.qtrend.graphs.GraphicFactoryException;
import com.quartz.qutilities.swing.SwingUtils;
import com.quartz.qutilities.swing.events.QEventActionListener;
import com.quartz.qutilities.swing.events.QEventFrame;
import com.quartz.qutilities.swing.events.QEventManager;
import com.quartz.qutilities.swing.menus.XmlMenuBar;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.xml.sax.SAXException;

import javax.swing.*;
import java.awt.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.IOException;
import java.net.URL;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class GraphicFrame2 extends JFrame implements QEventFrame
{
    private final XmlMenuBar    menuBar;
    private final GridBagLayout layout = new GridBagLayout();
    private final JFreeChart ohlcChart;
    private final JFreeChart volumeChart;
    private final JFreeChart macdChart;
    private final JFreeChart rsiChart;
    private final JFreeChart emaChart;

    private final QEventManager eventManager;
    private final java.util.List<StockQuote> quotes;

    public GraphicFrame2(Ticker pExchange, Ticker pTicker, String pTickerName, java.util.List<StockQuote> pQuotes, QEventManager pEventManager)

            throws HeadlessException, GraphicFactoryException, StockException
    {
        super(pTickerName + " (" + pTicker + " @ " + pExchange + ")");

        quotes = pQuotes;
        eventManager = pEventManager;

        getContentPane().setLayout(new BorderLayout());

        try
        {
            final URL menuResUrl = getClass().getResource("/src/main/java/com.quartz.qtrend/graphs/ui/graphicsframe-menubar.xml");
            if (menuResUrl == null) throw new IOException("QTrend Menu Resource not found.");
            menuBar = XmlMenuBar.load(menuResUrl,
                                      new QEventActionListener(this), false);
            setJMenuBar(menuBar);
        }
        catch (IOException e)
        {
            throw new GraphicFactoryException(e);
        }
        catch (SAXException e)
        {
            throw new GraphicFactoryException(e);
        }


        addWindowListener(new WindowAdapter()
        {
            public void windowClosing(WindowEvent e)
            {
                close();
            }
        });

        ohlcChart = GraphicFactory.createOpenHighLowCloseChart(pQuotes);
        volumeChart = GraphicFactory.createVolumeChart(pQuotes);
        macdChart = GraphicFactory.createMacdChart(pQuotes);
        rsiChart = GraphicFactory.createRsiChart(pQuotes);
        emaChart = GraphicFactory.createEmaChart(pQuotes);

        int row = 0;

        final JPanel graphs = new JPanel(layout);
        graphs.add(getPanel(rsiChart, 0.125, row++));
        graphs.add(getPanel(ohlcChart, 0.50, row++));
        graphs.add(getPanel(emaChart, 0.125, row++));
        graphs.add(getPanel(volumeChart, 0.125, row++));
        graphs.add(getPanel(macdChart, 0.125, row++));
        getContentPane().add(BorderLayout.CENTER, graphs);

        SwingUtils.resizeWindow(this, 0.75f, 0.9f);

        SwingUtils.centerWindow(this);
    }

    java.util.List getQuotes()
    {
        return quotes;
    }

    public JFrame getFrame()
    {
        return this;
    }

    public QEventManager getEventManager()
    {
        return eventManager;
    }

    private JPanel getPanel(JFreeChart pChart, final double pRatio, int pRow)
    {
        final ChartPanel panel = new ChartPanel(pChart,
                                                true,
                                                true,
                                                true,
                                                true,
                                                true);
        //final Dimension size = getSize();
        //panel.setMinimumSize(new Dimension(size.width, (int)(size.height * pRatio)));
        //panel.setPreferredSize(new Dimension(size.width, (int)(size.height * pRatio)));

        final GridBagConstraints gbc = new GridBagConstraints();
        gbc.anchor = GridBagConstraints.NORTHWEST;
        gbc.gridx = 0;
        gbc.gridy = pRow;
        gbc.weightx = 1.0;
        gbc.weighty = pRatio;
        gbc.fill = GridBagConstraints.BOTH;

        layout.setConstraints(panel, gbc);

        return panel;
    }

    void close()
    {
        setVisible(false);
        this.dispose();
    }
}
