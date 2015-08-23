package com.youthor.bsp.core.urss.model;

import java.io.Serializable;

public class Desk implements Serializable{
    private static final long serialVersionUID = -8825444905309733627L;
       
    private String deskId;    //桌面id
    private String deskName;  //周面名称
    private int initDisplay;  //应用编码
    private String appId;     //应用id
    private String deskUrl;   //桌面链接
    private float orderIndex; //桌面排序号
    private String comId;  //注册公司
    
    public String getAppId() {
        return appId;
    }
    public void setAppId(String appId) {
        this.appId = appId;
    }
    public String getDeskId() {
        return deskId;
    }
    public void setDeskId(String deskId) {
        this.deskId = deskId;
    }
    public String getDeskName() {
        return deskName;
    }
    public void setDeskName(String deskName) {
        this.deskName = deskName;
    }
    public String getDeskUrl() {
        return deskUrl;
    }
    public void setDeskUrl(String deskUrl) {
        this.deskUrl = deskUrl;
    }
    public int getInitDisplay() {
        return initDisplay;
    }
    public void setInitDisplay(int initDisplay) {
        this.initDisplay = initDisplay;
    }
    public float getOrderIndex() {
        return orderIndex;
    }
    public void setOrderIndex(float orderIndex) {
        this.orderIndex = orderIndex;
    }
	public String getComId() {
		return comId;
	}
	public void setComId(String comId) {
		this.comId = comId;
	}
   
    
}
