package com.youthor.bsp.core.abdf.model;

import java.io.Serializable;

public class OnLineHelper implements Serializable{
    private static final long serialVersionUID = 5539841303605308883L;
    private String onLineHelperId; //数据库id
    private String  onLineHelperName; //索引名
    private String  onLineHelperCode; //索引编号
    private String  parentId; //父id
    private String  allParentId; //所有父id
    private String  allParentName;//所有父名称
    private String htmlContent;//html内容
    private float orderShow;//排序号
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
    public String getHtmlContent() {
        return htmlContent;
    }
    public void setHtmlContent(String htmlContent) {
        this.htmlContent = htmlContent;
    }
    public String getOnLineHelperCode() {
        return onLineHelperCode;
    }
    public void setOnLineHelperCode(String onLineHelperCode) {
        this.onLineHelperCode = onLineHelperCode;
    }
    public String getOnLineHelperId() {
        return onLineHelperId;
    }
    public void setOnLineHelperId(String onLineHelperId) {
        this.onLineHelperId = onLineHelperId;
    }
    public String getOnLineHelperName() {
        return onLineHelperName;
    }
    public void setOnLineHelperName(String onLineHelperName) {
        this.onLineHelperName = onLineHelperName;
    }
    public float getOrderShow() {
        return orderShow;
    }
    public void setOrderShow(float orderShow) {
        this.orderShow = orderShow;
    }
    public String getParentId() {
        return parentId;
    }
    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

}
