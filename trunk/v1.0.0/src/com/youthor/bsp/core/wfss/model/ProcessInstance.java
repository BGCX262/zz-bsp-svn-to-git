package com.youthor.bsp.core.wfss.model;

import java.io.Serializable;
import java.util.Date;

public class ProcessInstance implements Serializable{
    private static final long serialVersionUID = 5413184940673189277L;
    
    private String processInstanceId; //流程实例id
    private String parentProcessInstId; //父流程实例id
    private String processId; //流程id
    private String processName; //流程名称
    private String systemId; //所属系统id
    private String appFormId; //业务表单id
    private String appId; //业务数据id
    private String title; //标题
    private Date completeDate; //完成时间
    private String status; //状态
    private String createId; //创立者
    private String createName; //创立者姓名
    private Date createTime;//创立时间
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
    public Date getCompleteDate() {
        return completeDate;
    }
    public void setCompleteDate(Date completeDate) {
        this.completeDate = completeDate;
    }
    public String getCreateId() {
        return createId;
    }
    public void setCreateId(String createId) {
        this.createId = createId;
    }
    public String getCreateName() {
        return createName;
    }
    public void setCreateName(String createName) {
        this.createName = createName;
    }
    public Date getCreateTime() {
        return createTime;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public String getParentProcessInstId() {
        return parentProcessInstId;
    }
    public void setParentProcessInstId(String parentProcessInstId) {
        this.parentProcessInstId = parentProcessInstId;
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
    public String getProcessName() {
        return processName;
    }
    public void setProcessName(String processName) {
        this.processName = processName;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getSystemId() {
        return systemId;
    }
    public void setSystemId(String systemId) {
        this.systemId = systemId;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

}
