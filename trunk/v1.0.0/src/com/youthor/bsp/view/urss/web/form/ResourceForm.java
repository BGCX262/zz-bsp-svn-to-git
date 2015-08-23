package com.youthor.bsp.view.urss.web.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class ResourceForm extends BaseForm{
    private static final long serialVersionUID = 6055197901837472321L;
    private String resourceId; 
    private String resourceName; 
    private String resourceCode; 
    private String funModuleId; 
    private String isButton; 
    private String buttonStyle;
    private String buttonId; 
    private String implJs; 
    private String groupName; 
    private String implUrl; 
    private String coopAreaId; 
    private String coopAreaIdName;
    private String assignMethod;
    private String coopItemName; 
    private float orderIndex; 
    private String coopImg; 
    private String isMenuDisplay; 
    private String linkAssign;
    private String haveOrgRight;
    private String linkAssignValue;
    private String parentResId;
    private float orderIndexCoop;
    private String appId;
    private String foldArea="Y";//是否收缩区域
    private String processInfo;

    public String getProcessInfo() {
        return processInfo;
    }

    public void setProcessInfo(String processInfo) {
        this.processInfo = processInfo;
    }

    public String getFoldArea() {
        return foldArea;
    }

    public void setFoldArea(String foldArea) {
        this.foldArea = foldArea;
    }

    public String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId;
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
    public String getButtonStyle() {
        return buttonStyle;
    }
    public void setButtonStyle(String buttonStyle) {
        this.buttonStyle = buttonStyle;
    }
    public String getCoopAreaIdName() {
        return coopAreaIdName;
    }
    public void setCoopAreaIdName(String coopAreaIdName) {
        this.coopAreaIdName = coopAreaIdName;
    }
    public String getHaveOrgRight() {
        return haveOrgRight;
    }
    public void setHaveOrgRight(String haveOrgRight) {
        this.haveOrgRight = haveOrgRight;
    }

    public String getAssignMethod() {
        return assignMethod;
    }

    public void setAssignMethod(String assignMethod) {
        this.assignMethod = assignMethod;
    }
}
