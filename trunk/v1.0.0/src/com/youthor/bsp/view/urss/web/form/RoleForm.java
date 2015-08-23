package com.youthor.bsp.view.urss.web.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class RoleForm extends BaseForm{
    private static final long serialVersionUID = 4180638113878426004L;
    private String roleId;//角色id
    private String roleName;//角色名称
    private String systemIn;//系统内设置 
    private String appId;//所属应用
    private String roleCode;//角色代码
    private String comId;//所属公司

    
  
   
    public String getAppId() {
        return appId;
    }
    public void setAppId(String appId) {
        this.appId = appId;
    }

    public String getComId() {
        return comId;
    }
    public void setComId(String comId) {
        this.comId = comId;
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
