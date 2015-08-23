package com.youthor.bsp.core.urss.model;

import java.io.Serializable;

public class Right implements Serializable{
    private static final long serialVersionUID = 3017487041712866921L;
    private String  rightId;
    private String  resourceId;
    private String  funModuleId;
    private String  appId;
    private String  memberId;
    private String  memberType;
    private String  orgIds;
    private String  orgNames;
    private String  orgTypes;
    private String  orgFlag;
    
    public String getAppId() {
        return appId;
    }
    public void setAppId(String appId) {
        this.appId = appId;
    }
    public String getFunModuleId() {
        return funModuleId;
    }
    public void setFunModuleId(String funModuleId) {
        this.funModuleId = funModuleId;
    }
    public String getMemberId() {
        return memberId;
    }
    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }
    public String getMemberType() {
        return memberType;
    }
    public void setMemberType(String memberType) {
        this.memberType = memberType;
    }
    public String getOrgFlag() {
        return orgFlag;
    }
    public void setOrgFlag(String orgFlag) {
        this.orgFlag = orgFlag;
    }
    public String getOrgIds() {
        return orgIds;
    }
    public void setOrgIds(String orgIds) {
        this.orgIds = orgIds;
    }
    public String getOrgNames() {
        return orgNames;
    }
    public void setOrgNames(String orgNames) {
        this.orgNames = orgNames;
    }
    public String getOrgTypes() {
        return orgTypes;
    }
    public void setOrgTypes(String orgTypes) {
        this.orgTypes = orgTypes;
    }
    public String getResourceId() {
        return resourceId;
    }
    public void setResourceId(String resourceId) {
        this.resourceId = resourceId;
    }
    public String getRightId() {
        return rightId;
    }
    public void setRightId(String rightId) {
        this.rightId = rightId;
    }

}
