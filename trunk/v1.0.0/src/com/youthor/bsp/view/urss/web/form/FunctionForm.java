package com.youthor.bsp.view.urss.web.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class FunctionForm extends BaseForm{
    private static final long serialVersionUID = 1302533917837064233L;
    private String funModuleId; 
    private String funModuleName; 
    private String parentId; 
    private String allParentId; 
    private String allParentName; 
    private String isMenu; 
    private String isPublic; 
    private String implUrl; 
    private String smallImg; 
    private String bigImg; 
    private String funCode; 
    private float orderIndex; 
    private String appId; 
    private String windowStyle;
    private int windowHeight;
    private int windowWidth;
    private String foldArea="Y";//是否收缩区域
    public String getFoldArea() {
        return foldArea;
    }
    public void setFoldArea(String foldArea) {
        this.foldArea = foldArea;
    }
    public String getAllParentId() {
        return allParentId;
    }
    public void setAllParentId(String allParentId) {
        this.allParentId = allParentId;
    }
    public String getAllParentName() {
        return allParentName;
    }
    public void setAllParentName(String allParentName) {
        this.allParentName = allParentName;
    }
    public String getAppId() {
        return appId;
    }
    public void setAppId(String appId) {
        this.appId = appId;
    }
    public String getBigImg() {
        return bigImg;
    }
    public void setBigImg(String bigImg) {
        this.bigImg = bigImg;
    }
    public String getFunCode() {
        return funCode;
    }
    public void setFunCode(String funCode) {
        this.funCode = funCode;
    }
    public String getFunModuleId() {
        return funModuleId;
    }
    public void setFunModuleId(String funModuleId) {
        this.funModuleId = funModuleId;
    }
    public String getFunModuleName() {
        return funModuleName;
    }
    public void setFunModuleName(String funModuleName) {
        this.funModuleName = funModuleName;
    }
    public String getImplUrl() {
        return implUrl;
    }
    public void setImplUrl(String implUrl) {
        this.implUrl = implUrl;
    }
    public String getIsMenu() {
        return isMenu;
    }
    public void setIsMenu(String isMenu) {
        this.isMenu = isMenu;
    }
    public String getIsPublic() {
        return isPublic;
    }
    public void setIsPublic(String isPublic) {
        this.isPublic = isPublic;
    }
    public float getOrderIndex() {
        return orderIndex;
    }
    public void setOrderIndex(float orderIndex) {
        this.orderIndex = orderIndex;
    }
    public String getParentId() {
        return parentId;
    }
    public void setParentId(String parentId) {
        this.parentId = parentId;
    }
    public String getSmallImg() {
        return smallImg;
    }
    public void setSmallImg(String smallImg) {
        this.smallImg = smallImg;
    }
    public String getWindowStyle() {
        return windowStyle;
    }
    public void setWindowStyle(String windowStyle) {
        this.windowStyle = windowStyle;
    }
    public int getWindowHeight() {
        return windowHeight;
    }
    public void setWindowHeight(int windowHeight) {
        this.windowHeight = windowHeight;
    }
    public int getWindowWidth() {
        return windowWidth;
    }
    public void setWindowWidth(int windowWidth) {
        this.windowWidth = windowWidth;
    }
    
}
