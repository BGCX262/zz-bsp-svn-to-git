package com.youthor.bsp.core.urss.model;

import java.io.Serializable;
import java.util.Date;

public class RegCompany implements Serializable{
    private static final long serialVersionUID = 1977633145506544600L;
    private String comId; //注册公司id
    private String regComName; //公司名称
    private String regComCode; //公司编号
    private String regComAddress; //公司地址
    private String regComEmail; //公司email
    private String regComBoss; //公司法人
    private double captil; //注册资金
    private String userType; //用户类型
    private Date createTime;// 建立时间
    private Date endTime; //有效结束日期
    
    public Date getCreateTime() {
        return createTime;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public double getCaptil() {
        return captil;
    }
    public void setCaptil(double captil) {
        this.captil = captil;
    }
    public Date getEndTime() {
        return endTime;
    }
    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }
    public String getRegComAddress() {
        return regComAddress;
    }
    public void setRegComAddress(String regComAddress) {
        this.regComAddress = regComAddress;
    }
    public String getRegComBoss() {
        return regComBoss;
    }
    public void setRegComBoss(String regComBoss) {
        this.regComBoss = regComBoss;
    }
    public String getRegComCode() {
        return regComCode;
    }
    public void setRegComCode(String regComCode) {
        this.regComCode = regComCode;
    }
    public String getRegComEmail() {
        return regComEmail;
    }
    public void setRegComEmail(String regComEmail) {
        this.regComEmail = regComEmail;
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
