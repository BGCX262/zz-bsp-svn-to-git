package com.youthor.bsp.core.wfss.common.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.youthor.bsp.core.abdf.common.AbdfCache;
import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.core.wfss.common.Constants;
import com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine;
import com.youthor.bsp.core.wfss.common.criterion.IActivityFormEvent;
import com.youthor.bsp.core.wfss.common.criterion.IProcessEndEvent;
import com.youthor.bsp.core.wfss.common.criterion.IReDoEvent;
import com.youthor.bsp.core.wfss.common.dao.IFlowEngineDAO;
import com.youthor.bsp.core.wfss.common.helper.FlowDataHelper;
import com.youthor.bsp.core.wfss.common.model.WfActorProperty;
import com.youthor.bsp.core.wfss.common.model.WfOrg;
import com.youthor.bsp.core.wfss.dao.IWorkItemDoingDao;
import com.youthor.bsp.core.wfss.model.Activity;
import com.youthor.bsp.core.wfss.model.ActivityInstance;
import com.youthor.bsp.core.wfss.model.Agent;
import com.youthor.bsp.core.wfss.model.Process;
import com.youthor.bsp.core.wfss.model.ProcessInstance;
import com.youthor.bsp.core.wfss.model.Route;
import com.youthor.bsp.core.wfss.model.WorkItemDoen;
import com.youthor.bsp.core.wfss.model.WorkItemDoing;
import com.youthor.bsp.view.wfss.common.criterion.WfExtFactory;


public class FlowEngineDAOImpl extends BaseDAOHibernate implements IFlowEngineDAO{

    protected Class getModelClass() {
        return null;
    }
    
    protected Class getActivityInstanceClass() {
        return com.youthor.bsp.core.wfss.model.ActivityInstance.class;
    }
    
    protected Class getProcessInstanceClass() {
        return ProcessInstance.class;
    }
    
     public void startup(Map map, String title,String appId)  {
            String processId=FlowDataHelper.getValueByKey("wfss_processId",map);
            String activityId=FlowDataHelper.getValueByKey("wfss_activityId",map);
            String workitemId=FlowDataHelper.getValueByKey("wfss_workItemId",map);
          //把业务表单传入
            IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
            String appFormId = wfCacheEngine.getActivityById(activityId).getAppFormId();
            map.put("wfss_appFormCode", wfCacheEngine.getAppFormById(appFormId).getAppFormCode());
            
            Org org=(Org)map.get(com.youthor.bsp.core.abdf.common.Constants.GLOBAL_ORG);
            WfOrg wfOrg= FlowDataHelper.orgToWfOrg(org);
            wfOrg.setAppId(appId);
            workitemId=this.startupDAO(wfOrg,processId,activityId,title);
            map.put("wfss_new_workItemId",workitemId);
            
       }
       
       public void run(Map map, String title,String appId)  {
            String wfAction=FlowDataHelper.getValueByKey("SUBMIT_WF_ACTION",map);
            //确保工作待办的存在
            String workitemId=FlowDataHelper.getValueByKey("wfss_workItemId",map);
            if (!StringHelper.isHasContent(workitemId)) {
                workitemId = (String)map.get("wfss_new_workItemId");
            }
          //把业务表单传入
            IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
            String activityId=FlowDataHelper.getValueByKey("wfss_activityId",map);
            String appFormId = wfCacheEngine.getActivityById(activityId).getAppFormId();
            map.put("wfss_appFormCode", wfCacheEngine.getAppFormById(appFormId).getAppFormCode());
            
            //得到当前用户并转为WfOrg,并为其设罢appid
            Org org=(Org)map.get(com.youthor.bsp.core.abdf.common.Constants.GLOBAL_ORG);
            WfOrg wfOrg= FlowDataHelper.orgToWfOrg(org);
            wfOrg.setAppId(appId);
            if(wfAction.equals("submit"))
            {
                //得到当前人的处理意见
                String option=FlowDataHelper.getValueByKey("SUBMIT_OPTION_VALUE",map);
                //得到路由信息
                List submitRouteInfo=FlowDataHelper.getSubmitRuoteInfo(appId,map);
                //把其放入map中，因为前台要用到这个对象数据
                map.put("wfss_submitRouteInfo",submitRouteInfo);
                String workItemDoenId=this.runDAO(workitemId, option,wfOrg, submitRouteInfo, title,map);
                map.put("wfss_workItemDoenId",workItemDoenId);
                
            }
            
       }
       

    private String startupDAO(WfOrg wfOrg, String processId, String activityId, String title) {
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        Process process=wfCacheEngine.getProcessById(processId);
        Activity activity=wfCacheEngine.getActivityById(activityId);
        Session session=super.getSession();
        //启动流程
        //1 : 保存流程实例
        ProcessInstance processInstance=new ProcessInstance();
        processInstance.setAppId(wfOrg.getAppId());
        processInstance.setCreateId(wfOrg.getOrgId());
        processInstance.setCreateName(wfOrg.getOrgName());
        processInstance.setProcessId(processId);
        processInstance.setProcessName(process.getProcessName());
        processInstance.setTitle(title);
        processInstance.setStatus(Constants.WF_LZ);
        processInstance.setSystemId(AbdfCache.app.getAppId());
        processInstance.setAppFormId(activity.getAppFormId());
        processInstance.setCreateTime(new Date());
        session.save(processInstance);

        //2:保存环节实例
        ActivityInstance activityInstance=new ActivityInstance();
        activityInstance.setActivityId(activity.getActivityId());
        activityInstance.setActivityName(activity.getActivityName());
        activityInstance.setAppId(wfOrg.getAppId());
        activityInstance.setCreateDate(new Date());
        activityInstance.setExecutorId(wfOrg.getOrgId());
        activityInstance.setExecutorName(wfOrg.getOrgName());
        activityInstance.setProcessId(processId);
        activityInstance.setNotifyOrgIds(wfOrg.getOrgId());
        activityInstance.setNotifyOrgNames(wfOrg.getOrgName());
        activityInstance.setProcessInstanceId(processInstance.getProcessInstanceId());
        activityInstance.setStatus(Constants.WF_DB);
        activityInstance.setSplitIds(StringHelper.doWithNull(activity.getSplitId()));
        session.save(activityInstance);
        //3:生成待办
        WorkItemDoing workItemDoing=new WorkItemDoing();
        workItemDoing.setActivityId(activity.getActivityId());
        workItemDoing.setActivityInstanceId(activityInstance.getActivityInstanceId());
        workItemDoing.setActivityName(activity.getActivityName());
        workItemDoing.setAppFormId(activity.getAppFormId());
        workItemDoing.setProcessId(process.getProcessId());
        workItemDoing.setProcessName(process.getProcessName());
        workItemDoing.setTitle(title);
        workItemDoing.setSenderName(wfOrg.getOrgName());
        workItemDoing.setAppId(wfOrg.getAppId());
        workItemDoing.setCreateDate(new Date());
        workItemDoing.setOwnerId(wfOrg.getOrgId());
        workItemDoing.setOwnerName(wfOrg.getOrgName());
        workItemDoing.setSenderId(wfOrg.getOrgId());
        workItemDoing.setProcessInstanceId(processInstance.getProcessInstanceId());
        workItemDoing.setStates(Constants.WF_CG);
        session.save(workItemDoing);
        return workItemDoing.getWorkItemId();
    }

    private String runDAO(String workitemId, String option, WfOrg wfOrg, List submitRouteInfo,String title,Map map) {
        //如果没有路由信息，则新建一个对象，这个应该是不存在的
        if(submitRouteInfo==null) submitRouteInfo=new ArrayList();
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        IWorkItemDoingDao WorkItemDoingDao=(IWorkItemDoingDao)SpringHelper.getBean("DAO_WorkItemDoingDao");
        //得到待办对象
        WorkItemDoing workItemDoing=WorkItemDoingDao.getWorkItemDoingById(workitemId);
        if(title==null || title.equals("")) title = workItemDoing.getTitle();
        //到得流程对象
        Process process=wfCacheEngine.getProcessById(workItemDoing.getProcessId());
        //得到父流程实例对象
        String parentActivityInstId = workItemDoing.getParentActivityInstId();
        
        Session session=super.getSession();//取hibernate的session
        ActivityInstance activityInstanceSave=(ActivityInstance)session.get(ActivityInstance.class,workItemDoing.getActivityInstanceId());//当前环节实例
        if(submitRouteInfo.size()>0) //当选取了路由提交时
        {
            for(int i=0;i<submitRouteInfo.size();i++)
            {
                //得到参与者对象
                WfActorProperty wfActorProperty=(WfActorProperty)submitRouteInfo.get(i);
                //有多少个人要生成下一个待办
                List ownerOrgs=wfActorProperty.getOwnerOrgs();
                Route route=wfActorProperty.getRoute();//当前路由信息
                String fromActivityId = route.getActivityId();//当前环节信息
                Activity fromActivity=wfCacheEngine.getActivityById(fromActivityId);
                //如果当前环节是会签环节，读取会签流向策略，如果是由最后一个人决定，则继续向下走,如果定了策略,如果达到策略值，继续向下走。
                //如果没有达到，删除代办，生成已办，更新环节实例。 
                //初始化下一环节的表单
                //是否有新的流程待办标题
                String newTitle = title;
                //得到要流向的下一环节
                String toActivityId = route.getToActivityId(); //暂时路由只能指定环节,以后扩展成可以通过扩展得到流向的环节???
                Activity toActivity=wfCacheEngine.getActivityById(toActivityId);
                //得到初始化表单事件
               
                String isRejectRoute = route.getIsRejectRoute() == null ? "" : route.getIsRejectRoute();
               //如果是回退路由的话.
                if (isRejectRoute.equals("Y")) {
                    String backFormEvent = toActivity.getBackFormEvent();
                    newTitle = changeWfOrgAppId(title, map, workItemDoing, ownerOrgs, backFormEvent);
                   
                }
                else {
                     //不是回退路由时要检查是否有表单初始化事件
                     String initFormEvent = toActivity.getInitFormEvent();
                     //初始化下一环节的表单结束
                     newTitle = changeWfOrgAppId(title, map, workItemDoing, ownerOrgs, initFormEvent);
                }
                boolean isNormal = true;
                 //得到环节操作类型,查看Constants中变量,4种
                 //处理会签&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
                String operateMode = StringHelper.doWithNull(fromActivity.getOperateMode());
                //当为串行/并行处理时
                if (operateMode.equals(Constants.WF_operateMode_LOOP) || operateMode.equals(Constants.WF_operateMode_AND)) {
                    //如果会签流转策略是按值决定.当为BY_VALUE时，当前环节不能配为多路分支,只能单路分支
                    //如果由最后一个人决定，则可以配多路分支出。
                    if (StringHelper.doWithNull(route.getXorStrategy()).equals("BY_VALUE")) {
                        //得到策略值
                        float  xorStrategyScale = route.getXorStrategyScale();
                        //得到所有的环节实例[兄弟环节实例]
                        List allActivityInst = getActivityInstByparentId(parentActivityInstId);
                        float ybNum = 1; //已办初始值，为1是因为当前人已作出了决定了，为已办.
                        int dbNum = 0;//待办
                        int all = 0;//总共有多少人参考会签
                        if (allActivityInst!=null && allActivityInst.size()>0) { //这个是不应该为空的
                            all = allActivityInst.size();
                            for (int j = 0;j<all;j++) {
                                //得到环节实例
                                ActivityInstance activityInstance = (ActivityInstance)allActivityInst.get(j);
                                //得到处理状态
                                String status = activityInstance.getStatus()==null? "":activityInstance.getStatus();
                                //得出想得交到的环节
                                String wantToActivityId = activityInstance.getWantToActivityId()==null?"":activityInstance.getWantToActivityId();
                                //计算出已办中有多少人选择了那个环节，还有多少人没有处理
                                if (!status.equals(Constants.WF_YB)) {
                                    dbNum++;
                                }
                                else if (status.equals(Constants.WF_YB) && wantToActivityId.equals(route.getToActivityId())) {
                                    ybNum++;
                                }
                            }
                            //得出实际值
                            float realScale = (ybNum/all)*100;
                            //如果说还没有达到配置的值，流程不向下走，只是处理完成当前人的待办
                            if (realScale < xorStrategyScale) {
                                isNormal = false;
                                activityInstanceSave =(ActivityInstance)session.get(ActivityInstance.class,workItemDoing.getActivityInstanceId());
                                //设置当前处理想提交到那个环节
                                activityInstanceSave.setWantToActivityId(route.getToActivityId());
                                ActivityInstance activityInstance=new ActivityInstance();
                                activityInstance.setActivityId(workItemDoing.getActivityId());
                                activityInstance.setActivityName(workItemDoing.getActivityName());
                                //以下两个参数没有意义
                                activityInstance.setToActivityId(workItemDoing.getActivityId());
                                activityInstance.setToActivityName(workItemDoing.getActivityName());
                                //这种环节实例只对流程跟踪是有意义的。
                                activityInstance.setAppId(workItemDoing.getAppId());
                                activityInstance.setCreateDate(new Date());
                                activityInstance.setExecutorId("");
                                activityInstance.setExecutorName("");
                                activityInstance.setProcessId(workItemDoing.getProcessId());
                                activityInstance.setProcessInstanceId(workItemDoing.getProcessInstanceId());
                                activityInstance.setParentActivityInstId(workItemDoing.getActivityInstanceId());
                                activityInstance.setStatus("");
                                activityInstance.setSubmitStatus(Constants.WF_TLZ);
                                activityInstance.setNotifyOrgIds(workItemDoing.getOwnerId());
                                activityInstance.setShowOrder(0);
                                activityInstance.setNotifyOrgNames(workItemDoing.getOwnerName());
                                session.save(activityInstance);
                                map.put("PROCESS_IS_NEXT", "N");//表示层要使用。说明流程没有向下走
                            }
                            else {
                                //如果已达到了配置的值,收回所有待办，把其它人代办转为已办．并且环节实例中修改成他人"收回"
                                List doingWorkItem = getDoingWorkItemByParentIdExceptionSelf(parentActivityInstId,workItemDoing.getWorkItemId());
                                if (doingWorkItem!=null&&doingWorkItem.size()>0) {
                                    for(int j=0;j<doingWorkItem.size();j++) {
                                        WorkItemDoing doingWorkItemDel = (WorkItemDoing)doingWorkItem.get(j);
                                        processCreateDoenWorkItemLoop(option,doingWorkItemDel, session, null,title);
                                    }
                                }
                            }
                        }
                    }
                }
                 //处理会签结束&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
                if (isNormal) {
                    if(route.getIsPointToEnd()!=null&&route.getIsPointToEnd().equals("N"))
                    {
                        processCreateDoingWorkItem(wfOrg, newTitle,workItemDoing, session, ownerOrgs, route,activityInstanceSave);
                    }
                    else //流程结束
                    {
                        processFlowEnd(wfOrg, map, workItemDoing,process, session, route);
                    }
                }
            }
        }
        else //当没有选落由提交时
        {
            activityInstanceSave = processNoRouteBySelect(wfCacheEngine,workItemDoing, session, activityInstanceSave);
            
        }
            //2:生成已办
            String workItemDoen = processCreateDoenWorkItem(option,workItemDoing, session, activityInstanceSave,title);
            return workItemDoen;
    
        
    }

    public String changeWfOrgAppId(String title, Map map,
            WorkItemDoing workItemDoing, List ownerOrgs, 
            String initFormEvent) {
        String newTitle = title;
        //如果有初始化表单事件，这主要是用在一个流程多个表单的情况(当前环节与下一环节表单不一样)。
        //或者是一个一个表单(当前环节与下一环节表单一样),但是下一环节处理前要做一些业务处理时用到
        //这个方法还处理回退时事件
        if (initFormEvent!=null && !initFormEvent.equals("")) {
            IActivityFormEvent activityFormEvent = (IActivityFormEvent)WfExtFactory.getFlowEvent(initFormEvent);
            if (activityFormEvent!=null) {
                 Map mapNextFormInfo = activityFormEvent.execute(map,workItemDoing.getAppId(),this.getSession(),ownerOrgs);
                 newTitle = mapNextFormInfo.get("NEW_PROCESS_FORM_TITLE") != null ? 
                         (String) mapNextFormInfo.get("NEW_PROCESS_FORM_TITLE") : title;
                 String newAppId = (String)mapNextFormInfo.get("NEW_PROCESS_FORM_ID");
                 //所有这个环节的人员的appId都要修改。
                 //修改FlowDataHelper.getSubmitRuoteInfo中设置的appid,因为有新的appid.只有生成新的id才设
                 if(newAppId!=null && !newAppId.equals("")) { 
                     if(ownerOrgs!=null && ownerOrgs.size()>0) {
                         for(int n = 0;n<ownerOrgs.size();n++) {
                            WfOrg wfOrgTemp=(WfOrg)ownerOrgs.get(n);
                            wfOrgTemp.setAppId(newAppId);
                         }
                     }
                 }
            }
        }
        //返回新的待办id
        return newTitle;
    }

    public List getDoingWorkItemByParentIdExceptionSelf(String parentActivityInstId, String workItemId) {
        String hql="from "+WorkItemDoing.class.getName() +" as a where a.parentActivityInstId='"+parentActivityInstId+"' and a.workItemId != '"+workItemId+"'";
        return this.doFind(hql);
    }

    public List getActivityInstByparentId(String parentActivityInstId) {
        String hql="from "+ActivityInstance.class.getName() +" as a where a.parentActivityInstId='"+parentActivityInstId+"'";
        return this.doFind(hql);
    }

    private String processCreateDoenWorkItem(String option,
            WorkItemDoing workItemDoing, Session session,
            ActivityInstance activityInstanceSave,String title) {
        String workItemDoen=createWorkItemDoen(workItemDoing,title);
        if(activityInstanceSave==null)
            activityInstanceSave =(ActivityInstance)session.get(ActivityInstance.class,workItemDoing.getActivityInstanceId());
        activityInstanceSave.setStatus(Constants.WF_YB);
        activityInstanceSave.setCompleteDate(new Date());
        activityInstanceSave.setExecuteMsg(option);
        session.update(activityInstanceSave);
        session.delete(workItemDoing);
        return workItemDoen;
    }
    
    private String processCreateDoenWorkItemLoop(String option, WorkItemDoing workItemDoing, Session session,
        ActivityInstance activityInstanceSave,String title) {
        String workItemDoen=createWorkItemDoen(workItemDoing,title);
        //得到当前待办的环节实例
        if(activityInstanceSave==null) {
            activityInstanceSave =(ActivityInstance)session.get(ActivityInstance.class,workItemDoing.getActivityInstanceId());
        }
        activityInstanceSave.setStatus(Constants.WF_SHDB);
        activityInstanceSave.setCompleteDate(new Date());
        activityInstanceSave.setExecuteMsg(option);
        session.update(activityInstanceSave);
        session.delete(workItemDoing);
        return workItemDoen;
    }

    private void processCreateDoingWorkItem(WfOrg wfOrg, String title, WorkItemDoing workItemDoing,
             Session session, List ownerOrgs, Route route, ActivityInstance activityInstanceSave ) {
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        //得到要流向的环节
        Activity toActivity=wfCacheEngine.getActivityById(route.getToActivityId());
        //下一环节是否为聚合环节
        String joinId = toActivity.getJoinId();
        //当为集合环节时
        if(joinId!=null && !joinId.trim().equals("") && !joinId.trim().equalsIgnoreCase("null")) {
            String joinMode = toActivity.getJoinMode()==null ? "" : toActivity.getJoinMode();
            //如果为单一聚合,要check这个环节(toActivity)是否有待办生成，如果有，则不再生成待办，如果没有，则生成待办
            if(joinMode.equals("XOR")) {
                 String hql = "from "+ActivityInstance.class.getName() + " as a where a.processInstanceId = '"+workItemDoing.getProcessInstanceId()
                 +"' and a.toActivityId = '"+toActivity.getActivityId()+"' and a.status != '"+Constants.WF_YB+"'";
                 List joinModeXorList = session.createQuery(hql).list();
                 if(joinModeXorList!=null && joinModeXorList.size()>0) {
                   createNoUseActIns(workItemDoing, session, toActivity);
                   return;
                 }
                 
            }
            else if (joinMode.equals("AND")) {
               //当没有选择人员时，则不要生成下级待办.
               if (ownerOrgs == null || ownerOrgs.size()==0) {
                  createNoUseActIns(workItemDoing, session, toActivity);
                  return;
               }
            }
            else if (joinMode.equals("OR")) {
                //执行后台策略
                //当没有选择人员时，则不要生成下级待办.
                if (ownerOrgs == null || ownerOrgs.size()==0) {
                   createNoUseActIns(workItemDoing, session, toActivity);
                   
                   return;
                }
             }
        }
       
        //如果没有选择人员，工作流引擎不做任何处理
        if(ownerOrgs!=null&&ownerOrgs.size()>0)
        {
            for(int j=0;j<ownerOrgs.size();j++)
            {
                WfOrg wfOrgExe=(WfOrg)ownerOrgs.get(j);
                //处理代理
                Agent agent = wfCacheEngine.getAgentById(wfOrgExe.getOrgId());
                if (agent!=null) {
                    //还要计划时间是否在设置内和代理有类型也要处理
                   wfOrgExe.setIsAgentedOrgId(agent.getOrgId());
                   wfOrgExe.setIsAgentedOrgName(agent.getOrgName());
                   wfOrgExe.setOrgId(agent.getAgentOrgId());
                   wfOrgExe.setOrgName(agent.getAgentOrgName());
                }
                ActivityInstance activityInstance= null;
                //3:生成待办
                //顺序会签处理
                if(StringHelper.doWithNull(toActivity.getOperateMode()).equals(Constants.WF_operateMode_LOOP))
                {
                    if(j==0)
                    {
                        activityInstance=createActivityInstance(wfOrg, workItemDoing, session, route, wfOrgExe,toActivity,j,Constants.WF_SUBMIT_STATES_TJ,Constants.WF_DB,activityInstanceSave);
                        createWorkItemDoing(wfOrg, title, workItemDoing, session, route, wfOrgExe, toActivity, activityInstance,Constants.WF_DB);
                    }
                    else
                    {
                        activityInstance=createActivityInstance(wfOrg, workItemDoing, session, route, wfOrgExe,toActivity,j,Constants.WF_SUBMIT_STATES_TZ,Constants.WF_DDJH,activityInstanceSave);
                        createWorkItemDoing(wfOrg, title, workItemDoing, session, route, wfOrgExe, toActivity, activityInstance,Constants.WF_DD);
                    }
                }//多个消息一人处理时生成的待办
                else if(StringHelper.doWithNull(toActivity.getOperateMode()).equals(Constants.WF_operateMode_OR))
                {
                    activityInstance=createActivityInstance(wfOrg, workItemDoing, session, route, wfOrgExe,toActivity,j,Constants.WF_SUBMIT_STATES_TJ,Constants.WF_DDQR,activityInstanceSave);
                    createWorkItemDoing(wfOrg, title, workItemDoing, session, route, wfOrgExe, toActivity, activityInstance,Constants.WF_DDQR);
                }
                
                else
                {
                    activityInstance=createActivityInstance(wfOrg, workItemDoing, session, route, wfOrgExe,toActivity,j,Constants.WF_SUBMIT_STATES_TJ,Constants.WF_DB,activityInstanceSave);
                    createWorkItemDoing(wfOrg, title, workItemDoing, session, route, wfOrgExe, toActivity, activityInstance,Constants.WF_DB);
                }
            }
        }
    }

    private void createNoUseActIns(WorkItemDoing workItemDoing,
            Session session, Activity toActivity) {
        ActivityInstance activityInstance=new ActivityInstance();
             activityInstance.setActivityId(workItemDoing.getActivityId());
             activityInstance.setActivityName(workItemDoing.getActivityName());
             //以下两个参数没有意义
             activityInstance.setToActivityId(toActivity.getActivityId());
             activityInstance.setToActivityName(toActivity.getActivityName());
             //这种环节实例只对流程跟踪是有意义的。
             activityInstance.setAppId(workItemDoing.getAppId());
             activityInstance.setCreateDate(new Date());
             activityInstance.setExecutorId("");
             activityInstance.setExecutorName("");
             activityInstance.setProcessId(workItemDoing.getProcessId());
             activityInstance.setProcessInstanceId(workItemDoing.getProcessInstanceId());
             activityInstance.setParentActivityInstId(workItemDoing.getActivityInstanceId());
             activityInstance.setStatus("");
             activityInstance.setSubmitStatus(Constants.WF_SUBMIT_STATES_TJ);
             activityInstance.setNotifyOrgIds(workItemDoing.getOwnerId());
             activityInstance.setShowOrder(0);
             activityInstance.setNotifyOrgNames(workItemDoing.getOwnerName());
             session.save(activityInstance);
            return;
    }

    private void processFlowEnd(WfOrg wfOrg, Map map,
            WorkItemDoing workItemDoing,
            Process process, Session session, Route route) {
        //1:得到流程实例对象，把其状态设为JS(结束)
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        Activity toActivity=wfCacheEngine.getActivityById(route.getToActivityId());
        //如果toActivity是某个分支的聚合点，还要加入判断是否还有待办没有完成，如果没有
        //完成，则还不允许结束此流程
        String processInstanceId=workItemDoing.getProcessInstanceId();
        ProcessInstance processInstance=(ProcessInstance) session.get(ProcessInstance.class,processInstanceId);
        processInstance.setStatus(Constants.WF_JS);
        ActivityInstance activityInstance= createActivityInstanceJS(wfOrg, workItemDoing, session, route ,toActivity);
        //处理流程结束事件
        String onEndEvent=process.getOnEndEvent();
        if(onEndEvent!=null&&!onEndEvent.equals(""))
        {
            IProcessEndEvent processEndEvent=wfCacheEngine.getProcessEndEvent(onEndEvent);
            //流程结束后启动新的流程的demo还没有完成
            processEndEvent.execute(session,map);
        }
    }
    private ActivityInstance createActivityInstanceJS(WfOrg wfOrg, WorkItemDoing workItemDoing, Session session, Route route,  Activity toActivity) {
        ActivityInstance activityInstance=new ActivityInstance();
        activityInstance.setActivityId(workItemDoing.getActivityId());
        activityInstance.setActivityName(workItemDoing.getActivityName());
        activityInstance.setToActivityId(route.getToActivityId());
        activityInstance.setToActivityName(toActivity.getActivityName());
        activityInstance.setAppId(workItemDoing.getAppId());
        activityInstance.setCreateDate(new Date());
        activityInstance.setExecutorId(wfOrg.getOrgId());
        activityInstance.setExecutorName(wfOrg.getOrgName());
        activityInstance.setProcessId(workItemDoing.getProcessId());
        activityInstance.setProcessInstanceId(workItemDoing.getProcessInstanceId());
        activityInstance.setParentActivityInstId(workItemDoing.getActivityInstanceId());
        activityInstance.setStatus(Constants.WF_JS);
        activityInstance.setNotifyOrgIds(workItemDoing.getOwnerId());
        activityInstance.setNotifyOrgNames(workItemDoing.getOwnerName());
        session.save(activityInstance);
        return activityInstance;
    }
    private ActivityInstance processNoRouteBySelect(
            IWFCacheEngine wfCacheEngine, WorkItemDoing workItemDoing,
            Session session, ActivityInstance activityInstanceSave) {
        //如果当前环节是顺序会签时，没有选落由时是激活下一个顺序会签的待办
        Activity currctivity=wfCacheEngine.getActivityById(workItemDoing.getActivityId());
        if(currctivity.getOperateMode().equals(Constants.WF_operateMode_LOOP))
        {
            
            //得到父环节实例和排序号
            activityInstanceSave =(ActivityInstance)session.get(ActivityInstance.class,workItemDoing.getActivityInstanceId());
            String parentActivityInstId=activityInstanceSave.getParentActivityInstId();
            int orderIndex=activityInstanceSave.getShowOrder()+1;
            //得到下一个处理的环节实例对象
            String hql="from "+ActivityInstance.class.getName() +" as a where a.parentActivityInstId='"+parentActivityInstId+"' and a.showOrder="+orderIndex;
            Query query=session.createQuery(hql);
            List loopActivityInstance=query.list();
            ActivityInstance ActivityInstanceLoop=(ActivityInstance)loopActivityInstance.get(0);
            ActivityInstanceLoop.setStatus(Constants.WF_DB);
            ActivityInstanceLoop.setSubmitStatus(Constants.WF_SUBMIT_STATES_TJ);
            session.update(ActivityInstanceLoop);
            //根据环节实例id得到待办对象，使之可以处理
            hql="from "+WorkItemDoing.class.getName()+" as w where w.activityInstanceId='"+ActivityInstanceLoop.getActivityInstanceId()+"'";
            query=session.createQuery(hql);
            List workItemDoingList=query.list();
            WorkItemDoing workItemDoingLoop=(WorkItemDoing)workItemDoingList.get(0);
            workItemDoingLoop.setStates(Constants.WF_DB);
            session.update(workItemDoingLoop);
            
            //此环节实例只对流程跟随有意义
            ActivityInstance activityInstance=new ActivityInstance();
            activityInstance.setActivityId(workItemDoing.getActivityId());
            activityInstance.setActivityName(workItemDoing.getActivityName());
            activityInstance.setToActivityId(workItemDoing.getActivityId());
            activityInstance.setToActivityName(workItemDoing.getActivityName());
            activityInstance.setAppId(workItemDoing.getAppId());
            activityInstance.setCreateDate(new Date());
            activityInstance.setExecutorId("");
            activityInstance.setExecutorName("");
            activityInstance.setProcessId(workItemDoing.getProcessId());
            activityInstance.setProcessInstanceId(workItemDoing.getProcessInstanceId());
            activityInstance.setParentActivityInstId(workItemDoing.getActivityInstanceId());
            activityInstance.setStatus("");
            activityInstance.setSubmitStatus(Constants.WF_JH);
            activityInstance.setNotifyOrgIds(workItemDoingLoop.getOwnerId());
            activityInstance.setShowOrder(0);
            activityInstance.setNotifyOrgNames(workItemDoingLoop.getOwnerName());
            session.save(activityInstance);
            
        }
        else if(currctivity.getOperateMode().equals(Constants.WF_operateMode_AND))
        {
            //此环节实例只对流程跟随有意义
            ActivityInstance activityInstance=new ActivityInstance();
            activityInstance.setActivityId(workItemDoing.getActivityId());
            activityInstance.setActivityName(workItemDoing.getActivityName());
            activityInstance.setToActivityId(workItemDoing.getActivityId());
            activityInstance.setToActivityName(workItemDoing.getActivityName());
            activityInstance.setAppId(workItemDoing.getAppId());
            activityInstance.setCreateDate(new Date());
            activityInstance.setExecutorId("");
            activityInstance.setExecutorName("");
            activityInstance.setProcessId(workItemDoing.getProcessId());
            activityInstance.setProcessInstanceId(workItemDoing.getProcessInstanceId());
            activityInstance.setParentActivityInstId(workItemDoing.getActivityInstanceId());
            activityInstance.setStatus("");
            activityInstance.setSubmitStatus(Constants.WF_TLZ);
            activityInstance.setNotifyOrgIds(workItemDoing.getOwnerId());
            activityInstance.setShowOrder(0);
            activityInstance.setNotifyOrgNames(workItemDoing.getOwnerName());
            session.save(activityInstance);
        }
        return activityInstanceSave;
    }

    private void createWorkItemDoing(WfOrg wfOrg, String title, WorkItemDoing workItemDoing, Session session, Route route, WfOrg wfOrgExe, Activity toActivity, ActivityInstance activityInstance,String states) {
        WorkItemDoing workItemDoingSave=new WorkItemDoing();//要生成的待办
        workItemDoingSave.setActivityId(route.getToActivityId());//设置待办的id
        workItemDoingSave.setParentActivityInstId(activityInstance.getParentActivityInstId());
        workItemDoingSave.setActivityInstanceId(activityInstance.getActivityInstanceId());
        workItemDoingSave.setProcessInstanceId(workItemDoing.getProcessInstanceId());
        workItemDoingSave.setActivityName(toActivity.getActivityName());
        workItemDoingSave.setAppFormId(toActivity.getAppFormId());
        workItemDoingSave.setProcessId(workItemDoing.getProcessId());
        workItemDoingSave.setProcessName(workItemDoing.getProcessName());
        workItemDoingSave.setTitle(title);
        workItemDoingSave.setSenderName(wfOrg.getOrgName());
        workItemDoingSave.setAppId(wfOrgExe.getAppId());
        workItemDoingSave.setCreateDate(new Date());
        workItemDoingSave.setOwnerId(wfOrgExe.getOrgId());
        workItemDoingSave.setOwnerName(wfOrgExe.getOrgName());
        workItemDoingSave.setSenderId(wfOrg.getOrgId());
        workItemDoingSave.setStates(states);
        workItemDoingSave.setIsAgentedOrgId(wfOrgExe.getIsAgentedOrgId());
        workItemDoingSave.setIsAgentedOrgName(wfOrgExe.getIsAgentedOrgName());
        session.save(workItemDoingSave);
    }

    private ActivityInstance createActivityInstance(WfOrg wfOrg, WorkItemDoing workItemDoing, 
          Session session, Route route, WfOrg wfOrgExe, Activity toActivity,
          int j,String submitStates,String states,ActivityInstance currActivityInstance ) {
        ActivityInstance activityInstance=new ActivityInstance();
        activityInstance.setActivityId(workItemDoing.getActivityId());
        //在此要设置splitIds
        String currActivityId = workItemDoing.getActivityId();
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        Activity currActivity = wfCacheEngine.getActivityById(currActivityId);
        String splitId = StringHelper.doWithNull(currActivity.getSplitId());
        String allSplitIds = "";
        String actSplitIds = StringHelper.doWithNull(currActivityInstance.getSplitIds());
        if (!actSplitIds.equals("")) {
            if (!splitId.equals("")) {
                if(actSplitIds.indexOf(splitId)<0) {
                  allSplitIds = actSplitIds+","+splitId;
                }
                else {
                    allSplitIds = actSplitIds;
                }
            }
            else {
                allSplitIds = actSplitIds;
            }
        }
        else {
           if (!splitId.equals("")) {
               allSplitIds = splitId;
            }
        }
      
        String joinId = toActivity.getJoinId();
       
        //如果当前环节有聚合id,要把聚合的id从splitId移除,不支持一个环节为两个分支的聚合
        if(joinId!=null && !joinId.equals("") && !joinId.equalsIgnoreCase("null")) {
            String [] arrallSplitIds = StringHelper.split(allSplitIds, ",");
            if(arrallSplitIds!=null && arrallSplitIds.length>0) {
                allSplitIds = "";
                for (int i=0;i<arrallSplitIds.length;i++){
                    if(!arrallSplitIds[i].equals(joinId)) {
                        allSplitIds = arrallSplitIds[i] + allSplitIds+",";
                    }
                }
            }
            if(allSplitIds!=null && !allSplitIds.equals("")) {
                allSplitIds = allSplitIds.substring(0,allSplitIds.length()-1);
            }
        }
        
        
        String operateMode = toActivity.getOperateMode();
        //路由分单
        if(operateMode!=null && operateMode.equals("LYHD")) {
            String routeSplitId = toActivity.getRouteSplitId();
           if (routeSplitId!=null && !routeSplitId.equals("")) {
              if (allSplitIds!=null && !allSplitIds.equals(""))
              allSplitIds = allSplitIds+ ","+routeSplitId;
           }
           else {
        	   allSplitIds = routeSplitId;
           }
        }
        activityInstance.setSplitIds(allSplitIds);
        //activityInstance.setWantToActivityId(route.getToActivityId());
        activityInstance.setActivityName(workItemDoing.getActivityName());
        activityInstance.setToActivityId(route.getToActivityId());
        activityInstance.setToActivityName(toActivity.getActivityName());
        activityInstance.setAppId(wfOrgExe.getAppId());
        activityInstance.setCreateDate(new Date());
        activityInstance.setExecutorId(wfOrgExe.getOrgId());
        activityInstance.setExecutorName(wfOrgExe.getOrgName());
        activityInstance.setProcessId(workItemDoing.getProcessId());
        activityInstance.setProcessInstanceId(workItemDoing.getProcessInstanceId());
        activityInstance.setParentActivityInstId(workItemDoing.getActivityInstanceId());
        activityInstance.setStatus(states);
        activityInstance.setSubmitStatus(submitStates);
        activityInstance.setNotifyOrgIds(workItemDoing.getOwnerId());
        activityInstance.setIsAgentedOrgId(wfOrgExe.getIsAgentedOrgId());
        activityInstance.setIsAgentedOrgName(wfOrgExe.getIsAgentedOrgName());
        activityInstance.setShowOrder(j);
        activityInstance.setNotifyOrgNames(workItemDoing.getOwnerName());
        session.save(activityInstance);
        return activityInstance;
    }
    
    
    

    public String createWorkItemDoen(WorkItemDoing workItemDoing,String title) {
        //生成已办
        //如果同一个实例，同一个业务类型，和一条业务数据数据，同一个。待办已有，要先删除。
        Session session = this.getSession();
        String hql="from "+WorkItemDoen.class.getName()+" as w where w.processInstanceId='"+workItemDoing.getProcessInstanceId()+"'" +
                " and w.appId='"+workItemDoing.getAppId()+"' and w.appFormId='"+workItemDoing.getAppFormId()+"' and w.ownerId='"+workItemDoing.getOwnerId()+"'";
        List deleteDe=session.createQuery(hql).list();
        if(deleteDe!=null&&deleteDe.size()>0)
        {
            for(int de=0;de<deleteDe.size();de++)
            {
                session.delete((WorkItemDoen)deleteDe.get(de));
            }
        }
        WorkItemDoen workItemDoen=new WorkItemDoen();
        workItemDoen.setWorkItemId(workItemDoing.getWorkItemId());
        workItemDoen.setActivityId(workItemDoing.getActivityId());//设置待办的id
        
        workItemDoen.setActivityInstanceId(workItemDoing.getActivityInstanceId());
        workItemDoen.setProcessInstanceId(workItemDoing.getProcessInstanceId());
        workItemDoen.setParentActivityInstId(workItemDoing.getParentActivityInstId());
        workItemDoen.setActivityName(workItemDoing.getActivityName());
        workItemDoen.setActivityId(workItemDoing.getActivityId());
        workItemDoen.setAppFormId(workItemDoing.getAppFormId());
        workItemDoen.setProcessId(workItemDoing.getProcessId());
        workItemDoen.setProcessName(workItemDoing.getProcessName());
        workItemDoen.setTitle(title);
        workItemDoen.setSenderName(workItemDoing.getSenderName());
        workItemDoen.setAppId(workItemDoing.getAppId());
        workItemDoen.setCreateDate(workItemDoing.getCreateDate());
        workItemDoen.setOwnerId(workItemDoing.getOwnerId());
        workItemDoen.setOwnerName(workItemDoing.getOwnerName());
        workItemDoen.setSenderId(workItemDoing.getSenderId());
        workItemDoen.setCompleteDate(new Date());
        workItemDoen.setIsAgentedOrgId(workItemDoing.getIsAgentedOrgId());
        workItemDoen.setIsAgentedOrgName(workItemDoing.getIsAgentedOrgName());
        session.save(workItemDoen);
        return workItemDoen.getWorkItemId();
    }

    public List listWfProcessTraceByIdWorkItemId(String processInstanceId) {
        String hql="from "+getActivityInstanceClass().getName()+" as a where a.processInstanceId=? order by a.createDate";
        List para=new ArrayList();
        para.add(processInstanceId);
        return this.doFindObjectListByParam(hql,para);
    }

    public ProcessInstance getProcessInstanceById(String processInstanceId) {
        String hql="from "+getProcessInstanceClass().getName()+" as p where p.processInstanceId='"+processInstanceId+"'";
        List list=super.doFind(hql);
        if(list!=null&&list.size()>0)
        {
            return (ProcessInstance)list.get(0);
        }
            
        return null;
    }

    public void affirmDoThisWorkItem(Map pagePar) {
        String processId=FlowDataHelper.getValueByKey("wfss_processId",pagePar);
        String activityId=FlowDataHelper.getValueByKey("wfss_activityId",pagePar);
        String workitemId=FlowDataHelper.getValueByKey("wfss_workItemId",pagePar);
        Org org=(Org)pagePar.get(com.youthor.bsp.core.abdf.common.Constants.GLOBAL_ORG);
        IWorkItemDoingDao WorkItemDoingDao=(IWorkItemDoingDao)SpringHelper.getBean("DAO_WorkItemDoingDao");
        WorkItemDoing workItemDoing=WorkItemDoingDao.getWorkItemDoingById(workitemId);
        
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        Process process=wfCacheEngine.getProcessById(workItemDoing.getProcessId());
        //把当前等待确认待办修改成真正的办.
        Session session=super.getSession();
        workItemDoing.setStates(Constants.WF_DB);
        session.update(workItemDoing);
        //根据环节实例id得到环节实例对象
        ActivityInstance activityInstance=(ActivityInstance) session.get(ActivityInstance.class,workItemDoing.getActivityInstanceId());
        activityInstance.setStatus(Constants.WF_DB);
        session.update(activityInstance);
        //找到所有其它流程实例，修改成"他人代办"
        String hql="from "+ActivityInstance.class.getName() +" as a where a.parentActivityInstId='"+activityInstance.getParentActivityInstId()+"' and a.status='"+Constants.WF_DDQR+"'";
        Query query=session.createQuery(hql);
        List activityInstanceList=query.list();
        if(activityInstanceList!=null&&activityInstanceList.size()>0)
        {
            for(int i=0;i<activityInstanceList.size();i++)
            {
                ActivityInstance activityInstanceTemp=(ActivityInstance) activityInstanceList.get(i);
                activityInstanceTemp.setStatus(Constants.WF_TRDB);
                session.update(activityInstanceTemp);
            }
        }
        //找到其它待办对象，进行删除，同时这些待办信息转为已办
        hql="from "+WorkItemDoing.class.getName()+" as w where w.activityInstanceId in " +
                "(select ai.activityInstanceId from "+ActivityInstance.class.getName()+" as ai where ai.parentActivityInstId='"+activityInstance.getParentActivityInstId()+"') " +
                "and w.states='"+Constants.WF_DDQR+"'";
        query=session.createQuery(hql);
        List workItemDoingList=query.list();
        if(workItemDoingList!=null&&workItemDoingList.size()>0)
        {
            for(int i=0;i<workItemDoingList.size();i++)
            {
                WorkItemDoing  workItemDoingTemp=(WorkItemDoing)workItemDoingList.get(i);
                session.delete(workItemDoingTemp);
                createWorkItemDoen(workItemDoingTemp,workItemDoing.getTitle());
            }
        }
        //执行业务操作扩展(待完善)
    }


    public List getExecuteUserByProInsIdAndActId(String processInstanceId,String activityId) {
        String hql="from "+ActivityInstance.class.getName() +" as a where a.processInstanceId='"+processInstanceId+"' and a.activityId='"+activityId+"'";
        List list = this.doFind(hql);
        List returnValue = new ArrayList();
        if (list!=null&&list.size()>0) {
            for(int i=0;i<list.size();i++) {
                ActivityInstance activityInstance = (ActivityInstance)list.get(i);
                String notifyOrgIds = activityInstance.getNotifyOrgIds()==null?"":activityInstance.getNotifyOrgIds();
                if (returnValue.isEmpty()) {
                    returnValue.add(activityInstance);
                }
                else {
                    boolean isAdd = true;
                    for (int j=0;j<returnValue.size();j++) {
                        ActivityInstance activityInstanceTemp = (ActivityInstance)returnValue.get(j);
                        String notifyOrgIdsTemp = activityInstanceTemp.getNotifyOrgIds()==null ?"":activityInstanceTemp.getNotifyOrgIds();
                        if(notifyOrgIdsTemp.equals(notifyOrgIds)) {
                            isAdd = false;
                        }
                    }
                    if(isAdd) {
                        returnValue.add(activityInstance);
                    }
                }
            }
        }
        return returnValue;
    }

    
    public ActivityInstance getActivityInstById(String activityInstanceId) {
        return (ActivityInstance)this.getSession().get(ActivityInstance.class, activityInstanceId);
        
    }

  
    public void updateActivityInstance(ActivityInstance activityInstance) {
        this.getSession().update(activityInstance);
        
    }

    
    public void addActivityInstance(ActivityInstance activityInstanceNew) {
        this.getSession().save(activityInstanceNew);
        
    }

    
    public int getYBNumByPAIIdWithLoopAnd(String parentActivityInstId,
            String activityInstanceId) {
         Session session=super.getSession();
         Query query=null;
         List l=null;
         String hql = "select count(*) as num from "+ActivityInstance.class.getName() + " as a where (a.status = '"+Constants.WF_YB+"' or a.status = '"+Constants.WF_SHDB+"') and a.activityInstanceId != '"+activityInstanceId+"' and a.parentActivityInstId = '"+parentActivityInstId+"'" ;
         int returnValue=0;
           query = session.createQuery(hql);
         l = query.list();
            if (l != null && !l.isEmpty()) {
                returnValue = ((Integer) l.get(0)).intValue();
            }
            return returnValue;
    }


    public int getYBNumByPAIId(String parentActivityInstId) {
         Session session=super.getSession();
         Query query=null;
         List l=null;
         String hql = "select count(*) as num from "+ActivityInstance.class.getName() + " as a where (a.status = '"+Constants.WF_YB+"' or a.status = '"+Constants.WF_SHDB+"') and a.parentActivityInstId = '"+parentActivityInstId+"'" ;
         int returnValue=0;
           query = session.createQuery(hql);
         l = query.list();
            if (l != null && !l.isEmpty()) {
                returnValue = ((Integer) l.get(0)).intValue();
            }
            return returnValue;
    }

    
    public void deleteActivityInstance(ActivityInstance activityInstance) {
         Session session=super.getSession();
         session.delete(activityInstance);
         
        
    }

    
    public void reDoEventExecute(Activity activity, WorkItemDoen workItemDoen) {
        String reDoEvent = activity.getReDoEvent();
        if (reDoEvent!=null&&!reDoEvent.equals("")) {
            IReDoEvent reDoEventObject = (IReDoEvent)WfExtFactory.getFlowEvent(reDoEvent);
            reDoEventObject.execute(this.getSession(), workItemDoen);
        }
        
    }

}
