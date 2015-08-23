package com.youthor.bsp.core.wfss.common.dao;

import java.util.List;
import java.util.Map;

import com.youthor.bsp.core.wfss.common.model.WfOrg;
import com.youthor.bsp.core.wfss.model.Activity;
import com.youthor.bsp.core.wfss.model.ActivityInstance;
import com.youthor.bsp.core.wfss.model.ProcessInstance;
import com.youthor.bsp.core.wfss.model.WorkItemDoen;
import com.youthor.bsp.core.wfss.model.WorkItemDoing;

public interface IFlowEngineDAO {
    /**
     * 以流程processId 环节activityId 启动流程
     * @param wfOrg
     * @param processId
     * @param activityId
     * @param title
     * @return
     */
    void startup(Map map, String title,String appId);
    /**
     * 运行流程，使其转入下一环节
     * @param workitemId
     * @param option
     * @param wfOrg
     * @param submitRouteInfo
     * @param title
     */
    void run(Map map, String title,String appId);
    /**
     * 根据流程实例得到流程跟踪
     * @param processInstanceId
     * @return
     */
    List listWfProcessTraceByIdWorkItemId(String processInstanceId);
    
    ProcessInstance getProcessInstanceById(String processInstanceId);
    /**
     * 用户确认处理此待办
     * @param pagePar
     */
    void affirmDoThisWorkItem(Map pagePar);
    /**
     * 根据父流程实例得到所有子流程实例
     * @param parentActivityInstId
     * @return
     */
    public List getActivityInstByparentId(String parentActivityInstId);
    /**
     * 根据流程实例和环节id,找到已执行过此环节的人
     * @param processInstanceId
     * @param activityId
     * @return
     */
    List getExecuteUserByProInsIdAndActId(String processInstanceId,String activityId);
    /**
     * 根据环节实例id得到环节实例
     * @param activityInstanceId
     * @return
     */
    ActivityInstance getActivityInstById(String activityInstanceId);
    /**
     * 更新环节实例
     * @param activityInstance
     */
    void updateActivityInstance(ActivityInstance activityInstance);
    /**
     * 新增环节实例
     * @param activityInstanceNew
     */
    void addActivityInstance(ActivityInstance activityInstanceNew);
    
    
    public String changeWfOrgAppId(String title, Map map,
            WorkItemDoing workItemDoing, List ownerOrgs, 
            String initFormEvent);
    
    public String createWorkItemDoen(WorkItemDoing workItemDoing,String title);
    /**
     * 
     * @param parentActivityInstId
     * @param activityInstanceId
     * @return
     */
    int getYBNumByPAIIdWithLoopAnd(String parentActivityInstId,
            String activityInstanceId);
    /**
     * 
     * @param parentActivityInstId
     * @return
     */
    int getYBNumByPAIId(String parentActivityInstId);
    /**
     * 
     * @param activityInstance
     */
    void deleteActivityInstance(ActivityInstance activityInstance);
    /**
     * 
     * @param activity
     * @param workItemDoen
     */
    void reDoEventExecute(Activity activity, WorkItemDoen workItemDoen);

}
