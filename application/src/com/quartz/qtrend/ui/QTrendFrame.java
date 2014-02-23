/*
 * Copyright (c) 2006 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.ui;

import com.quartz.qtrend.QTrendConstants;
import com.quartz.qtrend.ui.menus.LoggingPopupMenu;
import com.quartz.qutilities.logging.ILog;
import com.quartz.qutilities.logging.LogManager;
import com.quartz.qutilities.swing.TextAreaAppender;
import com.quartz.qutilities.swing.events.QEventActionListener;
import com.quartz.qutilities.swing.events.QEventFrame;
import com.quartz.qutilities.swing.menus.XmlMenuBar;
import com.quartz.qutilities.swing.spring.SpringFrame;
import com.quartz.qutilities.util.MessageHandler;
import com.quartz.qutilities.util.Output;
import com.quartz.qutilities.util.QUserProperties;
import org.xml.sax.SAXException;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.io.IOException;
import java.net.URL;
import java.util.EventObject;
import java.util.HashSet;
import java.util.Set;

/**
 * The QTrend main frame...
 *
 * @author Christian
 * @since Quartz...
 */
public class QTrendFrame extends SpringFrame implements QEventFrame
{
    ///////////////////////////////////////
    ////    STATIC ATTRIBUTES

    static private final ILog LOG = LogManager.getLogger(QTrendFrame.class);

    static private final Set<QTrendFrame> allFrames = new HashSet<QTrendFrame>();
    private JSplitPane splitPane;
    private static final String USERPROP_DIVIDER_LOCATION = "qtrend.divider.location";
    private TextAreaAppender log4jAppender;

    ///////////////////////////////////////
    ////    STATIC METHODS

    public static Set<QTrendFrame> getAllFrames()
    {
        return allFrames;
    }
    
    ///////////////////////////////////////
    ////    INSTANCE ATTRIBUTES

    final private int myCount;

    private TextAreaOutput  logger;
    private MessageHandler  messageHandler;

    private QUserProperties userProperties = null;

    private JMenuBar menuBar;


    ///////////////////////////////////////
    ////    CONSTRUCTORS

    public QTrendFrame() throws HeadlessException, IOException
    {
        super();

        final String iconRes = "/com/quartz/qtrend/ui/qtrend.jpg";
        final URL iconUrl = getClass().getResource(iconRes);
        if (iconUrl != null) setIconImage(ImageIO.read(iconUrl));
        else
        {
            LOG.warn("Could not find icon image: " + iconRes);
        }
        setTitle("QTrend Frame");
        addWindowListener(new QTrendWindowListener(this));

        getContentPane().setLayout(new BorderLayout(5, 5));

       //  note: menu bar set at init-method time to give time to spring to set the EventManager!

        allFrames.add(this);

        myCount = allFrames.size();
    }

    ///////////////////////////////////////
    ////    INSTANCE METHODS

    public void init() throws IOException, SAXException
    {
        //  menu bar
        //menuBar = new QTrendMenuBar(this);
        final URL menuResUrl = getClass().getResource("/com/quartz/qtrend/ui/menus/QTrend-menuBar2.xml");
        if (menuResUrl == null) throw new IOException("QTrend Menu Resource not found.");
        menuBar = XmlMenuBar.load(menuResUrl,
                                  new QEventActionListener(this), false);
        setJMenuBar(menuBar);

        logger = new TextAreaOutput(this);

        //  output area
/*
        splitPane = new JSplitPane(JSplitPane.VERTICAL_SPLIT,
                                   new JScrollPane(logger),
                                   new JScrollPane((Component) messageHandler));
*/
        final JTextArea loggingOutput = new JTextArea();
        loggingOutput.setEditable(false);
        loggingOutput.setComponentPopupMenu(new LoggingPopupMenu(loggingOutput));
        splitPane = new JSplitPane(JSplitPane.VERTICAL_SPLIT,
                                   new JScrollPane(logger),
                                   new JScrollPane(loggingOutput));
        log4jAppender = new TextAreaAppender(loggingOutput, "com.quartz", false);


        getContentPane().add(splitPane, BorderLayout.CENTER);
    }

    public QUserProperties getUserProperties()
    {
        return userProperties;
    }

    public void setUserProperties(QUserProperties pUserProperties)
    {
        userProperties = pUserProperties;
    }

    public JFrame getFrame()
    {
        return this;
    }

    public Output getOutput()
    {
        return logger;
    }

    public MessageHandler getMessageHandler()
    {
        return messageHandler;
    }

    public void setMessageHandler(MessageHandler pMessageHandler)
    {
//        if (pMessageHandler instanceof Component == false) throw new IllegalArgumentException("QTrend expects the message handler to be a java.awt.Component.");
        messageHandler = pMessageHandler;
    }

    public void setVisible(boolean b)
    {
        if (b == true)
        {
            setX(userProperties.getUserPropertyAsInt(QTrendConstants.UserPropertyNames.USERPROP_X, 50));
            setY(userProperties.getUserPropertyAsInt(QTrendConstants.UserPropertyNames.USERPROP_Y, 50));

            setWidth(userProperties.getUserPropertyAsInt(QTrendConstants.UserPropertyNames.USERPROP_WIDTH, 500));
            setHeight(userProperties.getUserPropertyAsInt(QTrendConstants.UserPropertyNames.USERPROP_HEIGHT, 300));

            super.setVisible(true);

            splitPane.setDividerLocation(userProperties.getUserPropertyAsFloat(USERPROP_DIVIDER_LOCATION, 0.80f));

            log4jAppender.attach();

            //  for alerts
            if (allFrames.size() == 1)
            {
                final EventObject event = new EventObject(this);
                eventManager.handleEvent(this, event, "QTrend.DisplayAlerts");
            }
        }
        else
        {
            if (allFrames.contains(this) == false) return;

            LOG.debug("Closing " + this.toString());

            userProperties.setUserProperty(QTrendConstants.UserPropertyNames.USERPROP_X, "" + getX());
            userProperties.setUserProperty(QTrendConstants.UserPropertyNames.USERPROP_Y, "" + getY());

            userProperties.setUserProperty(QTrendConstants.UserPropertyNames.USERPROP_WIDTH, "" + getWidth());
            userProperties.setUserProperty(QTrendConstants.UserPropertyNames.USERPROP_HEIGHT, "" + getHeight());

            userProperties.setUserProperty(USERPROP_DIVIDER_LOCATION, "" + ( ((float) splitPane.getDividerLocation()) / getSize().height));

            log4jAppender.detach();

            super.setVisible(b);

            allFrames.remove(this);

            LOG.debug("Remaining QTrendFrames opened: " + allFrames.size());

            dispose();

            if (allFrames.isEmpty())
            {
                LOG.debug("Exiting... Bye!");
                System.exit(0);
            }
        }
    }

    public String toString()
    {
        return "QTrendFrame-" + myCount;
    }


    ///////////////////////////////////////
    ////    INNER CLASSES
}
