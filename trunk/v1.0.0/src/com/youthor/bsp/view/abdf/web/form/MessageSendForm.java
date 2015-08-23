package com.youthor.bsp.view.abdf.web.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class MessageSendForm extends BaseForm{
    /**
     * 
     */
    private static final long serialVersionUID = 553371620994654185L;
    
    private String id;
    private String sendOrgId;
    private String sendOrgName;
    private String acceptOrgIds;
    private String acceptOrgNames;
    private String acceptOrgTypes;
    private String isSend;
    private String folderType;
    private String folderId;
    private String htmlContent;
    private String isDelete;
    private java.util.Date createTime;
    private String htmlTitle;
    
    public String getHtmlTitle() {
        return htmlTitle;
    }

    public void setHtmlTitle(String htmlTitle) {
        this.htmlTitle = htmlTitle;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSendOrgId() {
        return sendOrgId;
    }

    public void setSendOrgId(String sendOrgId) {
        this.sendOrgId = sendOrgId;
    }

    public String getSendOrgName() {
        return sendOrgName;
    }

    public void setSendOrgName(String sendOrgName) {
        this.sendOrgName = sendOrgName;
    }

    public String getAcceptOrgIds() {
        return acceptOrgIds;
    }

    public void setAcceptOrgIds(String acceptOrgIds) {
        this.acceptOrgIds = acceptOrgIds;
    }

    public String getAcceptOrgNames() {
        return acceptOrgNames;
    }

    public void setAcceptOrgNames(String acceptOrgNames) {
        this.acceptOrgNames = acceptOrgNames;
    }

    public String getAcceptOrgTypes() {
        return acceptOrgTypes;
    }

    public void setAcceptOrgTypes(String acceptOrgTypes) {
        this.acceptOrgTypes = acceptOrgTypes;
    }

    public String getIsSend() {
        return isSend;
    }

    public void setIsSend(String isSend) {
        this.isSend = isSend;
    }

    public String getFolderType() {
        return folderType;
    }

    public void setFolderType(String folderType) {
        this.folderType = folderType;
    }

    public String getFolderId() {
        return folderId;
    }

    public void setFolderId(String folderId) {
        this.folderId = folderId;
    }

    public String getHtmlContent() {
        return htmlContent;
    }

    public void setHtmlContent(String htmlContent) {
        this.htmlContent = htmlContent;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

    public java.util.Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(java.util.Date createTime) {
        this.createTime = createTime;
    }
}
