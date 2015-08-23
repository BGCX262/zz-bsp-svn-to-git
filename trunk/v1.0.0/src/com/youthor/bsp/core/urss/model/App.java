package com.youthor.bsp.core.urss.model;

import java.io.Serializable;

public class App implements Serializable{
    private static final long serialVersionUID = 6626226867001153285L;
   
    private String appId;    //应用id
    private String appName;  //应用名称
    private String appCode;  //应用编码
    private String comId; //公司id
    private String appType;  //应用类型
    
    private float orderIndex; //应用排序号
    private String status;     //应用状态
    private String deskUrl;    //桌面地址
    private String appAddress; //应用地址
    private String turnOnMenu="Y";//是否开启菜单
    private String appOutAddress; //应用外网地址
    private String startupMenuCache="Y";//是否启动菜单缓存
    public String getAppOutAddress() {
        return appOutAddress;
    }
    public void setAppOutAddress(String appOutAddress) {
        this.appOutAddress = appOutAddress;
    }
    public String getTurnOnMenu() {
        return turnOnMenu;
    }
    public void setTurnOnMenu(String turnOnMenu) {
        this.turnOnMenu = turnOnMenu;
    }
    
    public String getAppCode() {
        return appCode;
    }
    public void setAppCode(String appCode) {
        this.appCode = appCode;
    }
    public String getAppId() {
        return appId;
    }
    public void setAppId(String appId) {
        this.appId = appId;
    }
    public String getAppName() {
        return appName;
    }
    public void setAppName(String appName) {
        this.appName = appName;
    }
    public String getAppType() {
        return appType;
    }
    public void setAppType(String appType) {
        this.appType = appType;
    }
  
    public String getAppAddress() {
        return appAddress;
    }
    public void setAppAddress(String appAddress) {
        this.appAddress = appAddress;
    }
    public String getDeskUrl() {
        return deskUrl;
    }
    public void setDeskUrl(String deskUrl) {
        this.deskUrl = deskUrl;
    }
    public float getOrderIndex() {
        return orderIndex;
    }
    public void setOrderIndex(float orderIndex) {
        this.orderIndex = orderIndex;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getStartupMenuCache() {
        return startupMenuCache;
    }
    public void setStartupMenuCache(String startupMenuCache) {
        this.startupMenuCache = startupMenuCache;
    }
	public String getComId() {
		return comId;
	}
	public void setComId(String comId) {
		this.comId = comId;
	}
}
