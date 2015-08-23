/**
 * 
 */
package com.youthor.bsp.view.wfss.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.ConfigInfoHelper;
import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.helper.TagHtmlHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.core.urss.model.CoopArea;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.core.urss.model.Resource;

import com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine;
import com.youthor.bsp.core.wfss.common.model.RouteHelper;
import com.youthor.bsp.core.wfss.common.model.WfOrg;
import com.youthor.bsp.core.wfss.model.Activity;
import com.youthor.bsp.core.wfss.model.AppForm;
import com.youthor.bsp.core.wfss.model.Participant;
import com.youthor.bsp.core.wfss.model.Process;
import com.youthor.bsp.core.wfss.model.ProcessInstance;
import com.youthor.bsp.core.wfss.model.Route;
import com.youthor.bsp.core.wfss.model.WorkItemDoen;
import com.youthor.bsp.core.wfss.model.WorkItemDoing;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;
import com.youthor.bsp.view.wfss.common.criterion.IActivityStartEvent;
import com.youthor.bsp.view.wfss.common.criterion.IRouteFliter;
import com.youthor.bsp.view.wfss.common.criterion.WfExtFactory;
import com.youthor.bsp.view.wfss.web.form.ActivityForm;

public class FlowAction extends BaseStrutsAction {

    
    private static final String FORWARD_RouteView = "routeView";
    private static final String FORWARD_ArrestInfo = "arrestInfo";
    private static final String FORWARD_WorkItemDoing = "workItemDoing";
    private static final String FORWARD_WorkItemDoen = "workItemDoen";
    
    private static final String CONTENT_TYPE = "text/xml;charset=UTF-8";
    private IWfssServiceFacade wfssServiceFacade;
    private IUrssServiceFacade urssServiceFacade;
    public void setUrssServiceFacade(IUrssServiceFacade urssServiceFacade) {
        this.urssServiceFacade = urssServiceFacade;
    }



    public void setWfssServiceFacade(IWfssServiceFacade wfssServiceFacade) {
        this.wfssServiceFacade = wfssServiceFacade;
    }

    

    public ActionForward openRouteWindow(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        //1:得到当前环节环节
        String activityId=request.getParameter("wfss_activityId");
        String workItemId=request.getParameter("wfss_workItemId");
        Activity activity = wfCacheEngine.getActivityById(activityId);
        String joinId = StringHelper.doWithNull(activity.getJoinId());
        //如果当前环节为聚合环节
        if(!joinId.equals("")) {
            String joinMode = StringHelper.doWithNull(activity.getJoinMode());
            WorkItemDoing workItemDoing = wfssServiceFacade.getWorkItemDoingById(workItemId);
            //如果为单一聚合
            if (joinMode.equalsIgnoreCase("XOR")) {
                //找到此流程实例下所有joinId的待办是否都已完成,如果没有完成,转入到提示页
               List activityInst = wfssServiceFacade.getActivityInstByProInsId(workItemDoing.getProcessInstanceId(),joinId);
               if (activityInst!=null && !activityInst.isEmpty()) {
                   request.setAttribute("activityInst", activityInst);
                   return mapping.findForward("joinInfo");
               }
            }
            
        }
        
        //2:进行环节路由打开前扩散(活动启动前事件)
        String startEvent=activity.getOnStartEvent();
        if(startEvent!=null&&!startEvent.equals(""))
        {
            IActivityStartEvent activityStartEvent=(IActivityStartEvent)WfExtFactory.getFlowEvent(startEvent);
            String returnValue=activityStartEvent.execute(request);
            if(!StringHelper.doWithNull(returnValue).equals(""))
            {
                request.setAttribute("arrestInfo",returnValue);
                return mapping.findForward(FORWARD_ArrestInfo);
                
            }
        }
        
        //3:得到环节下的路由
        List routeList=wfCacheEngine.listRouteByActivityId(activityId);
        
    
        
        //4:处理环节过滤策略
        List viewRouteList=new ArrayList();
        if(routeList!=null&&routeList.size()>0)
        {
            for(int i=0;i<routeList.size();i++)
            {
                Route route=(Route)routeList.get(i);
                String fliterExpr=route.getFliterExpr();
                RouteHelper routeHelper=new RouteHelper();
                routeHelper.setRoute(route);
                if(fliterExpr!=null&&!fliterExpr.equals(""))
                {
                    IRouteFliter routeFliter=(IRouteFliter)WfExtFactory.getFlowEvent(fliterExpr);
                    routeHelper.setSelectLevel(routeFliter.execute(request));
                }
                else
                {
                    routeHelper.setSelectLevel(0);
                }
                viewRouteList.add(routeHelper);
            }
        }
        request.setAttribute("activity",activity);
        
        request.setAttribute("workItemId", workItemId);
        request.setAttribute("viewRouteList",viewRouteList);
        return mapping.findForward(FORWARD_RouteView);
    }

    
    
    public ActionForward wfOrgAsynSpread(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String urlBase=request.getContextPath();
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        StringBuffer sbXML=new StringBuffer();
        sbXML.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
        sbXML.append("\t<tree>\n");
        String activityId =  request.getParameter("activityId");
        String flag =  request.getParameter("flag");
        List list=wfssServiceFacade.getParticipantByAId(activityId);
        
        if(list!=null&&list.size()>0)
        {
            for(int i=0;i<list.size();i++)
            {
                Participant participant=(Participant)list.get(i);
                if(participant.getMemberType().equalsIgnoreCase(flag))
                {
                    String orgCode=participant.getMemberType();
                    String src="";
                     if(flag.equals("USER"))
                     {
                         src="";
                         orgCode="YG";
                     }
                     else if (flag.equals("ORG"))
                     {
                           src=urlBase+"/orgTree_abdf.do?orgParentId="+participant.getMemberId();
                          orgCode=participant.getOrgTypeCode();
                     }
                    String action = "javascript:doChangeSelect('"+participant.getMemberId()+"','"+participant.getParticipantName()+"','"+orgCode+"')";
                    String icon = urlBase+"/bsp/abdf/skins/default/img/xloadtree/folder.png";
                     String openIcon = urlBase+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png";
                     
                     sbXML.append(TagHtmlHelper.makeItemXML(participant.getParticipantName(), action, src, icon, openIcon));
                }
                
            }
        }
        
        sbXML.append("\t</tree>\n");
        out.print(sbXML.toString());
        return null;    
    }
    
    
    public ActionForward listWorkItemDoing(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        //得到当前人的id
        HttpSession session=request.getSession();
        String orgId=WebHelper.getOrgId(session);
      
        String comId =WebHelper.getTopOrgId(session, Constants.GLOBAL_GS);
        CoopArea coopArea = urssServiceFacade.getCoopAreaByCode("ADD");
        List coopAreaAdd = urssServiceFacade.getCoopResourceCoop(orgId,coopArea.getCoopAreaId());
        if (coopAreaAdd!=null && coopAreaAdd.size()>0) {
            for(int i=0;i<coopAreaAdd.size();i++) {
                Resource resource = (Resource)coopAreaAdd.get(i);
                String processInfo = resource.getProcessInfo();
                if (processInfo!=null && !processInfo.equals("")) {
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
        
        request.setAttribute("coopAreaAdd",coopAreaAdd);
        request.setAttribute("coopArea",coopArea);
        Page page=(Page)request.getAttribute(Page.PAGE_INFO);
        String appFormId = request.getParameter("appFormId");
        page.setQueryObject(appFormId);
        request.setAttribute("appFormId", appFormId);
        List listWorkItemDoing=wfssServiceFacade.listWorkItemDoing(page,orgId);
        request.setAttribute("listWorkItemDoing",listWorkItemDoing);
        return mapping.findForward(FORWARD_WorkItemDoing);
    }
    
    public ActionForward listWorkItemDoen(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        //得到当前人的id
        HttpSession session=request.getSession();
        String orgId=WebHelper.getOrgId(session);
        Page page=(Page)request.getAttribute(Page.PAGE_INFO);
        String appFormId = request.getParameter("appFormId");
        page.setQueryObject(appFormId);
        request.setAttribute("appFormId", appFormId);
        List listWorkItemDoen=wfssServiceFacade.listWorkItemDoen(page,orgId);
        request.setAttribute("listWorkItemDoen",listWorkItemDoen);
        return mapping.findForward(FORWARD_WorkItemDoen);
        
    }
    
    
    
    public ActionForward showWorkItemDoing(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        //得到当前人的id
        String workItemId=request.getParameter("workItemId");
        WorkItemDoing workItemDoing=wfssServiceFacade.getWorkItemDoingById(workItemId);
        HttpSession session=request.getSession();
        String orgId=WebHelper.getOrgId(session);
        if (workItemDoing.getOwnerId() == null || !workItemDoing.getOwnerId().equals(orgId)) {
            response.sendRedirect(request.getContextPath()+"/forwardNoPowerInfo_abdf.do");
             return null;
        }
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        if(StringHelper.doWithNull(workItemDoing.getStates()).equals("DD"))
        {
            Activity sctivity=wfCacheEngine.getActivityById(workItemDoing.getActivityId());
            if(StringHelper.doWithNull(sctivity.getOperateMode()).equals("LOOP"))
            {
                 request.setAttribute("wfss_workItemId",workItemId);
                 return mapping.findForward("loopInfo");
            }
        }
        
        AppForm  appForm=wfCacheEngine.getAppFormById(workItemDoing.getAppFormId());
        String url = appForm.getAppFormUrl();
        if(url==null) url="";
        ActionForward forward = null;
        System.out.println("url==="+url);
        if(url.indexOf("?")>=0){
            response.sendRedirect(request.getContextPath()+url+"&wfss_workItemId="+workItemId+"&wfss_appId="+workItemDoing.getAppId()+"&wfss_openAction="+workItemDoing.getStates()+"&wfss_activityId="+workItemDoing.getActivityId()+"&wfss_processId="+workItemDoing.getProcessId()+"&wfss_appFormId="+appForm.getAppFormId());
            
        }
        else {
            response.sendRedirect(request.getContextPath()+url+"?wfss_workItemId="+workItemId+"&wfss_appId="+workItemDoing.getAppId()+"&wfss_openAction="+workItemDoing.getStates()+"&wfss_activityId="+workItemDoing.getActivityId()+"&wfss_processId="+workItemDoing.getProcessId()+"&wfss_appFormId="+appForm.getAppFormId());
        }
        return null;
    }
    
    public ActionForward showWorkItemDoen(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        //得到当前人的id
        String workItemId=request.getParameter("workItemId");
        WorkItemDoen workItemDoen=wfssServiceFacade.getWorkItemDoenById(workItemId);
        HttpSession session=request.getSession();
        String orgId=WebHelper.getOrgId(session);
        if (workItemDoen.getOwnerId() == null || !workItemDoen.getOwnerId().equals(orgId)) {
            response.sendRedirect(request.getContextPath()+"/forwardNoPowerInfo_abdf.do");
             return null;
        }
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        AppForm  appForm=wfCacheEngine.getAppFormById(workItemDoen.getAppFormId());
        String url = appForm.getAppFormUrl();
        if(url==null) url="";
        ActionForward forward = null;
        if(url.indexOf("?")>=0)
             forward = new ActionForward(url+"&wfss_workItemId="+workItemId+"&wfss_appId="+workItemDoen.getAppId()+"&wfss_openAction=YB&wfss_activityId="+workItemDoen.getActivityId()+"&wfss_processId="+workItemDoen.getProcessId()+"&wfss_appFormId="+appForm.getAppFormId());
        else
             forward = new ActionForward(url+"?wfss_workItemId="+workItemId+"&wfss_appId="+workItemDoen.getAppId()+"&wfss_openAction=YB&wfss_activityId="+workItemDoen.getActivityId()+"&wfss_processId="+workItemDoen.getProcessId()+"&wfss_appFormId="+appForm.getAppFormId());
        
        return forward;
    }
    
    
    public ActionForward showLoopWorkItemDoen(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        //得到当前人的id
        String workItemId=request.getParameter("workItemId");
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        WorkItemDoing workItemDoing=wfssServiceFacade.getWorkItemDoingById(workItemId);
//        if(StringHelper.doWithNull(workItemDoing.getStates()).equals("DD"))
//        {
//            Activity sctivity=wfCacheEngine.getActivityById(workItemDoing.getActivityId());
//            if(StringHelper.doWithNull(sctivity.getOperateMode()).equals("LOOP"))
//            {
//                 request.setAttribute("wfss_workItemId",workItemId);
//                 return mapping.findForward("loopInfo");
//            }
//        }
        
        AppForm  appForm=wfCacheEngine.getAppFormById(workItemDoing.getAppFormId());
        String url = appForm.getAppFormUrl();
        if(url==null) url="";
        ActionForward forward = null;
        if(url.indexOf("?")>=0)
             forward = new ActionForward(url+"&wfss_workItemId="+workItemId+"&wfss_appId="+workItemDoing.getAppId()+"&wfss_openAction=YB&wfss_activityId="+workItemDoing.getActivityId()+"&wfss_processId="+workItemDoing.getProcessId()+"&wfss_appFormId="+appForm.getAppFormId());
        else
             forward = new ActionForward(url+"?wfss_workItemId="+workItemId+"&wfss_appId="+workItemDoing.getAppId()+"&wfss_openAction=YB&wfss_activityId="+workItemDoing.getActivityId()+"&wfss_processId="+workItemDoing.getProcessId()+"&wfss_appFormId="+appForm.getAppFormId());
        
        return forward;
    }
    
    
    
    
    public ActionForward showNextWorkItemDoing(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        //得到当前人的id
        HttpSession session=request.getSession();
        String orgId=WebHelper.getOrgId(session);
        WorkItemDoing workItemDoing=wfssServiceFacade.getWorkItemDoingByOrgId(orgId);
        if(workItemDoing==null)
        {
            
            return mapping.findForward("WorkItemDoing");
        }
        String workItemId=workItemDoing.getWorkItemId();
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        AppForm  appForm=wfCacheEngine.getAppFormById(workItemDoing.getAppFormId());
        String url = appForm.getAppFormUrl();
        if(url==null) url="";
        ActionForward forward = null;
        if(url.indexOf("?")>=0)
             forward = new ActionForward(url+"&wfss_workItemId="+workItemId+"&wfss_appId="+workItemDoing.getAppId()+"&wfss_openAction="+workItemDoing.getStates()+"&wfss_activityId="+workItemDoing.getActivityId()+"&wfss_processId="+workItemDoing.getProcessId()+"&wfss_appFormId="+appForm.getAppFormId());
        else
             forward = new ActionForward(url+"?wfss_workItemId="+workItemId+"&wfss_appId="+workItemDoing.getAppId()+"&wfss_openAction="+workItemDoing.getStates()+"&wfss_activityId="+workItemDoing.getActivityId()+"&wfss_processId="+workItemDoing.getProcessId()+"&wfss_appFormId="+appForm.getAppFormId());
        
        return forward;
    }
    
    public ActionForward affirmDoThisWorkItem(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Map map=request.getParameterMap();
        Map map1=new HashMap();
        map1.putAll(map);
         HttpSession session = request.getSession(false);
         Org org=(Org)session.getAttribute(Constants.GLOBAL_ORG);
         map1.put(Constants.GLOBAL_ORG,org);
         wfssServiceFacade.affirmDoThisWorkItem(map1);
         String workItemId=request.getParameter("wfss_workItemId");
         WorkItemDoing workItemDoing=wfssServiceFacade.getWorkItemDoingById(workItemId);
         IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
            AppForm  appForm=wfCacheEngine.getAppFormById(workItemDoing.getAppFormId());
            String url = appForm.getAppFormUrl();
            if(url==null) url="";
            ActionForward forward = null;
            if(url.indexOf("?")>=0)
                 forward = new ActionForward(url+"&wfss_workItemId="+workItemId+"&wfss_appId="+workItemDoing.getAppId()+"&wfss_openAction="+workItemDoing.getStates()+"&wfss_activityId="+workItemDoing.getActivityId()+"&wfss_processId="+workItemDoing.getProcessId()+"&wfss_appFormId="+appForm.getAppFormId());
            else
                 forward = new ActionForward(url+"?wfss_workItemId="+workItemId+"&wfss_appId="+workItemDoing.getAppId()+"&wfss_openAction="+workItemDoing.getStates()+"&wfss_activityId="+workItemDoing.getActivityId()+"&wfss_processId="+workItemDoing.getProcessId()+"&wfss_appFormId="+appForm.getAppFormId());
            
            return forward;
        
    }
    public ActionForward submitBatchProcessWorkItem(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String routeBatchFlag = request.getParameter("routeBatchFlag");
        String processOption = request.getParameter("processOption");
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        String [] workItems = request.getParameterValues("workItemDoingId") ;
        if (workItems!=null&&workItems.length>0) {
            for (int i =0;i<workItems.length;i++) {
                WorkItemDoing workItemDoing=wfssServiceFacade.getWorkItemDoingById(workItems[i]);
                String title = workItemDoing.getTitle();
                if (workItemDoing!=null) {
                    String activityId = workItemDoing.getActivityId();
                    Activity activity = wfCacheEngine.getActivityById(activityId);
                    String isBatch = activity.getIsBatch()==null?"":activity.getIsBatch();
                    if (isBatch.equals("Y")) {
                        List listRoute = wfCacheEngine.listRouteByActivityId(activityId);
                        if(listRoute!=null&&listRoute.size()>0){
                            //得到选择的路由
                            Route selectRoute = null;
                            for(int j=0;j<listRoute.size();j++) {
                                Route route = (Route)listRoute.get(j);
                                String batchFlag = route.getBatchFlag()==null?"":route.getBatchFlag();
                                if (batchFlag.equals(routeBatchFlag)) {
                                    selectRoute = route;
                                    break;
                                }
                            }
                            //处理接收人
                            StringBuffer sb = FlowEngineView.getNextExecuteor(selectRoute.getRouteId(),workItemDoing.getWorkItemId());
                            Map map = new HashMap();
                            map.put("SUBMIT_WF_ACTION", "submit");
                            map.put("wfss_workItemId", workItemDoing.getWorkItemId());
                            HttpSession session = request.getSession(false);
                             Org org=(Org)session.getAttribute(Constants.GLOBAL_ORG);
                            map.put(com.youthor.bsp.core.abdf.common.Constants.GLOBAL_ORG, org);
                            map.put("SUBMIT_OPTION_VALUE", processOption);
                            map.put("SUBMIT_ROUTE_VALUE", sb.toString());
                            
                            wfssServiceFacade.run(map, title, workItemDoing.getAppId());
                        }
                    }
                }
                
            }
        }
        try {
            response.sendRedirect(request.getContextPath()+"/listWorkItemDoing_wfss.do");
        } catch (IOException e) {
            e.printStackTrace();
        }
            return null;
    }
    public ActionForward assignOtherUserProcess(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String orgId = request.getParameter("orgId");
        String orgName = request.getParameter("orgName");
        String workItemId = request.getParameter("workItemId");
        String activityId =  wfssServiceFacade.assignOtherUserProcess(orgId,orgName,workItemId);
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        Activity activity = wfCacheEngine.getActivityById(activityId);
        request.setAttribute("activity", activity);
        request.setAttribute("orgName", orgName);
        request.setAttribute("orgId", orgId);
        return mapping.findForward("assignOtherUserProcess_wfss");
    }
    
    public ActionForward jumpToOtherActivity(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String jumpOption = request.getParameter("jump_option");
        String jumpOrg = request.getParameter("jump_org");
        String workItemId = request.getParameter("workItemId");
        String jumpToActivity = request.getParameter("jump_to_activity");
        WorkItemDoing workItemDoing =  wfssServiceFacade.getWorkItemDoingById(workItemId);
        String appId = workItemDoing.getAppId();
        //对人员进行处理
        String [] itemOrgs=StringHelper.split(jumpOrg,"][");
        String orgIds=itemOrgs[0];
        String orgNames=itemOrgs[1];
        String orgTypes=itemOrgs[2];
        String [] orgIdsArr=StringHelper.split(orgIds,",");
        String [] orgNamesArr=StringHelper.split(orgNames,",");
        String [] orgTypesArr=StringHelper.split(orgTypes,",");
        List ownerOrgs=new ArrayList(); //处理者设置
        for(int j=0;j<orgIdsArr.length;j++)
        {
            WfOrg wfOrg=new WfOrg();
            wfOrg.setAppId(appId);
            wfOrg.setOrgId(orgIdsArr[j]);
            wfOrg.setOrgName(orgNamesArr[j]);
            wfOrg.setOrgType(orgTypesArr[j]);
            ownerOrgs.add(wfOrg);
        }
        String workItemDoen = wfssServiceFacade.jumpToOtherActivity(workItemDoing,ownerOrgs,jumpToActivity,jumpOption);
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        Activity activity= wfCacheEngine.getActivityById(jumpToActivity);
        
        request.setAttribute("ownerOrgs", ownerOrgs);
        request.setAttribute("toActivityObj", activity);
        request.setAttribute("fromActivityObj", wfCacheEngine.getActivityById(workItemDoing.getActivityId()));
        request.setAttribute("wfss_workItemDoenId", workItemDoen);
        return mapping.findForward("jumpToOtherActivity_wfss");
    }
    public ActionForward redoWorkItem(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String workItemId = request.getParameter("workItemId");
        String workItemingId  = wfssServiceFacade.redoWorkItem(workItemId);
        if (workItemingId!=null && !workItemingId.equals("0") && !workItemingId.equals("1")) {
            response.sendRedirect(request.getContextPath()+"/showWorkItemDoing_wfss.do?workItemId="+workItemingId);
            return null;
        }
        else {
            if (workItemingId!=null && workItemingId.equals("0")) {
                request.setAttribute("info_to_user", "会签环节，已有其它会签人进行了处理，不能重处理。请参考流程跟踪");
            }
            else {
                request.setAttribute("info_to_user", "下游环节已有人进行了处理，不能重处理。请参考流程跟踪");
            }
            request.setAttribute("wfss_workItemDoenId", workItemId);
            
        }
        return mapping.findForward("redoWorkItem");
    }
    
    public ActionForward listProcessInstByOrgId(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        //得到当前人的id
        HttpSession session=request.getSession();
        String orgId=WebHelper.getOrgId(session);
        Page page=(Page)request.getAttribute(Page.PAGE_INFO);
        List listProcessInst=wfssServiceFacade.listProcessInstByOrgId(page,orgId);
        request.setAttribute("listProcessInst",listProcessInst);
        return mapping.findForward("listProcessInstByOrgId");
        
    }
    
    public ActionForward showProcessInst(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        //得到当前人的id
        String id = request.getParameter("id");
        ProcessInstance processInstance = wfssServiceFacade.getProcessInstById(id);
        String processInstId = processInstance.getProcessInstanceId();
        String appId = processInstance.getAppId();
        HttpSession session=request.getSession();
        String orgId=WebHelper.getOrgId(session);
        String appFormId = processInstance.getAppFormId();
        WorkItemDoing workItemDoing = wfssServiceFacade.getWorkItemDoingProcessInst(processInstId,appId,appFormId,orgId);
        if (workItemDoing!=null) {
            response.sendRedirect(request.getContextPath() + "/showWorkItemDoing_wfss.do?workItemId="+workItemDoing.getWorkItemId());
            return null;
        }
        
        else {
            WorkItemDoen workItemDoen = wfssServiceFacade.getWorkItemDoenProcessInst(processInstId,appId,appFormId,orgId);
            if (workItemDoen!=null) {
                response.sendRedirect(request.getContextPath() + "/showWorkItemDoen_wfss.do?workItemId="+workItemDoen.getWorkItemId());
                return null;
            }
            
        }
        return null;
        
    }
    
    /**
     * 取消时的删除数据方式有两种，一种是热物理删除，一种是逻辑删改
     * 这个可以在流程中配置，并且在系统参数据中要配置一个取消删除数据方式
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ActionForward cancelProcessInst(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String workItemId = request.getParameter("workItemId");
        //得到流程实例id
        WorkItemDoing workItemDoing = wfssServiceFacade.getWorkItemDoingById(workItemId);
        String processInstanceId = "";
        
        if(workItemDoing!=null) {
            processInstanceId  = workItemDoing.getProcessInstanceId();
        }
        else {
            WorkItemDoen workItemDoen =  wfssServiceFacade.getWorkItemDoenById(workItemId);
            processInstanceId = workItemDoen.getProcessInstanceId();
        }
        //
        boolean b = wfssServiceFacade.cancelProcessInst(processInstanceId);
        if(b) {
            request.setAttribute("info_to_user", "流程实例取消成功!");
        }
        else {
            request.setAttribute("info_to_user", "流程实例暂时不能取消!");
        }
        
        return mapping.findForward("cancelProcessInst");
        
    }
    
    public ActionForward hangProcessInst(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String workItemId = request.getParameter("workItemId");
        request.setAttribute("wfss_workItemDoenId", workItemId);
        
        //得到流程实例id
        WorkItemDoing workItemDoing = wfssServiceFacade.getWorkItemDoingById(workItemId);
        String processInstanceId = "";
        
        if(workItemDoing!=null) {
            processInstanceId  = workItemDoing.getProcessInstanceId();
        }
        else {
            WorkItemDoen workItemDoen =  wfssServiceFacade.getWorkItemDoenById(workItemId);
            processInstanceId = workItemDoen.getProcessInstanceId();
        }
        //
        boolean b = wfssServiceFacade.hangProcessInst(processInstanceId);
        if (b) {
            request.setAttribute("info_to_user", "流程实例挂起成功!");
        }
        else {
            request.setAttribute("info_to_user", "流程实例暂时不能挂起!");
        }
        return mapping.findForward("hangProcessInst");
        
    }
    
    public ActionForward cancelHangProcessInst(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String workItemId = request.getParameter("workItemId");
        request.setAttribute("wfss_workItemDoenId", workItemId);
        
        //得到流程实例id
        WorkItemDoing workItemDoing = wfssServiceFacade.getWorkItemDoingById(workItemId);
        String processInstanceId = "";
        
        if(workItemDoing!=null) {
            processInstanceId  = workItemDoing.getProcessInstanceId();
        }
        else {
            WorkItemDoen workItemDoen =  wfssServiceFacade.getWorkItemDoenById(workItemId);
            processInstanceId = workItemDoen.getProcessInstanceId();
        }
        //
        boolean b = wfssServiceFacade.cancelHangProcessInst(processInstanceId);
        if (b) {
            request.setAttribute("info_to_user", "取消流程实例挂起成功!");
        }
        else {
            request.setAttribute("info_to_user", "流程实例暂时不能取消挂起!");
        }
        return mapping.findForward("cancelHangProcessInst");
        
    }
    
    
    
}
