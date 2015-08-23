package com.youthor.bsp.core.wfss.model;

import java.io.Serializable;
import java.util.Date;

public class ActivityInstance implements Serializable{

    private static final long serialVersionUID = -8629038445052237284L;
    
    private String activityInstanceId; //环节实例id
    private String  parentActivityInstId; //父环节实例id
    private String  processInstanceId; //流程实例id
    private String  processId; //流程id
    private String  activityId; //环节id
    private String  activityName; //环节名称
    
    private String  toActivityId; //下一步环节id
    private String  toActivityName; //下一步环节名称
    
    private String  appId; //应用数据id
    private Date createDate; //创立时间
    private String  notifyOrgIds; //通知人
    private String  notifyOrgNames; //通知人姓名
    private String  executorId; //执行人
    private String  executorName; //执行人姓名
    private String  status; //处理状态
    private String submitStatus ;//提交状态
    private Date  completeDate; //创立时间
    private String  executeMsg;//处理意思
    private int showOrder;
    private String wantToActivityId;
    private String splitIds;
    private String isAgentedOrgId;
    private String isAgentedOrgName;

    
    public String getSplitIds() {
        return splitIds;
    }
    public void setSplitIds(String splitIds) {
        this.splitIds = splitIds;
    }
    public String getWantToActivityId() {
        return wantToActivityId;
    }
    public void setWantToActivityId(String wantToActivityId) {
        this.wantToActivityId = wantToActivityId;
    }
    public String getSubmitStatus() {
        return submitStatus;
    }
    public void setSubmitStatus(String submitStatus) {
        this.submitStatus = submitStatus;
    }
    public int getShowOrder() {
        return showOrder;
    }
    public void setShowOrder(int showOrder) {
        this.showOrder = showOrder;
    }
    public String getToActivityName() {
        return toActivityName;
    }
    public void setToActivityName(String toActivityName) {
        this.toActivityName = toActivityName;
    }
    public String getToActivityId() {
        return toActivityId;
    }
    public void setToActivityId(String toActivityId) {
        this.toActivityId = toActivityId;
    }
    public String getActivityId() {
        return activityId;
    }
    public void setActivityId(String activityId) {
        this.activityId = activityId;
    }
    public String getActivityInstanceId() {
        return activityInstanceId;
    }
    public void setActivityInstanceId(String activityInstanceId) {
        this.activityInstanceId = activityInstanceId;
    }
    public String getActivityName() {
        return activityName;
    }
    public void setActivityName(String activityName) {
        this.activityName = activityName;
    }
    public String getAppId() {
        return appId;
    }
    public void setAppId(String appId) {
        this.appId = appId;
    }
    public Date getCompleteDate() {
        return completeDate;
    }
    public void setCompleteDate(Date completeDate) {
        this.completeDate = completeDate;
    }
    public Date getCreateDate() {
        return createDate;
    }
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    public String getExecuteMsg() {
        return executeMsg;
    }
    public void setExecuteMsg(String executeMsg) {
        this.executeMsg = executeMsg;
    }
    public String getExecutorId() {
        return executorId;
    }
    public void setExecutorId(String executorId) {
        this.executorId = executorId;
    }
    public String getExecutorName() {
        if(executorName==null)
            return "";
        return executorName;
    }
    public void setExecutorName(String executorName) {
        this.executorName = executorName;
    }
    public String getNotifyOrgIds() {
        return notifyOrgIds;
    }
    public void setNotifyOrgIds(String notifyOrgIds) {
        this.notifyOrgIds = notifyOrgIds;
    }
    public String getNotifyOrgNames() {
        return notifyOrgNames;
    }
    public void setNotifyOrgNames(String notifyOrgNames) {
        this.notifyOrgNames = notifyOrgNames;
    }
    public String getParentActivityInstId() {
        return parentActivityInstId;
    }
    public void setParentActivityInstId(String parentActivityInstId) {
        this.parentActivityInstId = parentActivityInstId;
    }
    public String getProcessId() {
        return processId;
    }
    public void setProcessId(String processId) {
        this.processId = processId;
    }
    public String getProcessInstanceId() {
        return processInstanceId;
    }
    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
	public String getIsAgentedOrgId() {
		return isAgentedOrgId;
	}
	public void setIsAgentedOrgId(String isAgentedOrgId) {
		this.isAgentedOrgId = isAgentedOrgId;
	}
	public String getIsAgentedOrgName() {
		return isAgentedOrgName;
	}
	public void setIsAgentedOrgName(String isAgentedOrgName) {
		this.isAgentedOrgName = isAgentedOrgName;
	}
}
