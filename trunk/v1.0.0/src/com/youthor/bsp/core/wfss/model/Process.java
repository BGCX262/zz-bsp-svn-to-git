/**
 * 
 */
package com.youthor.bsp.core.wfss.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


public class Process implements Serializable{
    
    private static final long serialVersionUID = -6804484305941129552L;
    
    private String processId;
    private String processName; 
    private String processAlias;
    private String orgId; 
    private String orgName;
    private String orgTypeCode;
    private String appId;
    private String appFormId;
    private String firstActivityId;
    private String onStartEvent;
    private String onEndEvent;
    private String processImg;
    private String memo;
    private float orderIndex;
    private String cancellationEvent;
    private String  hangEvent;
    private String editionId;
    private String isUsed;
    
    private List activityList = new ArrayList();
    
  
	public List getActivityList() {
		return activityList;
	}
	public void setActivityList(List activityList) {
		this.activityList = activityList;
	}
	public String getEditionId() {
		return editionId;
	}
	public void setEditionId(String editionId) {
		this.editionId = editionId;
	}
	public String getIsUsed() {
		return isUsed;
	}
	public void setIsUsed(String isUsed) {
		this.isUsed = isUsed;
	}
	public String getCancellationEvent() {
        return cancellationEvent;
    }
    public void setCancellationEvent(String cancellationEvent) {
        this.cancellationEvent = cancellationEvent;
    }
    public String getHangEvent() {
        return hangEvent;
    }
    public void setHangEvent(String hangEvent) {
        this.hangEvent = hangEvent;
    }
    public float getOrderIndex() {
        return orderIndex;
    }
    public void setOrderIndex(float orderIndex) {
        this.orderIndex = orderIndex;
    }
    public String getAppId() {
        return appId;
    }
    public void setAppId(String appId) {
        this.appId = appId;
    }
    public String getAppFormId() {
        return appFormId;
    }
    public void setAppFormId(String appFormId) {
        this.appFormId = appFormId;
    }
    public String getFirstActivityId() {
        return firstActivityId;
    }
    public void setFirstActivityId(String firstActivityId) {
        this.firstActivityId = firstActivityId;
    }
    public String getMemo() {
        return memo;
    }
    public void setMemo(String memo) {
        this.memo = memo;
    }
    public String getOnEndEvent() {
        return onEndEvent;
    }
    public void setOnEndEvent(String onEndEvent) {
        this.onEndEvent = onEndEvent;
    }
    public String getOnStartEvent() {
        return onStartEvent;
    }
    public void setOnStartEvent(String onStartEvent) {
        this.onStartEvent = onStartEvent;
    }
    public String getOrgId() {
        return orgId;
    }
    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }
    public String getOrgName() {
        return orgName;
    }
    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }
    public String getProcessAlias() {
        return processAlias;
    }
    public void setProcessAlias(String processAlias) {
        this.processAlias = processAlias;
    }
    public String getProcessId() {
        return processId;
    }
    public void setProcessId(String processId) {
        this.processId = processId;
    }
    public String getProcessImg() {
        return processImg;
    }
    public void setProcessImg(String processImg) {
        this.processImg = processImg;
    }
    public String getProcessName() {
        return processName;
    }
    public void setProcessName(String processName) {
        this.processName = processName;
    }
    public String getOrgTypeCode() {
        return orgTypeCode;
    }
    public void setOrgTypeCode(String orgTypeCode) {
        this.orgTypeCode = orgTypeCode;
    }
    
    public int compareTo(Object arg0) {
        Process process=(Process)arg0;
        if(this.getOrderIndex()>process.getOrderIndex())
            return 1;
        else if(this.getOrderIndex()==process.getOrderIndex())
          return 0;
        else
             return -1;
    }
}
