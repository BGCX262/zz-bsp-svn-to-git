package com.youthor.bsp.core.facade;

import java.util.List;
import java.util.Map;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.wfss.model.Activity;
import com.youthor.bsp.core.wfss.model.Agent;
import com.youthor.bsp.core.wfss.model.AppForm;
import com.youthor.bsp.core.wfss.model.AppFormField;
import com.youthor.bsp.core.wfss.model.Button;
import com.youthor.bsp.core.wfss.model.Expression;
import com.youthor.bsp.core.wfss.model.Process;
import com.youthor.bsp.core.wfss.model.ProcessEdition;
import com.youthor.bsp.core.wfss.model.ProcessInstance;
import com.youthor.bsp.core.wfss.model.Route;
import com.youthor.bsp.core.wfss.model.WorkItemDoing;
import com.youthor.bsp.core.wfss.model.WorkItemDoen;
public interface IWfssServiceFacade {
    public List queryPageAppFormByComId(Page page,String comId);
    public List getAppFormByAppId(String appId);
    public String addAppForm(AppForm appForm);
    public String updateAppForm(AppForm appForm);
    public boolean deleteAppFormByIds(String [] ids);
    public AppForm getAppFormById(String id);
    
    public List getAppFormFieldByFormId(String formId);
    public String addAppFormField(AppFormField appFormField);
    public String updateAppFormField(AppFormField appFormField);
    public boolean deleteAppFormFieldByIds(String [] ids);
    public AppFormField getAppFormFieldById(String id);    
    
    public List queryPageProcessByComId(Page page,String comId);
    public List getProcessByAppId(String appId);
    public List getAllProcessByComId(String comId);
    public String addProcess(Process appForm);
    public String updateProcess(Process appForm);
    public boolean deleteProcessByIds(String [] ids);
    public Process getProcessById(String id);
    /**
     * 根据流程别名得到流程对象
     * @param processAlias
     * @return
     */
    public Process getProcessByAlias(String processAlias,String isUsed);
    
    
    public List getRouteByProcessId(String processId);
    public String addRoute(Route route);
    public String updateRoute(Route route);
    public boolean deleteRouteByIds(String [] ids);
    public Route getRouteById(String id);    
    public List getRouteByActivityId(String activityId);
    
    
    public List getActivityByProcessId(String processId);
    public String addActivity(Activity activity);
    public String updateActivity(Activity activity);
    public boolean deleteActivityByIds(String [] ids);
    public Activity getActivityById(String id);
    public Activity getActivityByAlias(String processAlias,String isUsed,String activityAlias);
    
    
    
    public String addExpression(Expression expression);
    public boolean updateExpression(Expression expression);
    public Expression getExpressionById(String expId);
    public boolean deleteExpressionByIds(String[] ids);
    public List listExpressionComId(Page page, String comId,String expType);
    public List listExpressionComAppIds(Page page, String comId, String[] appIds,String expType);
    
    public List getParticipantByAId(String activityId);
    /**
     * 根据人id得到待办列表
     * @param page
     * @param orgId
     * @return
     */
    public List listWorkItemDoing(Page page, String orgId);
    /**
     * 根据待办id得到待办对象
     * @param workItemId
     * @return
     */
    public WorkItemDoing getWorkItemDoingById(String workItemId);
    /**
     * 根据应用ID和
     * @param workItemId
     * @return
     */
    public List listWfProcessTraceByIdWorkItemId(String workItemId);
    /**
     * 得到已办
     * @param page
     * @param orgId
     * @return
     */
    public List listWorkItemDoen(Page page, String orgId);
    /**
     * 得到已办
     * @param workItemId
     * @return
     */
    public WorkItemDoen getWorkItemDoenById(String workItemId);
    
    /**
     * 根据待办id得到流程实例对象
     */
    ProcessInstance getProcessInstanceByWorkItemId(String workItemId);
    /**
     * 根据orgid得到此人最新待办
     * @param orgId
     * @return
     */
    public WorkItemDoing getWorkItemDoingByOrgId(String orgId);
    /**
     * 根据环节实例id得到此环节实例id父亲环节实例下的待办条数,不包括当前待办
     * @param activityInstanceId
     * @return
     */
     public int getWorkItemDoIngNumByActivityInstanceIdWithOutSelf(String activityInstanceId,String workItemId);
    /**
     * 用户确认处理此表单
     * @param map1 页面所有参数
     */
    public void affirmDoThisWorkItem(Map pagePar);
    /**
     * 得到所有的公用流程按钮
     * @return
     */
    public List getAllButton();
    /**
     * 更新按钮
     * @param button
     * @return
     */
    public String updateButton(Button button);
    /**
     * 新增按钮
     * @param button
     * @return
     */
    public String addButton(Button button);
    /**
     * 极据按钮id和到按钮对象
     * @param buttonId
     * @return
     */
    public Button getButtonById(String buttonId);
    
   
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
    public List getExecuteUserByProInsIdAndActId(String processInstanceId,String activityId);
    
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
     * 转他人处理
     * @param orgId
     * @param orgName
     * @param workItemId
     */
    public String assignOtherUserProcess(String orgId, String orgName,
            String workItemId);
    
    /**
     * 流程jump
     * @param workItemDoing
     * @param ownerOrgs
     * @param jumpToActivity
     * @param jumpOption
     * @return
     */
    public String jumpToOtherActivity(WorkItemDoing workItemDoing,
            List ownerOrgs, String jumpToActivity, String jumpOption);
    /**
     * 重处理
     * @param workItemId
     * @return
     */
    public String redoWorkItem(String workItemId);
    /**
     * 根据orgId得到流程实例(我的发起)
     * @param page
     * @param orgId
     * @return
     */
    public List listProcessInstByOrgId(Page page, String orgId);
    /**
     * 
     * @param id
     * @return
     */
    public ProcessInstance getProcessInstById(String id);
    public WorkItemDoen getWorkItemDoenProcessInst(String processInstId,
            String appId, String appFormId,String owner);
    public WorkItemDoing getWorkItemDoingProcessInst(String processInstId,
            String appId, String appFormId,String owner);
    /**
     * 取消流程实例
     * @param processInstanceId
     */
    public boolean cancelProcessInst(String processInstanceId);
    public boolean hangProcessInst(String processInstanceId);
    public boolean cancelHangProcessInst(String processInstanceId);
    
    /**
     * 此流程实例下此环节生成的待办数
     * @param processInstanceId
     * @param activityId
     * @return
     */
    public List getDBActInsByProInstActId(String processInstanceId,String activityId);
    /**
     * 根据流程实例id和聚合id得到还有多少待办没有处理
     * @param processInstanceId
     * @param joinId
     * @return
     */
    public List getActivityInstByProInsId(String processInstanceId,
            String joinId);
    
    public int getDBCountByProInstActIdJoinId(String processInstanceId, String activityId,
            String joinId);
    /**
     * 根据公司id得到流程版本
     * @param comId
     * @return
     */
	public List getProcessEditionByComId(String comId);
	public String updateProcessEdition(ProcessEdition processEdition);
	public String addProcessEdition(ProcessEdition processEdition);
	public ProcessEdition getProcessEditionById(String id);
	public List getProcessByEditionId(String id, String comId);
	public List getAppFormByEditionId(String id);
	public String copyProcessToEdition(Process process);
	public Activity getActivityByProIdAlias(String processId,String activityAlias);
	public List getAppFormByAppIdEditionId(String appId, String editionId);
	public Agent getAgentByOrgId(String orgId);
	public String updateAgent(Agent agent);
	public String addAgent(Agent agent);
	public List getAllAgent();
    
    
    
}
