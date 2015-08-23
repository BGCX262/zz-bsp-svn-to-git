/**
 * 
 */
package com.youthor.bsp.core.wfss.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


public class Activity implements Serializable{

    private static final long serialVersionUID = -8280410003313351983L;
    
    private String activityId; 
    private String processId; 
    private String activityName; 
    private String activityAlias; 
    private String appFormId; 
    private String splitMode; 
    private String splitStrategy; 
    private String splitId;
    private String joinMode; 
    private String joinStrategy; 
    private String joinId;
    private String operateMode; 
    private String operation;
    private String operateStrategy; 
    private String isFirstNode;
    private String onStartEvent; 
    private String onCompleteEvent; 
    private String editFields;
    private String notNullFields; 
    private String editFieldsName;
    private String notNullFieldsName; 
    private float orderIndex; 
    private String attachPrivilege;
    private String appId;
    private String startProcess;
    private String attachType;
    private String isBatch;
    private String notifyType;
    
    private String attachTypeDynamic;
    private String attachTypeValueMode;
    private String processButtonMode;
    private String initFormEvent;
    private String backFormEvent;
    private String reDoEvent;
    private String routeSplitId;
    private String joinStrategyBack;
    
    
    private List partticipantList=new ArrayList();
    private List routeList = new ArrayList();
    
    public List getRouteList() {
		return routeList;
	}
	public void setRouteList(List routeList) {
		this.routeList = routeList;
	}
	public String getStartProcess() {
        return startProcess;
    }
    public void setStartProcess(String startProcess) {
        this.startProcess = startProcess;
    }
    public String getAppId() {
        return appId;
    }
    public void setAppId(String appId) {
        this.appId = appId;
    }
    public String getActivityAlias() {
        return activityAlias;
    }
    public void setActivityAlias(String activityAlias) {
        this.activityAlias = activityAlias;
    }
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
    
    public String getAttachPrivilege() {
        return attachPrivilege;
    }
    public void setAttachPrivilege(String attachPrivilege) {
        this.attachPrivilege = attachPrivilege;
    }
    public String getAppFormId() {
        return appFormId;
    }
    public void setAppFormId(String appFormId) {
        this.appFormId = appFormId;
    }
    public String getEditFields() {
        return editFields;
    }
    public void setEditFields(String editFields) {
        this.editFields = editFields;
    }
    public String getIsFirstNode() {
        return isFirstNode;
    }
    public void setIsFirstNode(String isFirstNode) {
        this.isFirstNode = isFirstNode;
    }
    public String getJoinId() {
        return joinId;
    }
    public void setJoinId(String joinId) {
        this.joinId = joinId;
    }
    public String getJoinMode() {
        return joinMode;
    }
    public void setJoinMode(String joinMode) {
        this.joinMode = joinMode;
    }
    public String getJoinStrategy() {
        return joinStrategy;
    }
    public void setJoinStrategy(String joinStrategy) {
        this.joinStrategy = joinStrategy;
    }
    public String getNotNullFields() {
        return notNullFields;
    }
    public void setNotNullFields(String notNullFields) {
        this.notNullFields = notNullFields;
    }
    public String getOnCompleteEvent() {
        return onCompleteEvent;
    }
    public void setOnCompleteEvent(String onCompleteEvent) {
        this.onCompleteEvent = onCompleteEvent;
    }
    public String getOnStartEvent() {
        return onStartEvent;
    }
    public void setOnStartEvent(String onStartEvent) {
        this.onStartEvent = onStartEvent;
    }
    public String getOperateMode() {
        return operateMode;
    }
    public void setOperateMode(String operateMode) {
        this.operateMode = operateMode;
    }
    public String getOperateStrategy() {
        return operateStrategy;
    }
    public void setOperateStrategy(String operateStrategy) {
        this.operateStrategy = operateStrategy;
    }
    public String getOperation() {
        return operation;
    }
    public void setOperation(String operation) {
        this.operation = operation;
    }
    public float getOrderIndex() {
        return orderIndex;
    }
    public void setOrderIndex(float orderIndex) {
        this.orderIndex = orderIndex;
    }
    public String getProcessId() {
        return processId;
    }
    public void setProcessId(String processId) {
        this.processId = processId;
    }
    public String getSplitId() {
        return splitId;
    }
    public void setSplitId(String splitId) {
        this.splitId = splitId;
    }
    public String getSplitMode() {
        return splitMode;
    }
    public void setSplitMode(String splitMode) {
        this.splitMode = splitMode;
    }
    public String getSplitStrategy() {
        return splitStrategy;
    }
    public void setSplitStrategy(String splitStrategy) {
        this.splitStrategy = splitStrategy;
    }
    public String getEditFieldsName() {
        return editFieldsName;
    }
    public void setEditFieldsName(String editFieldsName) {
        this.editFieldsName = editFieldsName;
    }
    public String getNotNullFieldsName() {
        return notNullFieldsName;
    }
    public void setNotNullFieldsName(String notNullFieldsName) {
        this.notNullFieldsName = notNullFieldsName;
    }
    public List getPartticipantList() {
        return partticipantList;
    }
    public void setPartticipantList(List partticipantList) {
        this.partticipantList = partticipantList;
    }
    public String getAttachType() {
        return attachType;
    }
    public void setAttachType(String attachType) {
        this.attachType = attachType;
    }
    public String getIsBatch() {
        return isBatch;
    }
    public void setIsBatch(String isBatch) {
        this.isBatch = isBatch;
    }
    public String getNotifyType() {
        return notifyType;
    }
    public void setNotifyType(String notifyType) {
        this.notifyType = notifyType;
    }
    public String getAttachTypeDynamic() {
        return attachTypeDynamic;
    }
    public void setAttachTypeDynamic(String attachTypeDynamic) {
        this.attachTypeDynamic = attachTypeDynamic;
    }
    public String getAttachTypeValueMode() {
        return attachTypeValueMode;
    }
    public void setAttachTypeValueMode(String attachTypeValueMode) {
        this.attachTypeValueMode = attachTypeValueMode;
    }
    public String getProcessButtonMode() {
        return processButtonMode;
    }
    public void setProcessButtonMode(String processButtonMode) {
        this.processButtonMode = processButtonMode;
    }
    public String getInitFormEvent() {
        return initFormEvent;
    }
    public void setInitFormEvent(String initFormEvent) {
        this.initFormEvent = initFormEvent;
    }
    public String getBackFormEvent() {
        return backFormEvent;
    }
    public void setBackFormEvent(String backFormEvent) {
        this.backFormEvent = backFormEvent;
    }
    public String getReDoEvent() {
        return reDoEvent;
    }
    public void setReDoEvent(String reDoEvent) {
        this.reDoEvent = reDoEvent;
    }
	public String getRouteSplitId() {
		return routeSplitId;
	}
	public void setRouteSplitId(String routeSplitId) {
		this.routeSplitId = routeSplitId;
	}
	public String getJoinStrategyBack() {
		return joinStrategyBack;
	}
	public void setJoinStrategyBack(String joinStrategyBack) {
		this.joinStrategyBack = joinStrategyBack;
	}
    
    
    
}
