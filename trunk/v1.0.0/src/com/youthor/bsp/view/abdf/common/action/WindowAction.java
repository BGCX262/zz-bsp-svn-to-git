package com.youthor.bsp.view.abdf.common.action;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.AbdfCache;
import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.ConfigInfoHelper;
import com.youthor.bsp.core.abdf.common.helper.MD5Helper;
import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.core.facade.IPortalUrssServiceFacade;
import com.youthor.bsp.core.urss.model.App;
import com.youthor.bsp.core.urss.model.CoopArea;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.core.urss.model.Resource;
import com.youthor.bsp.core.urss.model.User;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;
import com.youthor.bsp.view.wfss.common.WFCacheHelper;

public class WindowAction extends BaseStrutsAction{
    public static final String FORWARD_Top = "top";
    public static final String FORWARD_LeftMenu =         "leftMenu";
    public static final String FORWARD_LeftCoopBar =     "leftCoopBar";
    public static final String FORWARD_LeftCoopBarCode =     "leftCoopBarCode";
    public static final String FORWARD_UserWindow =     "userWindow";
    public static final String FORWARD_MainWindow =     "mainWindow";
    
    public static final String FORWARD_AdminWindow =     "adminWindow";
    public static final String FORWARD_FAILLOGIN =         "loginFail";
    public static final String FORWARD_LOGOUT    =         "logoutSuccess";
    
    private IPortalUrssServiceFacade portalUrssServiceFacade;
    
    public ActionForward top(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        HttpSession session = request.getSession(false);
    
        Org org=(Org)session.getAttribute(Constants.GLOBAL_ORG);
        String orgId=org.getOrgId();
        App app=WebHelper.getApp();
        String appId=app.getAppId();
        List haveMenuList=null;
        boolean appStates=WebHelper.projectIsOnLine(session);
        if(appStates)
            haveMenuList=(List)session.getAttribute(appId+"_"+orgId+"_"+Constants.Menu);
        if(haveMenuList==null)
        {
            haveMenuList=portalUrssServiceFacade.getUserMenuByAppIdOrgId(appId,org.getOrgId());
            session.setAttribute(appId+"_"+orgId+"_"+Constants.Menu,haveMenuList);
        }
        request.setAttribute("haveMenuList",haveMenuList);
        return mapping.findForward(FORWARD_Top);
    }
    public ActionForward selectUserOrg(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
         HttpSession session = request.getSession();
        User user = (User)session.getAttribute("GLOBAL_USER"); 
           if (user == null){
            response.sendRedirect(request.getContextPath()+"/forwardIndex_abdf.do");
            return null;
          }
           String orgId = request.getParameter("orgId");
           if(orgId == null || orgId.equals("")) {
               response.sendRedirect(request.getContextPath()+"/forwardIndex_abdf.do");
              return null;
           }
        List list = (List)session.getAttribute("USER_ORG");
        Org org = null;
        for(int i=0;i<list.size();i++) {
        Org orgTemp = (Org)list.get(i);
        if (orgId.equals(orgTemp.getOrgId())) {
            org = orgTemp;
            session.setAttribute(Constants.GLOBAL_ORG,org);
            break;
        }
     }
        
        if(org == null) {
           response.sendRedirect(request.getContextPath()+"/forwardIndex_abdf.do");
          return null;
        }
        setOrgExtSession(session, org);
        response.sendRedirect(request.getContextPath()+"/forwardWindow_abdf.do");
     return null;
  }
    
    
    public ActionForward userLogonOn(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        User user=portalUrssServiceFacade.userLogon(username,MD5Helper.MD5Encode(password));
        if(user == null){
            request.setAttribute("hintMessage", "用户名或者密码错误！");
            return mapping.findForward(FORWARD_FAILLOGIN);
        }
        HttpSession session = request.getSession(true);
        session.setAttribute(Constants.GLOBAL_USER,user);
        if(AbdfCache.app==null)
        {
                  App app=portalUrssServiceFacade.getAppByCode(ConfigInfoHelper.getProperty(Constants.GLOBAL_ABDF_COM_ID).trim(),
                  ConfigInfoHelper.getProperty(Constants.GLOBAL_ABDF_APP_KEY).trim());
            if(app==null)
            {
                System.exit(0);
            }
            else
            {
                AbdfCache.app=app;
            }
        }
        List orgList=user.getOrgList();
        if (orgList!=null && orgList.size()>1) {
            session.setAttribute("USER_ORG", orgList);
             response.sendRedirect(request.getContextPath()+"/forwardSelectUserOrg_abdf.do");
             return null;
        }
        Org org=(Org)orgList.get(0);
        session.setAttribute(Constants.GLOBAL_ORG,org);
        
        setOrgExtSession(session, org);

        String reLogin = request.getParameter("reLogin");
        if (reLogin==null || !reLogin.equals("")) {
            String to_next = request.getParameter("to_next");
            if (to_next!=null && !to_next.equals("")) {
                 response.sendRedirect(to_next);
            }
            else {
                 return mapping.findForward(FORWARD_UserWindow);
            }
            
        }
        else {
             response.sendRedirect(request.getContextPath()+"/forwardWindow_abdf.do");
             
        }
        return null;
    }
    private void setOrgExtSession(HttpSession session, Org org) {
        String allParentId=org.getAllParentId();
        String allParentName=org.getAllParentName();
        String allParentCode=org.getAllParentCode();
        if(allParentId!=null)
        {
            String [] allParentIdArr=allParentId.split(":");
            String [] allParentNameArr=allParentName.split(":");
            String [] allParentCodeArr=allParentCode.split(":");
            for(int i=0;i<allParentIdArr.length;i++)
            {
                Org sysOrg=new Org();
                sysOrg.setOrgId(allParentIdArr[i]);
                sysOrg.setOrgName(allParentNameArr[i]);
                sysOrg.setOrgTypeCode(allParentCodeArr[i]);
                Enumeration e=session.getAttributeNames();
                int j=1;
                while(e.hasMoreElements())
                {
                    String key=(String)e.nextElement();
                    if(key.indexOf("ORG_"+sysOrg.getOrgTypeCode()+"_")==0)
                    {
                        j++;
                    }
                }
                session.setAttribute("ORG_LEVEL_"+sysOrg.getOrgTypeCode(),j+"");
                session.setAttribute("ORG_"+sysOrg.getOrgTypeCode()+"_"+j,sysOrg);
                
            }
            
        }
    }

    public ActionForward userLogonOut(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception{
        Enumeration e=request.getSession().getAttributeNames();
        int j=1;
        while(e.hasMoreElements())
        {
            String key=(String)e.nextElement();
            request.getSession().removeAttribute(key);
        }
        request.getSession().invalidate();
        request.setAttribute("hintMessage", "成功退出系统！");
        return mapping.findForward(FORWARD_LOGOUT);
    }
    
    public void setPortalUrssServiceFacade(
            IPortalUrssServiceFacade portalUrssServiceFacade) {
        this.portalUrssServiceFacade = portalUrssServiceFacade;
    }
    
    public ActionForward leftMenu(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        HttpSession session = request.getSession(false);
        Org org=(Org)session.getAttribute(Constants.GLOBAL_ORG);
        String funId=request.getParameter("funId");
        
        String orgId=org.getOrgId();
        App app=WebHelper.getApp();
        String appId=app.getAppId();
        boolean appStates=WebHelper.projectIsOnLine(session);
        List haveMenuList=null;
        if(appStates)
            haveMenuList=(List)session.getAttribute(appId+"_"+orgId+"_"+Constants.Menu);
        if(haveMenuList==null)
        {
            haveMenuList=portalUrssServiceFacade.getUserMenuByAppIdOrgId(appId,org.getOrgId());
            session.setAttribute(appId+"_"+orgId+"_"+Constants.Menu,haveMenuList);
        }
        request.setAttribute("haveMenuList",haveMenuList);
        request.setAttribute("funId",funId);
        

        return mapping.findForward(FORWARD_LeftMenu);
    }
    
    
    public ActionForward leftCoopBar(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        HttpSession session = request.getSession(false);
        Org org=(Org)session.getAttribute(Constants.GLOBAL_ORG);
        String orgId=org.getOrgId();
        App app=WebHelper.getApp();
        String appId=app.getAppId();
        List haveCoopMenu=null;
     
        String startupCoopCache=ConfigInfoHelper.getProperty(Constants.startupCoopCache);
        if(startupCoopCache!=null&&startupCoopCache.equals("Y"))
        {
               boolean appStates=WebHelper.projectIsOnLine(session);
                if(appStates)
                {
               haveCoopMenu=(List)session.getAttribute(orgId+"_"+Constants.Coop);
                }
            if(haveCoopMenu==null)
            {
                haveCoopMenu= portalUrssServiceFacade.getCoopAreaByOrgIdAppId(orgId,appId);
                session.setAttribute(orgId+"_"+Constants.Coop,haveCoopMenu);
            }
        }
        request.setAttribute("haveCoopMenu",haveCoopMenu);
        return mapping.findForward(FORWARD_LeftCoopBar);
    }
    
    public ActionForward leftCoopBarByCode(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        List havaCoopMenuByCode = new ArrayList();
        String coopCode = request.getParameter("coopCode");
        if (coopCode == null || coopCode.equals("")) coopCode = "ADD";
      
        HttpSession session=request.getSession();
        String comId = WebHelper.getTopOrgId(session, Constants.GLOBAL_GS);
        List coopAreaList = portalUrssServiceFacade.getAllCoopArea();
       
        request.setAttribute("coopAreaList", coopAreaList);
        String orgId=WebHelper.getOrgId(session);
        if (coopAreaList!=null&&coopAreaList.size()>0) {
            for(int i=0;i<coopAreaList.size();i++) {
                CoopArea coopArea = (CoopArea)coopAreaList.get(i);
                List listres = portalUrssServiceFacade.getCoopResourceCoop(orgId,coopArea.getCoopAreaId());
                if (listres!=null && listres.size()>0) {
                    for(int j=0;j<listres.size();j++) {
                        Resource resource = (Resource)listres.get(j);
                        String processInfo = resource.getProcessInfo();
                        if (processInfo!=null && !processInfo.trim().equals("")) {
                            Item item = WFCacheHelper.getInitProcessInfo(processInfo);
                            String url = resource.getImplUrl() != null ? resource.getImplUrl() : "";
                            if(url.indexOf("?")>=0)
                            {
                               url=url+"&wfss_processId="+item.getKey()+"&wfss_activityId="+item.getValue();
                            }
                            else
                            {
                                url=url+"?wfss_processId="+item.getKey()+"&wfss_activityId="+item.getValue();
                            }
                           
                            resource.setImplCoopUrl(url);
                        }
                        }
                    }
                    coopArea.setResourceList(listres);
            }
        }
        
        
        if (coopAreaList!=null && coopAreaList.size()>0) {
        	for(int i=0;i<coopAreaList.size();i++) {
        		CoopArea coopArea = (CoopArea)coopAreaList.get(i);
        		if (coopArea.getCoopAreaCode().equals(coopCode)) {
        			havaCoopMenuByCode.add(coopArea);
        		}
        	}
        }
        request.setAttribute("havaCoopMenuByCode",havaCoopMenuByCode);
        return mapping.findForward(FORWARD_LeftCoopBarCode);
    }
    
    public ActionForward userCoopArea(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        HttpSession session=request.getSession();
        String comId = WebHelper.getTopOrgId(session, Constants.GLOBAL_GS);
        List coopAreaList = portalUrssServiceFacade.getAllCoopArea();
       
        request.setAttribute("coopAreaList", coopAreaList);
        String orgId=WebHelper.getOrgId(session);
        if (coopAreaList!=null&&coopAreaList.size()>0) {
            for(int i=0;i<coopAreaList.size();i++) {
                CoopArea coopArea = (CoopArea)coopAreaList.get(i);
                List listres = portalUrssServiceFacade.getCoopResourceCoop(orgId,coopArea.getCoopAreaId());
                if (listres!=null && listres.size()>0) {
                    for(int j=0;j<listres.size();j++) {
                        Resource resource = (Resource)listres.get(j);
                        String processInfo = resource.getProcessInfo();
                        if (processInfo!=null && !processInfo.trim().equals("")) {
                            Item item = WFCacheHelper.getInitProcessInfo(processInfo);
                            String url = resource.getImplUrl() != null ? resource.getImplUrl() : "";
                            if(url.indexOf("?")>=0)
                            {
                               url=url+"&wfss_processId="+item.getKey()+"&wfss_activityId="+item.getValue();
                            }
                            else
                            {
                                url=url+"?wfss_processId="+item.getKey()+"&wfss_activityId="+item.getValue();
                            }
                           
                            resource.setImplCoopUrl(url);
                        }
                        }
                    }
                    coopArea.setResourceList(listres);
            }
        }
        
        return mapping.findForward("userCoopArea");
    }

}
