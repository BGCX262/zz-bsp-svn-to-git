package com.youthor.bsp.view.abdf.common.helper;


import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import com.youthor.bsp.core.abdf.common.AbdfCache;
import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.ConfigInfoHelper;
import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.core.facade.IPortalUrssServiceFacade;
import com.youthor.bsp.core.urss.model.App;
import com.youthor.bsp.core.urss.model.Org;

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
    
    
    
    public static Org getOrg(HttpSession session)
    {
          Org org=(Org)session.getAttribute(Constants.GLOBAL_ORG);
          return org;
    }
    
    public static String getOrgId(HttpSession session)
    {
        Org org=(Org)session.getAttribute(Constants.GLOBAL_ORG);
          return org.getOrgId();
    }
    
    public static String getOrgName(HttpSession session)
    {
        Org org=(Org)session.getAttribute(Constants.GLOBAL_ORG);
          return org.getOrgName();
    }
    
    public static String getOrgParentName(HttpSession session)
    {
        Org org=(Org)session.getAttribute(Constants.GLOBAL_ORG);
        return org.getAllParentName();
    }
    
    public static String getOrgId(HttpSession session,String orgType,int level)
    {
         Org org=(Org)session.getAttribute("ORG_"+orgType+"_"+level);
        if(org==null) return "";
         return org.getOrgId();
    }
    
    public static String getOrgName(HttpSession session,String orgType,int level)
    {
         Org org=(Org)session.getAttribute("ORG_"+orgType+"_"+level);
        if(org==null) return "";
         return org.getOrgName();
    }
    
    /**
     * 得到项目的状态。true 表示上线，false表示开发
     * @param request
     * @return
     */
    public static boolean projectIsOnLine(HttpSession session)
    {
        App app=WebHelper.getApp();
        if(StringHelper.doWithNull(app.getStatus()).equals("Y"))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    
    public static String getAppId()
    {
         App app=(App)AbdfCache.app;
        return app.getAppId();
    }
    
    public static String getAppName()
    {
        App app=(App)AbdfCache.app;
        return app.getAppName();
    }
    
    public static App getApp()
    {
        App app=(App)AbdfCache.app;
        if(app==null)
        {
            IPortalUrssServiceFacade portalUrssServiceFacade=(IPortalUrssServiceFacade)SpringHelper.getBean("portalUrssServiceFacade");
            String appCode=ConfigInfoHelper.getProperty("AppCode");
            String comId=ConfigInfoHelper.getProperty("ComId");
            app=portalUrssServiceFacade.getAppByCode(comId,appCode);
            AbdfCache.app=app;
        }
        return app;
    }
    
    public static String getTopOrgId(HttpSession session,String orgType)
    {
        Org sysOrg=(Org)session.getAttribute("ORG_"+orgType+"_1");
        if(sysOrg==null) return "";
         return sysOrg.getOrgId();
    }
    
    public static String getTopOrgName(HttpSession session,String orgType)
    {
        Org sysOrg=(Org)session.getAttribute("ORG_"+orgType+"_1");
        if(sysOrg==null) return "";
         return sysOrg.getOrgName();
    }
    
    
    public static String getBottomOrgId(HttpSession session,String orgType)
    {
        
        String level=(String)session.getAttribute("ORG_LEVEL_"+orgType);
        Org sysOrg=(Org)session.getAttribute("ORG_"+orgType+"_"+level);
        if(sysOrg==null) return "";
         return sysOrg.getOrgId();
    }
    
    public static String getBottomOrgName(HttpSession session,String orgType)
    {
        String level=(String)session.getAttribute("ORG_LEVEL_"+orgType);
        Org sysOrg=(Org)session.getAttribute("ORG_"+orgType+"_"+level);
        if(sysOrg==null) return "";
         return sysOrg.getOrgName();
    }
    
    public static List getAllValidateInformation(){
        IAbdfServiceFacade service = (IAbdfServiceFacade)SpringHelper.getBean("abdfServiceFacade");
        return service.getValidateInformations(new Date());
    }
}
