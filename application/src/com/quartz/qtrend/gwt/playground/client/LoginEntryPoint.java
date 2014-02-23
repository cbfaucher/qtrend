package com.quartz.qtrend.gwt.playground.client;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.core.client.GWT;
import com.google.gwt.user.client.Command;
import com.google.gwt.user.client.Window;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.rpc.ServiceDefTarget;
import com.google.gwt.user.client.ui.*;

/**
 * INSERT YOUR COMMENT HERE....
 *
 * @author Christian
 * @since Quartz...
 */
public class LoginEntryPoint implements EntryPoint
{
    private DockPanel usernamePasswordPanel = new DockPanel();

    private final HTML usernameLabel = new HTML("<b>User Name</b>");
    private final HTML passwordLabel = new HTML("<i>Password</i>");
    private TextBox userName = new TextBox();
    private PasswordTextBox password = new PasswordTextBox();

    public void onModuleLoad()
    {
        RootPanel.get().add(createMenu());

        usernamePasswordPanel.setHorizontalAlignment(HasHorizontalAlignment.ALIGN_CENTER);
        usernamePasswordPanel.setVerticalAlignment(HasVerticalAlignment.ALIGN_TOP);
        usernamePasswordPanel.setWidth("100%");
        usernamePasswordPanel.setHeight("100%");

        usernamePasswordPanel.add(new HTML("<big>Please login: </big><br>"), DockPanel.NORTH);

        usernamePasswordPanel.add(usernameLabel, DockPanel.WEST);
        usernamePasswordPanel.add(userName, DockPanel.EAST);
        userName.addChangeListener(new ChangeListener()
        {
            public void onChange(Widget sender)
            {
                System.out.println("Changed: UserName:");

                usernameLabel.setVisible(false);
                userName.setVisible(false);

                passwordLabel.setVisible(true);
                password.setText("");
                password.setVisible(true);
                password.setFocus(true);
            }
        });

        passwordLabel.setVisible(false);
        usernamePasswordPanel.add(passwordLabel, DockPanel.WEST);
        password.setVisible(false);
        usernamePasswordPanel.add(password, DockPanel.EAST);
        password.addChangeListener(new ChangeListener()
        {
            public void onChange(Widget sender)
            {
                doLogin(userName.getText(), password.getText());

                usernameLabel.setVisible(true);
                userName.setVisible(true);

                passwordLabel.setVisible(false);
                password.setVisible(false);

                userName.setFocus(true);
            }
        });

        RootPanel.get().add(usernamePasswordPanel);
    }

    private void doLogin(String pUserName, String pPassword)
    {
        System.out.println("Getting LoginHandler interface...");
        final LoginHandlerAsync loginHandler = (LoginHandlerAsync) GWT.create(LoginHandler.class);

        ServiceDefTarget endpoint = (ServiceDefTarget) loginHandler;
        String moduleRelativeURL = GWT.getModuleBaseURL() + "login";
        endpoint.setServiceEntryPoint(moduleRelativeURL);

        System.out.println("Calling login(" + pUserName + ", *******) on " + moduleRelativeURL);

        loginHandler.login(pUserName, pPassword, new AsyncCallback()
        {
            public void onFailure(Throwable caught)
            {
                System.err.println(caught);
            }

            public void onSuccess(Object result)
            {
                System.out.println("Result=" + result);
                Window.alert((String) result);
            }
        });

        System.out.println("ALL DONE!");
    }

    private MenuBar createMenu()
    {
        final MenuBar menuBar = new MenuBar();

        final MenuBar fileMenu = new MenuBar(true);
        fileMenu.addItem("Open", new OpenCommand());
        fileMenu.addItem("Save", new SaveCommand());
        menuBar.addItem("File", fileMenu);

        final MenuBar editMenu = new MenuBar(true);
        editMenu.addItem("Copy", new CopyCommand());
        editMenu.addItem("Paste", new PasteCommand());
        menuBar.addItem("Edit", editMenu);

        //RootPanel.get().add(menuBar);
        return menuBar;
    }

    private static class OpenCommand implements Command
    {
        public void execute()
        {
            System.out.println("Invoked: Open");
        }
    }

    private static class SaveCommand implements Command
    {

        public void execute()
        {
            System.out.println("Invoked: Save");
        }
    }

    private static class CopyCommand implements Command
    {
        public void execute()
        {
            System.out.println("Invoked: Copy");
        }
    }

    private static class PasteCommand implements Command
    {

        public void execute()
        {
            System.out.println("Invoked: Paste");
        }
    }
}
