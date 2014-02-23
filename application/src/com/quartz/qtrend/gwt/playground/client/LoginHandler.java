package com.quartz.qtrend.gwt.playground.client;

import com.google.gwt.user.client.rpc.RemoteService;
import com.quartz.qtrend.gwt.playground.client.LoginFailedException;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public interface LoginHandler extends RemoteService
{
    String login(String pUserName, String pPassword) throws LoginFailedException;
}
