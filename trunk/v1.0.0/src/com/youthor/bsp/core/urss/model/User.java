package com.youthor.bsp.core.urss.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class User implements Serializable{
    private static final long serialVersionUID = -9186289488831481186L;
    
    private String userId; 
    private String userCode; 
    private String userName;
    private String userEmail; 
    private String userFixdTel; 
    private String userMoveTel; 
    private String loginId; 
    private String pwd; 
    private String comId;
    private String oldPwd;

    public String getOldPwd() {
        return oldPwd;
    }
    
    public void setOldPwd(String oldPwd) {
        this.oldPwd = oldPwd;
    }
    
    private List orgList=new ArrayList();
    
    public String getComId() {
        return comId;
    }
    public void setComId(String comId) {
        this.comId = comId;
    }
    public String getLoginId() {
        return loginId;
    }
    public void setLoginId(String loginId) {
        this.loginId = loginId;
    }
    public String getPwd() {
        return pwd;
    }
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
    public String getUserCode() {
        return userCode;
    }
    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }
    public String getUserEmail() {
        return userEmail;
    }
    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
    public String getUserFixdTel() {
        return userFixdTel;
    }
    public void setUserFixdTel(String userFixdTel) {
        this.userFixdTel = userFixdTel;
    }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getUserMoveTel() {
        return userMoveTel;
    }
    public void setUserMoveTel(String userMoveTel) {
        this.userMoveTel = userMoveTel;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public List getOrgList() {
        return orgList;
    }
    public void setOrgList(List orgList) {
        this.orgList = orgList;
    }

}
