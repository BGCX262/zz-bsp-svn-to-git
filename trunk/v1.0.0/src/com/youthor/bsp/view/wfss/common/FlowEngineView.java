package com.youthor.bsp.view.wfss.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForward;


import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine;
import com.youthor.bsp.core.wfss.model.ActivityInstance;
import com.youthor.bsp.core.wfss.model.Participant;
import com.youthor.bsp.core.wfss.model.Process;
import com.youthor.bsp.core.wfss.model.Activity;
import com.youthor.bsp.core.wfss.model.Route;
import com.youthor.bsp.core.wfss.model.WorkItemDoen;
import com.youthor.bsp.core.wfss.model.WorkItemDoing;
public class FlowEngineView {

    public static Map setProcessData(HttpServletRequest request) {
        String wfss_processId=request.getParameter("wfss_processId");
        
        String wfss_activityId=request.getParameter("wfss_activityId");
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        Process process=wfCacheEngine.getProcessById(wfss_processId);
        request.setAttribute("CURR_PROCESS",process);
        Activity activity=wfCacheEngine.getActivityById(wfss_activityId);
        request.setAttribute("CURR_ACTIVITY",activity);
        
        Map map=request.getParameterMap();
        Map map1=new HashMap();
        map1.putAll(map);
        HttpSession session = request.getSession(false);
        Org org=(Org)session.getAttribute(Constants.GLOBAL_ORG);
        map1.put(Constants.GLOBAL_ORG,org);
        
        return map1;
    }
    
    public static ActionForward getProcessForward(HttpServletRequest request,HttpServletResponse response,Map map){
        String SUBMIT_WF_ACTION=request.getParameter("SUBMIT_WF_ACTION");
        if(SUBMIT_WF_ACTION.equals("save"))
        {
            String workItemId=request.getParameter("wfss_workItemId");
            if(workItemId==null||workItemId.equals(""))
            {
                workItemId=(String)map.get("wfss_new_workItemId");
            }
            try {
                response.sendRedirect(request.getContextPath()+"/showWorkItemDoing_wfss.do?workItemId="+workItemId);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return null;
        }
        List submitRouteInfo=(List)map.get("wfss_submitRouteInfo");
        request.setAttribute("wfss_submitRouteInfo",submitRouteInfo);
        String processIsNext = map.get("PROCESS_IS_NEXT") == null ? "" : (String)map.get("PROCESS_IS_NEXT");
        request.setAttribute("PROCESS_IS_NEXT", processIsNext);
        ActionForward forward = new ActionForward("/forwardSubmitInfo_wfss.do");
        request.setAttribute("wfss_workItemDoenId",(String)map.get("wfss_workItemDoenId"));
        return forward;
    }
    
    public static Activity getToActivityByRouteId(String routeId) {
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        Route route=wfCacheEngine.getRouteById(routeId);
        String  toActivityRule=route.getToActivityRule();
        Activity activity=null;
        if(toActivityRule!=null&&toActivityRule.equals("toActivity"))
        {
          activity=wfCacheEngine.getActivityById(route.getToActivityId());
        }
        return activity;
    }

    public static String setShowProcessData(HttpServletRequest request,String apIdFieldName) {
        setProcessData(request);
        
        
        String workItemId=request.getParameter("wfss_workItemId");
        request.setAttribute("wfss_workItemId",workItemId);
        if(workItemId==null) workItemId="";
      //得到是否有附件
        if (!workItemId.equals("")) {
            IWfssServiceFacade wfssServiceFacade = (IWfssServiceFacade)SpringHelper.getBean("wfssServiceFacade");
            IAbdfServiceFacade abdfServiceFacade = (IAbdfServiceFacade)SpringHelper.getBean("abdfServiceFacade");
            WorkItemDoing workItemDoing= wfssServiceFacade.getWorkItemDoingById(workItemId);
            String processInstanceId = "";
            if(workItemDoing == null) {
                WorkItemDoen workItemDoen= wfssServiceFacade.getWorkItemDoenById(workItemId);
                processInstanceId = workItemDoen.getProcessInstanceId();
            }
            else {
                processInstanceId = workItemDoing.getProcessInstanceId();
            }
            List attachListData = new ArrayList();
            
            if(processInstanceId!=null&&!processInstanceId.equals("")) {
                 attachListData=abdfServiceFacade.getAttachInfoListByProcessInstanceId(processInstanceId);
            }
            request.setAttribute("PROCESS_ATTACH_LIST", attachListData);
            
        }
        
       
        String appId=request.getParameter("wfss_appId");
        if(appId==null||appId.equals(""))
        {
            appId=(String)request.getAttribute("wfss_appId");
        }
        if(appId==null||appId.equals(""))
        {
             appId=request.getParameter(apIdFieldName);
            
        }
        if(appId==null||appId.equals(""))
        {
             appId=(String)request.getAttribute(apIdFieldName);
        }
        String openAction=request.getParameter("wfss_openAction");
        
        
        
        request.setAttribute("wfss_openAction",openAction);
        String appFormId=request.getParameter("wfss_appFormId");
        request.setAttribute("wfss_appFormId",appFormId);
        return appId;
    }

    public static StringBuffer  getNextExecuteor (String routeId,String workItemId)
    {
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        Route route = wfCacheEngine.getRouteById(routeId);
        String isRejectRoute = route.getIsRejectRoute()==null ? "N" : route.getIsRejectRoute();
        
        String activityId = route.getToActivityId();
        StringBuffer sb = new StringBuffer();
        sb.append(routeId +"]");
        
        StringBuffer sbId = new StringBuffer();
        StringBuffer sbName = new StringBuffer();
        StringBuffer sbType = new StringBuffer();
        IWfssServiceFacade wfssServiceFacade=(IWfssServiceFacade)SpringHelper.getBean("wfssServiceFacade");
        String sbNames = "";
        if (isRejectRoute.equals("N")) {
            
            List list=wfssServiceFacade.getParticipantByAId(activityId);
            for(int i=0;i<list.size();i++)
            {
                Participant participant=(Participant)list.get(i);
                if(participant.getMemberType().equalsIgnoreCase("USER"))
                {
                    String orgCode="YG";   
                    sbId.append(participant.getMemberId()+",");
                    sbName.append(participant.getParticipantName()+",");
                    sbType.append(orgCode+",");
                }
            }
            String ids = sbId.toString();
            if (ids!=null && !ids.equals("")) {
                ids = sbId.substring(0,ids.length()-1);
            }
            sbNames = sbName.toString();
            if (sbNames!=null && !sbNames.equals("")) {
                sbNames = sbNames.substring(0,sbNames.length()-1);
            }
        
            String orgCodes = sbType.toString();
            if (orgCodes!=null && !orgCodes.equals("")) {
                orgCodes = orgCodes.substring(0,orgCodes.length()-1);
            }
        
            sb.append("["+ids+"]");
            sb.append("["+sbNames+"]");
            sb.append("["+orgCodes+"");
        }
        else {
             WorkItemDoing workItemDoing = wfssServiceFacade.getWorkItemDoingById(workItemId);
             //根据流程实例和环节id,找到已执行过此环节的人
             List executeUser = wfssServiceFacade.getExecuteUserByProInsIdAndActId(workItemDoing.getProcessInstanceId(),route.getToActivityId());
             if (executeUser!=null && executeUser.size()>0) {
                 Activity toActivity = wfCacheEngine.getActivityById(route.getToActivityId());
                 String toOperateMode = toActivity.getOperateMode()==null?"":toActivity.getOperateMode();
                 if (toOperateMode.equalsIgnoreCase("XOR")){
                     ActivityInstance toActivityInstance = (ActivityInstance)executeUser.get(0);
                     sb.append("["+toActivityInstance.getNotifyOrgIds()+"]");
                     sb.append("["+toActivityInstance.getNotifyOrgNames()+"]");
                     sb.append("[YG");
                     sbNames = toActivityInstance.getNotifyOrgNames();
                  }
                 else {
                     for(int i=0;i<executeUser.size();i++){
                         ActivityInstance activityInstanceTemp = (ActivityInstance)executeUser.get(i);
                         sbId.append(activityInstanceTemp.getNotifyOrgIds()+",");
                         sbName.append(activityInstanceTemp.getNotifyOrgNames()+",");
                         sbType.append("YG,");
                     }
                        String ids = sbId.toString();
                        if (ids!=null && !ids.equals("")) {
                            ids = sbId.substring(0,ids.length()-1);
                        }
                        sbNames = sbName.toString();
                        if (sbNames!=null && !sbNames.equals("")) {
                            sbNames = sbNames.substring(0,sbNames.length()-1);
                        }
                    
                        String orgCodes = sbType.toString();
                        if (orgCodes!=null && !orgCodes.equals("")) {
                            orgCodes = orgCodes.substring(0,orgCodes.length()-1);
                        }
                    
                        sb.append("["+ids+"]");
                        sb.append("["+sbNames+"]");
                        sb.append("["+orgCodes+"");
                 }
             }
        }
        return sb;
    }
}
