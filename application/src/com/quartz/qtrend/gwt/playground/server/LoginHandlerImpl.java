package com.quartz.qtrend.gwt.playground.server;

import com.google.gwt.user.server.rpc.RemoteServiceServlet;
import com.quartz.qtrend.gwt.playground.client.LoginHandler;
import com.quartz.qtrend.gwt.playground.client.LoginFailedException;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class LoginHandlerImpl extends RemoteServiceServlet implements LoginHandler
{

    public String login(String pUserName, String pPassword) throws LoginFailedException
    {
        if (!pUserName.equals("fauchc02")
                || !pPassword.equals("abcd"))
        {
            throw new LoginFailedException("Username/password not found.");
        }

        return "Welcome, " + pUserName; 
    }
}
