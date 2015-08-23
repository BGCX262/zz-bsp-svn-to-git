/**
 * 
 */
package com.youthor.bsp.view.wfss.web.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;


public class ProcessForm  extends BaseForm{

    private static final long serialVersionUID = -2209890663775999856L;

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
    private String cancellationEvent;
    private String  hangEvent;
    private String editionId;
    private String isUsed;
    
    
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
}
