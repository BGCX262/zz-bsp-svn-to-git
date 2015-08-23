package com.youthor.bsp.core.facade.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.youthor.bsp.core.abdf.common.helper.ObjectHelper;
import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.core.wfss.common.Constants;
import com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine;
import com.youthor.bsp.core.wfss.common.dao.IFlowEngineDAO;
import com.youthor.bsp.core.wfss.common.model.WfOrg;
import com.youthor.bsp.core.wfss.dao.IActivityDao;
import com.youthor.bsp.core.wfss.dao.IAgentDao;
import com.youthor.bsp.core.wfss.dao.IAppFormDao;
import com.youthor.bsp.core.wfss.dao.IAppFormFieldDao;
import com.youthor.bsp.core.wfss.dao.IButtonDao;
import com.youthor.bsp.core.wfss.dao.IExpressionDao;
import com.youthor.bsp.core.wfss.dao.IParticipantDao;
import com.youthor.bsp.core.wfss.dao.IProcessDao;
import com.youthor.bsp.core.wfss.dao.IProcessEditionDao;
import com.youthor.bsp.core.wfss.dao.IProcessInstanceDao;
import com.youthor.bsp.core.wfss.dao.IRouteDao;
import com.youthor.bsp.core.wfss.dao.IWorkItemDoenDao;
import com.youthor.bsp.core.wfss.dao.IWorkItemDoingDao;
import com.youthor.bsp.core.wfss.model.Activity;
import com.youthor.bsp.core.wfss.model.ActivityInstance;
import com.youthor.bsp.core.wfss.model.Agent;
import com.youthor.bsp.core.wfss.model.AppForm;
import com.youthor.bsp.core.wfss.model.AppFormField;
import com.youthor.bsp.core.wfss.model.Button;
import com.youthor.bsp.core.wfss.model.Expression;
import com.youthor.bsp.core.wfss.model.Participant;
import com.youthor.bsp.core.wfss.model.Process;
import com.youthor.bsp.core.wfss.model.ProcessEdition;
import com.youthor.bsp.core.wfss.model.ProcessInstance;
import com.youthor.bsp.core.wfss.model.Route;
import com.youthor.bsp.core.wfss.model.WorkItemDoen;
import com.youthor.bsp.core.wfss.model.WorkItemDoing;
public class WfssServiceImplFacade implements IWfssServiceFacade{

    private IAppFormDao appFormDao;
    private IAppFormFieldDao appFormFieldDao;
    private IProcessDao processDao;
    private IRouteDao routeDao;
    private IActivityDao activityDao;
    private IExpressionDao expressionDao;
    private IParticipantDao participantDao;
    private IWorkItemDoingDao workItemDoingDao;
    private IWorkItemDoenDao workItemDoenDao;
    private IButtonDao buttonDao;
    private IProcessInstanceDao processInstanceDao;
    private IProcessEditionDao processEditionDao;
    
    private IFlowEngineDAO flowEngineDAO;
    
    private IAgentDao agentDao;
    
    public void setFlowEngineDAO(IFlowEngineDAO flowEngineDAO) {
        this.flowEngineDAO = flowEngineDAO;
    }

    public IExpressionDao getExpressionDao() {
        return expressionDao;
    }

    public void setExpressionDao(IExpressionDao expressionDao) {
        this.expressionDao = expressionDao;
    }

    public void setProcessDao(IProcessDao processDao) {
        this.processDao = processDao;
    }

    public List queryPageAppFormByComId(Page page, String comId) {
        // TODO Auto-generated method stub
        return appFormDao.queryPageAppFormByComId(page,comId);
    }

    public List getAppFormByAppId(String appId) {
        // TODO Auto-generated method stub
        return appFormDao.getAppFormByAppId(appId);
    }

    public String addAppForm(AppForm appForm) {
        // TODO Auto-generated method stub
        return appFormDao.addAppForm(appForm);
    }

    public String updateAppForm(AppForm appForm) {
        // TODO Auto-generated method stub
        return appFormDao.updateAppForm(appForm);
    }

    public boolean deleteAppFormByIds(String[] ids) {
        // TODO Auto-generated method stub
        return appFormDao.deleteAppFormByIds(ids);
    }

    public AppForm getAppFormById(String id) {
        // TODO Auto-generated method stub
        return appFormDao.getAppFormById(id);
    }

    public List getAppFormFieldByFormId(String formId) {
        // TODO Auto-generated method stub
        return appFormFieldDao.getAppFormFieldByFormId(formId);
    }

    public String addAppFormField(AppFormField appFormField) {
        // TODO Auto-generated method stub
        return appFormFieldDao.addAppFormField(appFormField);
    }

    public String updateAppFormField(AppFormField appFormField) {
        // TODO Auto-generated method stub
        return appFormFieldDao.updateAppFormField(appFormField);
    }

    public boolean deleteAppFormFieldByIds(String[] ids) {
        // TODO Auto-generated method stub
        return appFormFieldDao.deleteAppFormFieldByIds(ids);
    }

    public AppFormField getAppFormFieldById(String id) {
        // TODO Auto-generated method stub
        return appFormFieldDao.getAppFormFieldById(id);
    }

    public void setAppFormDao(IAppFormDao appFormDao) {
        this.appFormDao = appFormDao;
    }

    public void setAppFormFieldDao(IAppFormFieldDao appFormFieldDao) {
        this.appFormFieldDao = appFormFieldDao;
    }
     
    
    
    public List queryPageProcessByComId(Page page, String comId) {
        // TODO Auto-generated method stub
        return processDao.queryPageProcessByComId(page,comId);
    }
    public List getAllProcessByComId(String comId) {
        // TODO Auto-generated method stub
        return processDao.getAllProcessByComId(comId);
    }

    public List getProcessByAppId(String appId) {
        // TODO Auto-generated method stub
        return processDao.getProcessByAppId(appId);
    }

    public String addProcess(Process process) {
        // TODO Auto-generated method stub
        return processDao.addProcess(process);
    }

    public String updateProcess(Process process) {
        // TODO Auto-generated method stub
        String processId = processDao.updateProcess(process);
        String alias = process.getProcessAlias();
        if (process.getIsUsed().equals("Y")) {
           List list = processDao.getProcessByAppIdCode(alias,process.getAppId());
           if (list!=null && list.size()>0) {
              for(int i=0;i<list.size();i++) {
                 Process processNeedUpdate = (Process)list.get(i);
                 if(processNeedUpdate.getProcessId().equals(processId)) continue;
                 if (processNeedUpdate.getIsUsed().equals("Y")) {
                     processNeedUpdate.setIsUsed("N");
                     processDao.updateProcess(processNeedUpdate);
                 }
              }
           }
        }
        
        return processDao.updateProcess(process);
    }

    public boolean deleteProcessByIds(String[] ids) {
        // TODO Auto-generated method stub
        return processDao.deleteProcessByIds(ids);
    }

    public Process getProcessById(String id) {
        // TODO Auto-generated method stub
        return processDao.getProcessById(id);
        
    }

    public void setActivityDao(IActivityDao activityDao) {
        this.activityDao = activityDao;
    }

    public void setRouteDao(IRouteDao routeDao) {
        this.routeDao = routeDao;
    }

    public List getRouteByProcessId(String processId) {
        // TODO Auto-generated method stub
        return routeDao.getRouteByProcessId(processId);
    }

    public String addRoute(Route route) {
        IRouteDao routeDaoTemp=(IRouteDao)SpringHelper.getBean("DAO_CopyOfRoute");
        //routeDaoTemp.addRoute(route);
        return routeDao.addRoute(route);
    }

    public String updateRoute(Route route) {
        // TODO Auto-generated method stub
        return routeDao.updateRoute(route);
    }

    public boolean deleteRouteByIds(String[] ids) {
        // TODO Auto-generated method stub
        return routeDao.deleteRouteByIds(ids);
    }

    public Route getRouteById(String id) {
        // TODO Auto-generated method stub
        return routeDao.getRouteById(id);
    }

    public List getActivityByProcessId(String processId) {
        // TODO Auto-generated method stub
        return activityDao.getActivityByProcessId(processId);
    }

    public String addActivity(Activity activity) {
        // TODO Auto-generated method stub
        String id=activityDao.addActivity(activity);
        List partList=activity.getPartticipantList();
        if(partList!=null&&!partList.isEmpty())
        {
            for(int i=0;i<partList.size();i++)
            {
                Participant participant=(Participant)partList.get(i);
                participant.setParentId(id);
                participantDao.addParticipant(participant);
            }
        }
        return id;
    }

    public String updateActivity(Activity activity) {
        // TODO Auto-generated method stub
        String id=activityDao.updateActivity(activity);
        List partListDb=participantDao.getParticipantByAId(activity.getActivityId());
        if(partListDb!=null&&!partListDb.isEmpty())
        {
            for(int i=0;i<partListDb.size();i++)
            {
               Participant participant=(Participant)partListDb.get(i);
               participantDao.deleteParticipant(participant);
            }
        }
        List partList=activity.getPartticipantList();
        if(partList!=null&&!partList.isEmpty())
        {
            for(int i=0;i<partList.size();i++)
            {
                Participant participant=(Participant)partList.get(i);
                participant.setParentId(id);
                participantDao.addParticipant(participant);
            }
        }
        return id;
    }

    public boolean deleteActivityByIds(String[] ids) {
        // TODO Auto-generated method stub
        return activityDao.deleteActivityByIds(ids);
    }

    public Activity getActivityById(String id) {
        // TODO Auto-generated method stub
        Activity activity=activityDao.getActivityById(id);
        activity.setPartticipantList(participantDao.getParticipantByAId(id));
        return activity;
    }

    public String addExpression(Expression expression) {
        // TODO Auto-generated method stub
        return expressionDao.addExpression(expression);
    }

    public boolean updateExpression(Expression expression) {
        // TODO Auto-generated method stub
        return expressionDao.updateExpression(expression);
    }

    public Expression getExpressionById(String expId) {
        // TODO Auto-generated method stub
        return expressionDao.getExpressionById(expId);
    }

    public boolean deleteExpressionByIds(String[] ids) {
        // TODO Auto-generated method stub
        return expressionDao.deleteExpressionByIds(ids);
    }

    public List listExpressionComId(Page page, String comId,String expType) {
        // TODO Auto-generated method stub
        return expressionDao.listExpressionComId(page,comId,expType);
    }

    public List listExpressionComAppIds(Page page, String comId, String[] appIds,String expType) {
        // TODO Auto-generated method stub
        return expressionDao.listExpressionComAppIds(page,comId,appIds,expType);
    }

    public void setParticipantDao(IParticipantDao participantDao) {
        this.participantDao = participantDao;
    }

    public List getRouteByActivityId(String activityId) {
        // TODO Auto-generated method stub
        return routeDao.getRouteByActivityId(activityId);
    }

    public List getParticipantByAId(String activityId) {
        return participantDao.getParticipantByAId(activityId);
    }

    public List listWorkItemDoing(Page page, String orgId) {
        // TODO Auto-generated method stub
        return workItemDoingDao.listWorkItemDoing(page,orgId);
    }

    public void setWorkItemDoingDao(IWorkItemDoingDao workItemDoingDao) {
        this.workItemDoingDao = workItemDoingDao;
    }

    public WorkItemDoing getWorkItemDoingById(String workItemId) {
        // TODO Auto-generated method stub
        return workItemDoingDao.getWorkItemDoingById(workItemId);
    }

    public List listWfProcessTraceByIdWorkItemId(String workItemId) {
        if(workItemId==null||workItemId.equals(""))
            return new ArrayList();
    
            
        // TODO Auto-generated method stub
        String processInstanceId="";
        
            WorkItemDoing workItemDoing=workItemDoingDao.getWorkItemDoingById(workItemId);
            
            
         if(workItemDoing==null)
        {
            WorkItemDoen workItemDoen=workItemDoenDao.getWorkItemDoenById(workItemId);
            processInstanceId=workItemDoen.getProcessInstanceId();
        }
         else
         {processInstanceId=workItemDoing.getProcessInstanceId();
             
         }
        List processTraceList=flowEngineDAO.listWfProcessTraceByIdWorkItemId(processInstanceId);
        return processTraceList;
    }

    public void setWorkItemDoenDao(IWorkItemDoenDao workItemDoenDao) {
        this.workItemDoenDao = workItemDoenDao;
    }

    public List listWorkItemDoen(Page page, String orgId) {
        // TODO Auto-generated method stub
        return workItemDoenDao.listWorkItemDoen(page,orgId);
    }

    public WorkItemDoen getWorkItemDoenById(String workItemId) {
        // TODO Auto-generated method stub
        return workItemDoenDao.getWorkItemDoenById(workItemId);
    }

    public Process getProcessByAlias(String processAlias,String isUsed) {
        // TODO Auto-generated method stub
        return processDao.getProcessByAlias(processAlias,isUsed);
    }

    public Activity getActivityByAlias(String processAlias, String isUsed,String activityAlias) {
        // TODO Auto-generated method stub
        return activityDao.getActivityByAlias(processAlias,isUsed,activityAlias);
    }

    public ProcessInstance getProcessInstanceByWorkItemId(String workItemId) {
        if(workItemId==null||workItemId.equals(""))
            return null;
        
        // TODO Auto-generated method stub
        String processInstanceId="";
        
            WorkItemDoing workItemDoing=workItemDoingDao.getWorkItemDoingById(workItemId);
            
         if(workItemDoing==null)
        {
            WorkItemDoen workItemDoen=workItemDoenDao.getWorkItemDoenById(workItemId);
            processInstanceId=workItemDoen.getProcessInstanceId();
        }
         else
         {
             processInstanceId=workItemDoing.getProcessInstanceId();
         }
        return flowEngineDAO.getProcessInstanceById(processInstanceId);
    }

    public WorkItemDoing getWorkItemDoingByOrgId(String orgId) {
        // TODO Auto-generated method stub
        return workItemDoingDao.getWorkItemDoingByOrgId(orgId);
    }

    public int getWorkItemDoIngNumByActivityInstanceIdWithOutSelf(String activityInstanceId,String workItemId) {
        // TODO Auto-generated method stub
        return workItemDoingDao.getWorkItemDoIngNumByActivityInstanceIdWithOutSelf(activityInstanceId,workItemId);
    }

    public void affirmDoThisWorkItem(Map pagePar) {
        flowEngineDAO.affirmDoThisWorkItem(pagePar);
        
    }

    public void setButtonDao(IButtonDao buttonDao) {
        this.buttonDao = buttonDao;
    }

    public List getAllButton() {
        // TODO Auto-generated method stub
        return buttonDao.getAllButton();
    }

    public String updateButton(Button button) {
        // TODO Auto-generated method stub
        return buttonDao.updateButton(button);
    }

    public String addButton(Button button) {
        // TODO Auto-generated method stub
        return buttonDao.addButton(button);
    }

    public Button getButtonById(String buttonId) {
        // TODO Auto-generated method stub
        return buttonDao.getButtonById(buttonId);
    }


    public List getActivityInstByparentId(String parentActivityInstId) {
        return flowEngineDAO.getActivityInstByparentId(parentActivityInstId);
    }


    public List getExecuteUserByProInsIdAndActId(String processInstanceId,String activityId) {
        // TODO Auto-generated method stub
        return flowEngineDAO.getExecuteUserByProInsIdAndActId(processInstanceId,activityId);
    }

    
    public void run(Map map, String title, String appId) {
        flowEngineDAO.run(map,title,appId);
        
    }

    
    public void startup(Map map, String title, String appId) {
        flowEngineDAO.run(map,title,appId);
        
    }

    
    public String assignOtherUserProcess(String orgId, String orgName,
            String workItemId) {
        
        WorkItemDoing workItemDoing = workItemDoingDao.getWorkItemDoingById(workItemId);
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        Activity activity= wfCacheEngine.getActivityById(workItemDoing.getActivityId());
        String operateMode = StringHelper.doWithNull(activity.getOperateMode());
        Date date = new Date();
        ActivityInstance activityInstance = flowEngineDAO.getActivityInstById(workItemDoing.getActivityInstanceId());
        activityInstance.setExecutorId(orgId);
        activityInstance.setExecutorName(orgName);
        flowEngineDAO.updateActivityInstance(activityInstance);
        
        workItemDoing.setOwnerId(orgId);
        workItemDoing.setOwnerName(orgName);
        workItemDoingDao.updateWorkItemDoing(workItemDoing);
        
        return activity.getActivityId();
//        if (operateMode.equals(Constants.WF_operateMode_LOOP) || operateMode.equals(Constants.WF_operateMode_AND)    ) {
//            //先转接收人
//            activityInstance.setExecutorId(orgId);
//            activityInstance.setExecutorName(orgName);
//            flowEngineDAO.updateActivityInstance(activityInstance);
            
//            ActivityInstance activityInstanceNew = (ActivityInstance)ObjectHelper.objectCopy(activityInstance,ActivityInstance.class.getName());
//            activityInstanceNew.setExecutorId(workItemDoing.getOwnerId());
//            activityInstanceNew.setExecutorName(workItemDoing.getOwnerName());
//            activityInstanceNew.setNotifyOrgIds(workItemDoing.getOwnerId());
//            activityInstanceNew.setNotifyOrgNames(workItemDoing.getOwnerName());
//            //activityInstanceNew.setParentActivityInstId(activityInstance.getActivityInstanceId());
//            activityInstanceNew.setCreateDate(date);
//            activityInstanceNew.setCompleteDate(date);
//            activityInstanceNew.setActivityInstanceId(null);
//            activityInstanceNew.setParentActivityInstId(activityInstance.getActivityInstanceId());
//            activityInstanceNew.setStatus(Constants.WF_YB);
//            activityInstanceNew.setSubmitStatus(Constants.WF_GTRQL);
//            flowEngineDAO.addActivityInstance(activityInstanceNew);
//            activityInstanceNew.setParentActivityInstId(activityInstanceNew.getActivityInstanceId());
//            flowEngineDAO.updateActivityInstance(activityInstanceNew);
//            
            //转待办
            //System.out.println("orgName=="+orgName);
//            workItemDoing.setOwnerId(orgId);
//            workItemDoing.setOwnerName(orgName);
//            workItemDoingDao.updateWorkItemDoingDao(workItemDoing);
            //workItemDoingDao.deleteWorkItemDoingDao(workItemDoing);
//        }
//        else {
            //根据环节实例id得到环环节实例对象,必变原来环节实例状态，生成新的环节实例
            
//            activityInstance.setSubmitStatus(Constants.WF_SUBMIT_STATES_TJ);
//            activityInstance.setStatus(Constants.WF_YB);
//            
//            activityInstance.setCompleteDate(date);
//            activityInstance.setExecuteMsg("HELLO 转他人处理时的意见");
//            flowEngineDAO.updateActivityInstance(activityInstance);
//            ActivityInstance activityInstanceNew = (ActivityInstance)ObjectHelper.objectCopy(activityInstance,ActivityInstance.class.getName());
//            activityInstanceNew.setExecutorId(orgId);
//            activityInstanceNew.setExecutorName(orgName);
//            activityInstanceNew.setNotifyOrgIds(workItemDoing.getOwnerId());
//            activityInstanceNew.setNotifyOrgNames(workItemDoing.getOwnerName());
//            activityInstanceNew.setActivityInstanceId(null);
//            activityInstanceNew.setCreateDate(date);
//            activityInstanceNew.setParentActivityInstId(activityInstance.getActivityInstanceId());
//            activityInstanceNew.setStatus(Constants.WF_DB);
//            activityInstanceNew.setSubmitStatus(Constants.WF_SUBMIT_STATES_TJ);
//            flowEngineDAO.addActivityInstance(activityInstanceNew);
//            //删除待办，生成新的待办，生成已办
//            WorkItemDoing workItemDoingNew = (WorkItemDoing)ObjectHelper.objectCopy(workItemDoing,WorkItemDoing.class.getName());
//            workItemDoingNew.setWorkItemId(null);
//            workItemDoingNew.setSenderId(workItemDoing.getOwnerId());
//            workItemDoingNew.setSenderName(workItemDoing.getOwnerName());
//            workItemDoingNew.setActivityInstanceId(activityInstanceNew.getActivityInstanceId());
//            workItemDoingNew.setIsRead("N");
//            workItemDoingNew.setStates(Constants.WF_DB);
//            workItemDoingNew.setOwnerId(orgId);
//            workItemDoingNew.setOwnerName(orgName);
//            workItemDoingNew.setCreateDate(date);
//            workItemDoingDao.deleteWorkItemDoingDao(workItemDoing);
//            workItemDoingDao.addWorkItemDoingDao(workItemDoingNew);
//        }
        

        
//        WorkItemDoen workItemDoen = (WorkItemDoen)ObjectHelper.objectCopy(workItemDoing,WorkItemDoen.class.getName());
//        workItemDoenDao.createWorkItemDoen(workItemDoen);
        
    }

    
    public String jumpToOtherActivity(WorkItemDoing workItemDoing,
            List ownerOrgs, String jumpToActivityId, String jumpOption) {
        
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        Activity activity= wfCacheEngine.getActivityById(jumpToActivityId);
        String initFormEvent = activity.getInitFormEvent();
        Map map = new HashMap();
        String appId = workItemDoing.getAppId();
        
        String newTitle = flowEngineDAO.changeWfOrgAppId(workItemDoing.getTitle(), map, workItemDoing, ownerOrgs, initFormEvent);
        appId = map.get("NEW_PROCESS_FORM_ID") == null ? appId : (String)map.get("NEW_PROCESS_FORM_ID");
        
        //对现有环节实例处理
        String activityInstanceId = workItemDoing.getActivityInstanceId();
        ActivityInstance activityInstance = flowEngineDAO.getActivityInstById(activityInstanceId);
        activityInstance.setStatus(Constants.WF_YB);
        //activityInstance.setSubmitStatus(Constants.WF_SUBMIT_STATES_JUMP);
        activityInstance.setCompleteDate(new Date());
        activityInstance.setExecuteMsg(jumpOption);
        flowEngineDAO.updateActivityInstance(activityInstance);
        //生成新的环节实例和待办
        if (ownerOrgs != null && ownerOrgs.size()>0 ){
            for (int i=0;i<ownerOrgs.size();i++){
                WfOrg wfOrg = (WfOrg)ownerOrgs.get(i);
                //生成新的环节实例和已办
                ActivityInstance activityInstanceNew=new ActivityInstance();
                activityInstanceNew.setActivityId(workItemDoing.getActivityId());
                activityInstanceNew.setActivityName(workItemDoing.getActivityName());
                activityInstanceNew.setToActivityId(activity.getActivityId());
                activityInstanceNew.setToActivityName(activity.getActivityName());
                activityInstanceNew.setAppId(wfOrg.getAppId());
                activityInstanceNew.setCreateDate(new Date());
                activityInstanceNew.setExecutorId(wfOrg.getOrgId());
                activityInstanceNew.setExecutorName(wfOrg.getOrgName());
                activityInstanceNew.setProcessId(workItemDoing.getProcessId());
                activityInstanceNew.setProcessInstanceId(workItemDoing.getProcessInstanceId());
                activityInstanceNew.setParentActivityInstId(workItemDoing.getActivityInstanceId());
                activityInstanceNew.setStatus(Constants.WF_DB);
                activityInstanceNew.setSubmitStatus(Constants.WF_SUBMIT_STATES_TJ);
                activityInstanceNew.setNotifyOrgIds(workItemDoing.getOwnerId());
                activityInstanceNew.setShowOrder(i);
                activityInstanceNew.setNotifyOrgNames(workItemDoing.getOwnerName());
                
                flowEngineDAO.addActivityInstance(activityInstanceNew);
                
                //生成新的环节待办
                WorkItemDoing workItemDoingSave=new WorkItemDoing();//要生成的待办
                workItemDoingSave.setActivityId(activity.getActivityId());//设置待办的id
                workItemDoingSave.setParentActivityInstId(activityInstanceNew.getParentActivityInstId());
                workItemDoingSave.setActivityInstanceId(activityInstanceNew.getActivityInstanceId());
                workItemDoingSave.setProcessInstanceId(workItemDoing.getProcessInstanceId());
                workItemDoingSave.setActivityName(activity.getActivityName());
                workItemDoingSave.setAppFormId(activity.getAppFormId());
                workItemDoingSave.setProcessId(workItemDoing.getProcessId());
                workItemDoingSave.setProcessName(workItemDoing.getProcessName());
                workItemDoingSave.setTitle(newTitle);
                workItemDoingSave.setSenderName(workItemDoing.getOwnerName());
                workItemDoingSave.setAppId(wfOrg.getAppId());
                workItemDoingSave.setCreateDate(new Date());
                workItemDoingSave.setOwnerId(wfOrg.getOrgId());
                workItemDoingSave.setOwnerName(wfOrg.getOrgName());
                workItemDoingSave.setSenderId(workItemDoing.getOwnerId());
                workItemDoingSave.setStates(Constants.WF_DB);
                workItemDoingDao.addWorkItemDoing(workItemDoingSave);
            }
        }
        //删除待办生成已办
        workItemDoingDao.deleteWorkItemDoing(workItemDoing);
        
        return flowEngineDAO.createWorkItemDoen(workItemDoing,newTitle);
    }

    
    public String redoWorkItem(String workItemId) {
        WorkItemDoen workItemDoen = this.getWorkItemDoenById(workItemId);
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        String  activityId = workItemDoen.getActivityId();
        Activity activity= wfCacheEngine.getActivityById(activityId);
        String operateMode = StringHelper.doWithNull(activity.getOperateMode());
        //如果为
        if (operateMode.equals(com.youthor.bsp.core.wfss.common.Constants.WF_operateMode_LOOP) || 
                operateMode.equals(com.youthor.bsp.core.wfss.common.Constants.WF_operateMode_AND)    ) {
            String parentActivityInstId = workItemDoen.getParentActivityInstId();
            int num = flowEngineDAO.getYBNumByPAIIdWithLoopAnd(parentActivityInstId,workItemDoen.getActivityInstanceId());
            if(num>0) return "0";
            //删除下游环节实例
            
        }
        else {
            String parentActivityInstId = workItemDoen.getActivityInstanceId();
            int num = flowEngineDAO.getYBNumByPAIId(parentActivityInstId);
            if(num>0) return "1";
        }
        
        List listActInst = flowEngineDAO.getActivityInstByparentId(workItemDoen.getActivityInstanceId());
        if(listActInst!=null && listActInst.size()>0) {
            for(int i=0;i<listActInst.size();i++) {
                ActivityInstance activityInstance = (ActivityInstance)listActInst.get(i);
                flowEngineDAO.deleteActivityInstance(activityInstance);
                //收回所有待办
                WorkItemDoing workItemDoing = workItemDoingDao.getWorkItemDoingByActInsId(activityInstance.getActivityInstanceId());
                if (workItemDoing!=null) {
                    workItemDoingDao.deleteWorkItemDoing(workItemDoing);
                }
            }
        }
        //修改现有环节实例
        ActivityInstance activityInstance = flowEngineDAO.getActivityInstById(workItemDoen.getActivityInstanceId());
        activityInstance.setStatus(Constants.WF_DB);
        activityInstance.setCompleteDate(null);
        activityInstance.setWantToActivityId("");
        flowEngineDAO.updateActivityInstance(activityInstance);
        //删除待办
        workItemDoenDao.deleteWorkItemDoen(workItemDoen);
        //生成新的待办
        WorkItemDoing workItemDoing = (WorkItemDoing)ObjectHelper.objectCopy(workItemDoen, WorkItemDoing.class.getName());
        workItemDoing.setWorkItemId(null);
        workItemDoing.setStates(Constants.WF_DB);
        workItemDoingDao.addWorkItemDoing(workItemDoing);
        flowEngineDAO.reDoEventExecute(activity,workItemDoen);
        return workItemDoing.getWorkItemId();
    }

    public void setProcessInstanceDao(IProcessInstanceDao processInstanceDao) {
        this.processInstanceDao = processInstanceDao;
    }


    public List listProcessInstByOrgId(Page page, String orgId) {
        return processInstanceDao.listProcessInstByOrgId(page,orgId);
    }


    public ProcessInstance getProcessInstById(String id) {
        
        return processInstanceDao.getProcessInstById(id);
    }

    
    public WorkItemDoen getWorkItemDoenProcessInst(String processInstId,
            String appId, String appFormId,String owner) {
        // TODO Auto-generated method stub
        return workItemDoenDao.getWorkItemDoenProcessInst(processInstId,appId,appFormId,owner);
    }


    public WorkItemDoing getWorkItemDoingProcessInst(String processInstId,
            String appId, String appFormId,String owner) {
        // TODO Auto-generated method stub
        return workItemDoingDao.getWorkItemDoingProcessInst(processInstId,appId,appFormId, owner);
    }

    
    public boolean cancelProcessInst(String processInstanceId) {
        ProcessInstance processInstance = processInstanceDao.getProcessInstById(processInstanceId);
        //得到流程信息
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        Process process = wfCacheEngine.getProcessById(processInstance.getProcessId());
        return processInstanceDao.cancelProcessInst(processInstance,process);
        
    }

    public boolean hangProcessInst(String processInstanceId) {
        ProcessInstance processInstance = processInstanceDao.getProcessInstById(processInstanceId);
        //得到流程信息
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        Process process = wfCacheEngine.getProcessById(processInstance.getProcessId());
        
        
        return processInstanceDao.hangProcessInst(processInstance,process);
    }

    
    public boolean cancelHangProcessInst(String processInstanceId) {
        ProcessInstance processInstance = processInstanceDao.getProcessInstById(processInstanceId);
        //得到流程信息
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        Process process = wfCacheEngine.getProcessById(processInstance.getProcessId());
        
        
        return processInstanceDao.cancelHangProcessInst(processInstance,process);
    }

   
    public List getDBActInsByProInstActId(String processInstanceId,  String activityId) {
        return processInstanceDao.getDBActInsByProInstActId(processInstanceId,activityId);
    }

    @Override
    public List getActivityInstByProInsId(String processInstanceId,
            String joinId) {
        // TODO Auto-generated method stub
        return processInstanceDao.getActivityInstByProInsId(processInstanceId,joinId);
    }

    @Override
    public int getDBCountByProInstActIdJoinId(String processInstanceId,
            String activityId, String joinId) {
       
        return processInstanceDao.getDBCountByProInstActIdJoinId(processInstanceId,activityId,joinId);
    }

    public void setProcessEditionDao(IProcessEditionDao processEditionDao) {
        this.processEditionDao = processEditionDao;
    }

    @Override
    public List getProcessEditionByComId(String comId) {
        // TODO Auto-generated method stub
        return processEditionDao.getProcessEditionByComId(comId);
    }

    @Override
    public String addProcessEdition(ProcessEdition processEdition) {
        // TODO Auto-generated method stub
        return processEditionDao.addProcessEdition(processEdition);
    }

    @Override
    public ProcessEdition getProcessEditionById(String id) {
        // TODO Auto-generated method stub
        return processEditionDao.getProcessEditionById(id);
    }

    @Override
    public String updateProcessEdition(ProcessEdition processEdition) {
        // TODO Auto-generated method stub
        return processEditionDao.updateProcessEdition(processEdition);
    }

    @Override
    public List getProcessByEditionId(String id, String comId) {
        // TODO Auto-generated method stub
        return processEditionDao.getProcessByEditionId(id,comId);
    }

    @Override
    public List getAppFormByEditionId(String id) {
        // TODO Auto-generated method stub
        return processEditionDao.getAppFormByEditionId(id);
    }

    @Override
    public String copyProcessToEdition(Process process) {
        String processId = processDao.addProcess(process);
        List activityList = process.getActivityList();
        List allRoute = new ArrayList();
        List appFormList = new ArrayList();
        if(process.getAppFormId()!=null && !process.getAppFormId().equals("")) {
            AppForm appForm = appFormDao.getAppFormById(process.getAppFormId());
            List appFormFieldList = appFormFieldDao.getAppFormFieldByFormId(appForm.getAppFormId());
            appForm.setAppFormFieldList(appFormFieldList);
            appFormList.add(appForm);
        }
       
        if(activityList!=null && activityList.size()>0) {
           for(int i=0;i<activityList.size();i++) {
               Activity activity = (Activity)activityList.get(i);
               //处理环节人员
               activity.setProcessId(processId);
               if(appFormList.isEmpty()) {
                   AppForm appForm = appFormDao.getAppFormById(activity.getAppFormId());
                   List appFormFieldList = appFormFieldDao.getAppFormFieldByFormId(appForm.getAppFormId());
                   appForm.setAppFormFieldList(appFormFieldList);
                   appFormList.add(appForm);
               }
               else {
                   boolean isAdd = true;
                   for(int j=0;j<appFormList.size();j++) {
                      AppForm appForm = (AppForm)appFormList.get(j);
                      if(appForm.getAppFormId().equals(activity.getAppFormId())) {
                           isAdd = false;
                      }
                   }
                   if (isAdd) {
                      AppForm appForm = appFormDao.getAppFormById(activity.getAppFormId());
                      List appFormFieldList = appFormFieldDao.getAppFormFieldByFormId(appForm.getAppFormId());
                      appForm.setAppFormFieldList(appFormFieldList);
                      appFormList.add(appForm);
                   }
               }
               String oriId = activity.getActivityId();
               activity.setActivityId(null);
               activityDao.addActivity(activity);
               List participantList = participantDao.getParticipantByAId(oriId);
               if (participantList!=null && participantList.size()>0) {
                   for(int n=0;n<participantList.size();n++) {
                    Participant participant = (Participant)participantList.get(n);
                    Participant participantNeedSave = (Participant)ObjectHelper.objectCopy(participant,Participant.class.getName());
                    participantNeedSave.setParticipantId(null);
                    participantNeedSave.setParentId(activity.getActivityId());
                    participantDao.addParticipant(participantNeedSave);
                   }
               }
               List routeList = activity.getRouteList();
               if(routeList!=null && routeList.size()>0) {
                  for(int j=0;j<routeList.size();j++) {
                     Route route = (Route)routeList.get(j);
                     route.setActivityId(activity.getActivityId());
                     route.setProcessId(processId);
                     routeDao.addRoute(route);
                     allRoute.add(route);
                  }
               }
           }
            
        }
        if(allRoute!=null && allRoute.size()>0) {
            for(int i=0;i<allRoute.size();i++) {
                Route route = (Route)allRoute.get(i);
                String toActivityId = route.getToActivityId();
                if(toActivityId!=null && !toActivityId.equals("")) {
                    Activity activity = activityDao.getActivityById(toActivityId);
                    Activity activityTemp = activityDao.getActivityByProIdAlias(processId,activity.getActivityAlias());
                    route.setToActivityId(activityTemp.getActivityId());
                    routeDao.updateRoute(route);
                    
                }
            }
         }
        //处理表单
        for(int i=0;i<appFormList.size();i++) {
            AppForm appForm = (AppForm)appFormList.get(i);
            AppForm appFormNeedSave = (AppForm)ObjectHelper.objectCopy(appForm,AppForm.class.getName());
            appFormNeedSave.setAppFormId(null);
            appFormNeedSave.setEditionId(process.getEditionId());
            appFormDao.addAppForm(appFormNeedSave);
            List appFormFieldList = appForm.getAppFormFieldList();
            if(appFormFieldList!=null && appFormFieldList.size()>0) {
                for(int j=0;j<appFormFieldList.size();j++) {
                   AppFormField appFormField = (AppFormField)appFormFieldList.get(j);
                   AppFormField appFormFieldNeedSave = (AppFormField)ObjectHelper.objectCopy(appFormField,AppFormField.class.getName());
                   appFormFieldNeedSave.setAppFormId(appFormNeedSave.getAppFormId());
                   appFormFieldNeedSave.setFieldId(null);
                   appFormFieldDao.addAppFormField(appFormFieldNeedSave);
                }
            }
        }
        //处理流程关联的表单.
        String processFormId = process.getAppFormId();
        if(!processFormId.equals("")) {
            AppForm appForm= appFormDao.getAppFormById(processFormId);
            String appFormCode = appForm.getAppFormCode();
            AppForm appFormNew = appFormDao.getAppFormByCodeEditionId(appFormCode,process.getEditionId());
            process.setAppFormId(appFormNew.getAppFormId());
            processDao.updateProcess(process);
        }
        //处理环节关联的表单
        if(activityList!=null && activityList.size()>0) {
            for(int i=0;i<activityList.size();i++) {
                Activity activity = (Activity)activityList.get(i);
                String actFormId = activity.getAppFormId();
                AppForm appForm= appFormDao.getAppFormById(actFormId);
                String appFormCode = appForm.getAppFormCode();
                AppForm appFormNew = appFormDao.getAppFormByCodeEditionId(appFormCode,process.getEditionId());
                activity.setAppFormId(appFormNew.getAppFormId());
                activityDao.updateActivity(activity);
            }
        }
        return processId;
    }

    @Override
    public Activity getActivityByProIdAlias(String processId,
            String activityAlias) {
        // TODO Auto-generated method stub
        return activityDao.getActivityByProIdAlias(processId,activityAlias);
    }

	@Override
	public List getAppFormByAppIdEditionId(String appId, String editionId) {
		return appFormDao.getAppFormByAppIdEditionId(appId,editionId);
	}

	public void setAgentDao(IAgentDao agentDao) {
		this.agentDao = agentDao;
	}

	@Override
	public Agent getAgentByOrgId(String orgId) {
		// TODO Auto-generated method stub
		return agentDao.getAgentByOrgId(orgId);
	}

	@Override
	public String addAgent(Agent agent) {
		// TODO Auto-generated method stub
		return agentDao.addAgent(agent);
	}

	@Override
	public String updateAgent(Agent agent) {
		// TODO Auto-generated method stub
		return agentDao.updateAgent(agent);
	}

	@Override
	public List getAllAgent() {
		// TODO Auto-generated method stub
		return agentDao.getAllAgent();
	}

    

    
}
