package com.youthor.bsp.core.urss.model;

import java.io.Serializable;
import java.util.Map;

public class Org implements Serializable{
    private static final long serialVersionUID = -980711087506810782L;
    private String orgId;
    private String orgName;
    private String parentId;
    private String orgTypeCode;
    private float orderIndex;
    private String allParentId;
    private String orgCode;
    private String userId;
    private String allParentName;
    private String allParentCode;
    private String queryCode;
    private String comId;
    
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getAllParentCode() {
        return allParentCode;
    }

    public void setAllParentCode(String allParentCode) {
        this.allParentCode = allParentCode;
    }

    public String getAllParentId() {
        return allParentId;
    }

    public void setAllParentId(String allParentId) {
        this.allParentId = allParentId;
    }

    public String getAllParentName() {
        return allParentName;
    }

    public void setAllParentName(String allParentName) {
        this.allParentName = allParentName;
    }

    
    

    public float getOrderIndex() {
        return orderIndex;
    }

    public void setOrderIndex(float orderIndex) {
        this.orderIndex = orderIndex;
    }

    public String getOrgCode() {
        return orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
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

    public String getOrgTypeCode() {
        return orgTypeCode;
    }

    public void setOrgTypeCode(String orgTypeCode) {
        this.orgTypeCode = orgTypeCode;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getQueryCode() {
        return queryCode;
    }

    public void setQueryCode(String queryCode) {
        this.queryCode = queryCode;
    }

	public String getComId() {
		return comId;
	}

	public void setComId(String comId) {
		this.comId = comId;
	}

    
}
