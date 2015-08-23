package com.youthor.bsp.core.urss.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Resource implements Serializable{
    private static final long serialVersionUID = 7406632807906006730L;
    private String resourceId; 
    private String resourceName; 
    private String resourceCode; 
    private String funModuleId; 
    private String isButton; 
    private String buttonId; 
    private String implJs; 
    private String groupName; 
    private String implUrl; 
    private String coopAreaId; 
    private String coopItemName; 
    private float orderIndex; 
    private String coopImg; 
    private String assignMethod;
    private String isMenuDisplay; 
    private String linkAssign;
    private String buttonStyle;
    private String haveOrgRight;
    private String linkAssignValue;
    private String parentResId;
    private String allParentResId;
    private String appId;
    private float orderIndexCoop;
    private String foldArea="Y";//是否收缩区域
    private String processInfo;
    private App app;
    private CoopArea coopArea;
    
    private String implCoopUrl; 
    
    private List subResource=new ArrayList();//子资源
    public List getSubResource() {
        return subResource;
    }
    public void setSubResource(List subResource) {
        this.subResource = subResource;
    }
    public App getApp() {
        return app;
    }
    public void setApp(App app) {
        this.app = app;
    }
    public float getOrderIndexCoop() {
        return orderIndexCoop;
    }
    public void setOrderIndexCoop(float orderIndexCoop) {
        this.orderIndexCoop = orderIndexCoop;
    }
    public String getParentResId() {
        return parentResId;
    }
    public void setParentResId(String parentResId) {
        this.parentResId = parentResId;
    }
    public String getLinkAssignValue() {
        return linkAssignValue;
    }
    public void setLinkAssignValue(String linkAssignValue) {
        this.linkAssignValue = linkAssignValue;
    }
    public String getButtonStyle() {
        return buttonStyle;
    }
    public void setButtonStyle(String buttonStyle) {
        this.buttonStyle = buttonStyle;
    }
    public String getHaveOrgRight() {
        return haveOrgRight;
    }
    public void setHaveOrgRight(String haveOrgRight) {
        this.haveOrgRight = haveOrgRight;
    }
    public String getButtonId() {
        return buttonId;
    }
    public void setButtonId(String buttonId) {
        this.buttonId = buttonId;
    }
    public String getCoopAreaId() {
        return coopAreaId;
    }
    public void setCoopAreaId(String coopAreaId) {
        this.coopAreaId = coopAreaId;
    }
    public String getCoopImg() {
        return coopImg;
    }
    public void setCoopImg(String coopImg) {
        this.coopImg = coopImg;
    }
    public String getCoopItemName() {
        return coopItemName;
    }
    public void setCoopItemName(String coopItemName) {
        this.coopItemName = coopItemName;
    }
    public String getFunModuleId() {
        return funModuleId;
    }
    public void setFunModuleId(String funModuleId) {
        this.funModuleId = funModuleId;
    }
    public String getGroupName() {
        return groupName;
    }
    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }
    public String getImplJs() {
        return implJs;
    }
    public void setImplJs(String implJs) {
        this.implJs = implJs;
    }
    public String getImplUrl() {
        return implUrl;
    }
    public void setImplUrl(String implUrl) {
        this.implUrl = implUrl;
    }
    public String getIsButton() {
        return isButton;
    }
    public void setIsButton(String isButton) {
        this.isButton = isButton;
    }
    public String getIsMenuDisplay() {
        return isMenuDisplay;
    }
    public void setIsMenuDisplay(String isMenuDisplay) {
        this.isMenuDisplay = isMenuDisplay;
    }
    public String getLinkAssign() {
        return linkAssign;
    }
    public void setLinkAssign(String linkAssign) {
        this.linkAssign = linkAssign;
    }
    public float getOrderIndex() {
        return orderIndex;
    }
    public void setOrderIndex(float orderIndex) {
        this.orderIndex = orderIndex;
    }
    public String getResourceCode() {
        return resourceCode;
    }
    public void setResourceCode(String resourceCode) {
        this.resourceCode = resourceCode;
    }
    public String getResourceId() {
        return resourceId;
    }
    public void setResourceId(String resourceId) {
        this.resourceId = resourceId;
    }
    public String getResourceName() {
        return resourceName;
    }
    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }
    public String getAppId() {
        return appId;
    }
    public void setAppId(String appId) {
        this.appId = appId;
    }
    public CoopArea getCoopArea() {
        return coopArea;
    }
    public void setCoopArea(CoopArea coopArea) {
        this.coopArea = coopArea;
    }
    public String getFoldArea() {
        return foldArea;
    }
    public void setFoldArea(String foldArea) {
        this.foldArea = foldArea;
    }
    public String getAllParentResId() {
        return allParentResId;
    }
    public void setAllParentResId(String allParentResId) {
        this.allParentResId = allParentResId;
    }
    public String getProcessInfo() {
        return processInfo;
    }
    public void setProcessInfo(String processInfo) {
        this.processInfo = processInfo;
    }
    public String getImplCoopUrl() {
        return implCoopUrl;
    }
    public void setImplCoopUrl(String implCoopUrl) {
        this.implCoopUrl = implCoopUrl;
    }
    public String getAssignMethod() {
        return assignMethod;
    }
    public void setAssignMethod(String assignMethod) {
        this.assignMethod = assignMethod;
    }

}
