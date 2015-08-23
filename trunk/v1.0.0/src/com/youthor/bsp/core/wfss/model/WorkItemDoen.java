package com.youthor.bsp.core.wfss.model;

import java.io.Serializable;
import java.util.Date;

public class WorkItemDoen implements Serializable{
    private static final long serialVersionUID = -7033586776735494782L;
    private String workItemId; //待办id
    private String processInstanceId; //流程实例id
    private String activityInstanceId; //环节实例id
    private String parentActivityInstId; //父环节实例id
    private String activityId; //环节id
    private String activityName; //环节名称
    private String appFormId; //业务表单id
    private String appId; //业务数据id
    private String senderId; //发送人id
    private String senderName; //发送人姓名
    private String ownerId; //接收者id
    private String ownerName; //接收者姓名
    private Date createDate; //创立时间
    private Date completeDate ; //完成时间
    private String processId;//流程id
    private String processName;//流程名
    private String title;//标题
    private String isAgentedOrgId;
    private String isAgentedOrgName;
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
	public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getProcessId() {
        return processId;
    }
    public void setProcessId(String processId) {
        this.processId = processId;
    }
    public String getProcessName() {
        return processName;
    }
    public void setProcessName(String processName) {
        this.processName = processName;
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
    public String getAppFormId() {
        return appFormId;
    }
    public void setAppFormId(String appFormId) {
        this.appFormId = appFormId;
    }
    public String getAppId() {
        return appId;
    }
    public void setAppId(String appId) {
        this.appId = appId;
    }
    public Date getCreateDate() {
        return createDate;
    }
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    public Date getCompleteDate() {
        return completeDate;
    }
    public void setCompleteDate(Date completeDate) {
        this.completeDate = completeDate;
    }
    public String getOwnerId() {
        return ownerId;
    }
    public void setOwnerId(String ownerId) {
        this.ownerId = ownerId;
    }
    public String getOwnerName() {
        return ownerName;
    }
    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }
    public String getParentActivityInstId() {
        return parentActivityInstId;
    }
    public void setParentActivityInstId(String parentActivityInstId) {
        this.parentActivityInstId = parentActivityInstId;
    }
    public String getProcessInstanceId() {
        return processInstanceId;
    }
    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
    }
    public String getSenderId() {
        return senderId;
    }
    public void setSenderId(String senderId) {
        this.senderId = senderId;
    }
    public String getSenderName() {
        return senderName;
    }
    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }
    public String getWorkItemId() {
        return workItemId;
    }
    public void setWorkItemId(String workItemId) {
        this.workItemId = workItemId;
    }
}
