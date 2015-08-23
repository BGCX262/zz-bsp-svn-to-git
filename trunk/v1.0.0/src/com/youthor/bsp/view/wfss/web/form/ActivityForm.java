/**
 * 
 */
package com.youthor.bsp.view.wfss.web.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;


public class ActivityForm  extends BaseForm{

    private static final long serialVersionUID = -7534140810361544688L;
    
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
    
    private String partUserIds;
    private String partUserNames;
    
    private String partOrgIds;
    private String partOrgTypeCodes;
    private String partOrgNames;
    
    private String partRoleIds;
    private String partRoleNames;
    
    
    private String partPostIds;
    private String partPostNames;
    
    private String partTeamIds;
    private String partTeamNames;
    
    private String initFormEvent;
    private String backFormEvent;
    private String reDoEvent;
    private String routeSplitId;
    private String joinStrategyBack;
    
    public String getReDoEvent() {
        return reDoEvent;
    }
    public void setReDoEvent(String reDoEvent) {
        this.reDoEvent = reDoEvent;
    }
    public String getBackFormEvent() {
        return backFormEvent;
    }
    public void setBackFormEvent(String backFormEvent) {
        this.backFormEvent = backFormEvent;
    }
    public String getInitFormEvent() {
        return initFormEvent;
    }
    public void setInitFormEvent(String initFormEvent) {
        this.initFormEvent = initFormEvent;
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
    public String getAppFormId() {
        return appFormId;
    }
    public void setAppFormId(String appFormId) {
        this.appFormId = appFormId;
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
    public String getStartProcess() {
        return startProcess;
    }
    public void setStartProcess(String startProcess) {
        this.startProcess = startProcess;
    }
    public String getPartOrgIds() {
        return partOrgIds;
    }
    public void setPartOrgIds(String partOrgIds) {
        this.partOrgIds = partOrgIds;
    }
    public String getPartOrgNames() {
        return partOrgNames;
    }
    public void setPartOrgNames(String partOrgNames) {
        this.partOrgNames = partOrgNames;
    }
    public String getPartPostIds() {
        return partPostIds;
    }
    public void setPartPostIds(String partPostIds) {
        this.partPostIds = partPostIds;
    }
    public String getPartPostNames() {
        return partPostNames;
    }
    public void setPartPostNames(String partPostNames) {
        this.partPostNames = partPostNames;
    }
    public String getPartRoleIds() {
        return partRoleIds;
    }
    public void setPartRoleIds(String partRoleIds) {
        this.partRoleIds = partRoleIds;
    }
    public String getPartRoleNames() {
        return partRoleNames;
    }
    public void setPartRoleNames(String partRoleNames) {
        this.partRoleNames = partRoleNames;
    }
    public String getPartTeamIds() {
        return partTeamIds;
    }
    public void setPartTeamIds(String partTeamIds) {
        this.partTeamIds = partTeamIds;
    }
    public String getPartTeamNames() {
        return partTeamNames;
    }
    public void setPartTeamNames(String partTeamNames) {
        this.partTeamNames = partTeamNames;
    }
    public String getPartUserIds() {
        return partUserIds;
    }
    public void setPartUserIds(String partUserIds) {
        this.partUserIds = partUserIds;
    }
    public String getPartUserNames() {
        return partUserNames;
    }
    public void setPartUserNames(String partUserNames) {
        this.partUserNames = partUserNames;
    }
    public String getPartOrgTypeCodes() {
        return partOrgTypeCodes;
    }
    public void setPartOrgTypeCodes(String partOrgTypeCodes) {
        this.partOrgTypeCodes = partOrgTypeCodes;
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
