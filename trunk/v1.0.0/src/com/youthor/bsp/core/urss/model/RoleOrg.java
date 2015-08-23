package com.youthor.bsp.core.urss.model;

import java.io.Serializable;
import java.util.Date;

public class RoleOrg implements Serializable{
    private static final long serialVersionUID = 1085391097380043692L;
    private String roleOrgId="";
    private String roleId;
    private String  orgId;
    private String orgName;
    private String allParentName;
    private String createName;
    private String createId;
    private Date createTime;
    private String systemIn;
       
    public String getSystemIn() {
		return systemIn;
	}
	public void setSystemIn(String systemIn) {
		this.systemIn = systemIn;
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
    public String getOrgId() {
        return orgId;
    }
    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }
    public String getRoleId() {
        return roleId;
    }
    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
    public String getRoleOrgId() {
        return roleOrgId;
    }
    public void setRoleOrgId(String roleOrgId) {
        this.roleOrgId = roleOrgId;
    }
    public String getAllParentName() {
        return allParentName;
    }
    public void setAllParentName(String allParentName) {
        this.allParentName = allParentName;
    }
    public String getOrgName() {
        return orgName;
    }
    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }
  
}
