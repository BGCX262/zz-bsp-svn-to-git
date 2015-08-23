package com.youthor.bsp.core.wfss.common.model;

public class WfOrg {
    private String orgId;
    private String orgName;
    private String orgType; //YG 员工,GS公司,BM部门 JS 角色
    private String appId;//应用数据id
    private String isAgentedOrgId;//被代理人id
    private String isAgentedOrgName;//被代理人姓名
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
	public String getOrgName() {
        return orgName;
    }
    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }
    public String getAppId() {
        return appId;
    }
    public void setAppId(String appId) {
        this.appId = appId;
    }
    public String getOrgId() {
        return orgId;
    }
    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }
    public String getOrgType() {
        return orgType;
    }
    public void setOrgType(String orgType) {
        this.orgType = orgType;
    }

}
