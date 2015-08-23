package com.youthor.bsp.view.urss.helper;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.urss.model.ComUser;

public class WebHelper {
    public static Object getObjectByWebContainer(PageContext pageContext ,String scope,String key)
    {
         HttpServletRequest request=(HttpServletRequest) pageContext.getRequest();
         Object returnValue=null;
         if(scope==null) scope="";
         if(scope.equals("page"))
         {
             returnValue=pageContext.getAttribute(key);
             return returnValue;
         }
         if(scope.equals("request"))
         {
             returnValue=request.getAttribute(key);
             return returnValue;
         }
         else if(scope.equals("session"))
         {
             returnValue=request.getSession().getAttribute(key);
             return returnValue;
         }
         else if(scope.equals("application"))
         {
             returnValue=request.getSession().getServletContext().getAttribute(key);
             return returnValue;
         }
         else if(scope.equals(""))
         {
             returnValue=pageContext.getAttribute(key);
             if(returnValue!=null) return returnValue;
              returnValue=request.getAttribute(key);
                 if(returnValue!=null) return returnValue;
             returnValue=request.getSession().getAttribute(key);
                 if(returnValue!=null) return returnValue;
             returnValue=request.getSession().getServletContext().getAttribute(key);
                 if(returnValue!=null) return returnValue;
         }
        return null;
    }
    
    
    public static boolean isSuperAdmin(HttpSession session)
    {
        ComUser comUser=(ComUser)session.getAttribute(Constants.GLOBAL_MRG_USER);
        if(comUser==null) return false;
        String userType=StringHelper.doWithNull(comUser.getUserType());
        if(userType.equals("-1"))
        {
           return true;
        }
        return false;
    }
    
    
    public static boolean isComAdmin(HttpSession session)
    {
        ComUser comUser=(ComUser)session.getAttribute(Constants.GLOBAL_MRG_USER);
        if(comUser==null) return false;
        String userType=StringHelper.doWithNull(comUser.getUserType());
        if(userType.equals("0"))
        {
           return true;
        }
        return false;
    }
    
    public static boolean isAppAdmin(HttpSession session)
    {
        ComUser comUser=(ComUser)session.getAttribute(Constants.GLOBAL_MRG_USER);
        if(comUser==null) return false;
        String userType=StringHelper.doWithNull(comUser.getUserType());
        if(userType.equals("1"))
        {
           return true;
        }
        return false;
    }
    
    public static ComUser getCurrComUser(HttpSession session)
    {
        ComUser comUser=(ComUser)session.getAttribute(Constants.GLOBAL_MRG_USER);
        return comUser;
    }
    
    
    public static String getCurrComId(HttpSession session)
    {
        ComUser comUser=(ComUser)session.getAttribute(Constants.GLOBAL_MRG_USER);
        if(comUser==null) return "";
        return comUser.getComId();
    }
    
    
    public static String getCurrComName(HttpSession session)
    {
        ComUser comUser=(ComUser)session.getAttribute(Constants.GLOBAL_MRG_USER);
        if(comUser==null) return "";
        return comUser.getRegComName();
    }
    
    
    
}
