package com.youthor.bsp.view.abdf.common.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;

import com.youthor.bsp.core.abdf.common.helper.SpringHelper;




public class ServletContextLoaderListener implements ServletContextListener{
    

    Logger logger = Logger.getLogger(ServletContextLoaderListener.class);

    public void contextInitialized(ServletContextEvent servletContextEvent) {
        
        ServletContext servletContext = servletContextEvent.getServletContext();
        SpringHelper.bindSessionContext(servletContext);
        
        
    }

    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        
    }

}
