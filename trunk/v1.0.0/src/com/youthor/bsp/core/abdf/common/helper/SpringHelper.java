package com.youthor.bsp.core.abdf.common.helper;

import javax.servlet.ServletContext;

import org.springframework.web.context.WebApplicationContext;


public  class SpringHelper {
    
    
    private static ServletContext servletContext = null;
    
    
    public static void bindSessionContext(ServletContext servletContext) {    
        
        if(SpringHelper.servletContext == null){
            SpringHelper.servletContext = servletContext;
        }
    }
    
    public static Object getBean(String beanName){
        WebApplicationContext context = (WebApplicationContext) servletContext.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
        return context.getBean(beanName);
    }
    

}
