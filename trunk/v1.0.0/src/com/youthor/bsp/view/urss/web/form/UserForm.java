package com.youthor.bsp.view.urss.web.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class UserForm extends BaseForm{
    private static final long serialVersionUID = 8032684640501953536L;
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
}
