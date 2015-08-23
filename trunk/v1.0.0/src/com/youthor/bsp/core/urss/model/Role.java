package com.youthor.bsp.core.urss.model;

import java.io.Serializable;

public class Role implements Serializable{
    private static final long serialVersionUID = 2039709694522064356L;
    private String roleId;//角色id
    private String roleName;//角色名称
    private String appId;//所属应用
    private String comId;//所属公司
    private String systemIn;//系统内设置 
    private String roleCode;//角色代码
   
    public String getAppId() {
        return appId;
    }
    public void setAppId(String appId) {
        this.appId = appId;
    }
 
   
    public String getRoleId() {
        return roleId;
    }
    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
    public String getRoleName() {
        return roleName;
    }
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

	public String getComId() {
		return comId;
	}
	public void setComId(String comId) {
		this.comId = comId;
	}
	public String getSystemIn() {
		return systemIn;
	}
	public void setSystemIn(String systemIn) {
		this.systemIn = systemIn;
	}
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}

}
