package com.youthor.bsp.view.abdf.web.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class MessageAcceptForm extends BaseForm{

    /**
     * 
     */
    private static final long serialVersionUID = 3840767144396558753L;
    
    private String id;
    private String sendId;
    private String ownerId;
    private String ownerName;
    private String folderType;
    private String folderIds;
    private java.util.Date acceptTime;
    private String readFlag;
    private java.util.Date readTime;

    
    public String getReadFlag() {
        return readFlag;
    }

    public void setReadFlag(String readFlag) {
        this.readFlag = readFlag;
    }

    public java.util.Date getReadTime() {
        return readTime;
    }

    public void setReadTime(java.util.Date readTime) {
        this.readTime = readTime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSendId() {
        return sendId;
    }

    public void setSendId(String sendId) {
        this.sendId = sendId;
    }

    public String getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(String ownerId) {
        this.ownerId = ownerId;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public String getFolderType() {
        return folderType;
    }

    public void setFolderType(String folderType) {
        this.folderType = folderType;
    }

    public String getFolderIds() {
        return folderIds;
    }

    public void setFolderIds(String folderIds) {
        this.folderIds = folderIds;
    }

    public java.util.Date getAcceptTime() {
        return acceptTime;
    }

    public void setAcceptTime(java.util.Date acceptTime) {
        this.acceptTime = acceptTime;
    }
}
