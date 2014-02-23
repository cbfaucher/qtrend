/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.ui.menus;

import com.quartz.qutilities.swing.menus.MenuFactoryBean;
import com.quartz.qutilities.swing.menus.XmlMenu;
import com.quartz.qutilities.swing.menus.IMenuHandler;

import javax.swing.*;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class WatchListMenuCreator implements MenuFactoryBean
{
    public WatchListMenuCreator()
    {
    }

    public XmlMenu createMenu() throws Exception
    {
        final XmlMenu xmlMenu = new XmlMenu(){
            public void setMenuHandler(IMenuHandler pHandler)
            {
                System.out.println("WatchList: MenuHandler is set!");
                super.setMenuHandler(pHandler);
            }
        };
        xmlMenu.add(new JMenuItem("1. Watch List 1"));
        xmlMenu.add(new JMenuItem("2. Watch List 2"));
        xmlMenu.add(new JMenuItem("3. Watch List 3"));
        return xmlMenu;
    }
}
