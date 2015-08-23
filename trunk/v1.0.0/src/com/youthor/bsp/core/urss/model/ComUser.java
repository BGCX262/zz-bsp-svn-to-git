package com.youthor.bsp.core.urss.model;

import java.io.Serializable;

public class ComUser implements Serializable{
    private static final long serialVersionUID = -7142066450495940386L;
    private String comUserId; //公司用户id
    private String comUserName; //公司用户姓名
    private String logonId; //logon_id
    private String pwd; //密码
    private String comId; //所属注册公司id
    private String regComName; //所属注册公司名称
    private String orgId; //所有组织id
    private String orgName; //所有组织名称
    private String userType;//用户类型
    public String getComUserId() {
        return comUserId;
    }
    public void setComUserId(String comUserId) {
        this.comUserId = comUserId;
    }
    public String getComUserName() {
        return comUserName;
    }
    public void setComUserName(String comUserName) {
        this.comUserName = comUserName;
    }
    public String getLogonId() {
        return logonId;
    }
    public void setLogonId(String logonId) {
        this.logonId = logonId;
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
    public String getPwd() {
        return pwd;
    }
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
    public String getComId() {
        return comId;
    }
    public void setComId(String comId) {
        this.comId = comId;
    }
    public String getRegComName() {
        return regComName;
    }
    public void setRegComName(String regComName) {
        this.regComName = regComName;
    }
    public String getUserType() {
        return userType;
    }
    public void setUserType(String userType) {
        this.userType = userType;
    }

}
