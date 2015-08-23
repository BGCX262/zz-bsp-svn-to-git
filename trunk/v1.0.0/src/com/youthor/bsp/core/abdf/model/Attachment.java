package com.youthor.bsp.core.abdf.model;

import java.io.Serializable;
import java.util.Date;

public class Attachment implements Serializable{
    private static final long serialVersionUID = -2657701944181282383L;
    private String attachId; 
    private String oriFileName; 
    private String  filePath; 
    private String realFileName; 
    private int fileSize; 
    private String createId; 
    private String  createName; 
    private Date  createTime; 
    private String  activityId; 
    private String  activityName; 
    private String  appId;
    private String functionName;
    private String processInstanceId;
    private String dictId;
    private String dictName;
    private String processId;
    private String processName;
    public String getActivityId() {
        return activityId;
    }
    public void setActivityId(String activityId) {
        this.activityId = activityId;
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
    public String getAttachId() {
        return attachId;
    }
    public void setAttachId(String attachId) {
        this.attachId = attachId;
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
    public String getFilePath() {
        return filePath;
    }
    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
    public int getFileSize() {
        return fileSize;
    }
    public void setFileSize(int fileSize) {
        this.fileSize = fileSize;
    }
    public String getOriFileName() {
        return oriFileName;
    }
    public void setOriFileName(String oriFileName) {
        this.oriFileName = oriFileName;
    }
    public String getRealFileName() {
        return realFileName;
    }
    public void setRealFileName(String realFileName) {
        this.realFileName = realFileName;
    }
    public String getFunctionName() {
        return functionName;
    }
    public void setFunctionName(String functionName) {
        this.functionName = functionName;
    }
    public String getProcessInstanceId() {
        return processInstanceId;
    }
    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
    }
    public String getDictId() {
        return dictId;
    }
    public void setDictId(String dictId) {
        this.dictId = dictId;
    }
    public String getDictName() {
        return dictName;
    }
    public void setDictName(String dictName) {
        this.dictName = dictName;
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

}
