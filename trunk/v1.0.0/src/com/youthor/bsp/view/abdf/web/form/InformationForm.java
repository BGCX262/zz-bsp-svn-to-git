package com.youthor.bsp.view.abdf.web.form;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts.upload.FormFile;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class InformationForm extends BaseForm {
    /**
     * 
     */
    private static final long serialVersionUID = -69696758223802240L;
    private String infoId;
    private String infoType;
    private String infoTitle;
    private String htmlContent;
    private String infoStatus;
    private java.util.Date createTime;
    private java.util.Date createTime1;
    private String createOrgId;
    private String createOrgName;
    private java.util.Date abledDate;
    private java.util.Date abledDate1;
    private java.util.Date disabledDate;
    private java.util.Date disabledDate1;
    private String url;

    private List attahFormList = new ArrayList();

    public List getAttahFormList() {
        return attahFormList;
    }

    public void setAttahFormList(List attahFormList) {
        this.attahFormList = attahFormList;
    }

    public void setUploadFile(String index, FormFile formFile) {
        this.attahFormList.add(formFile);
    }

    public String getInfoId() {
        return infoId;
    }

    public void setInfoId(String infoId) {
        this.infoId = infoId;
    }

    public String getInfoType() {
        return infoType;
    }

    public void setInfoType(String infoType) {
        this.infoType = infoType;
    }

    public String getInfoTitle() {
        return infoTitle;
    }

    public void setInfoTitle(String infoTitle) {
        this.infoTitle = infoTitle;
    }

    public String getHtmlContent() {
        return htmlContent;
    }

    public void setHtmlContent(String htmlContent) {
        this.htmlContent = htmlContent;
    }

    public String getInfoStatus() {
        return infoStatus;
    }

    public void setInfoStatus(String infoStatus) {
        this.infoStatus = infoStatus;
    }

    public java.util.Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(java.util.Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateOrgId() {
        return createOrgId;
    }

    public void setCreateOrgId(String createOrgId) {
        this.createOrgId = createOrgId;
    }

    public String getCreateOrgName() {
        return createOrgName;
    }

    public void setCreateOrgName(String createOrgName) {
        this.createOrgName = createOrgName;
    }

    public java.util.Date getAbledDate() {
        return abledDate;
    }

    public void setAbledDate(java.util.Date abledDate) {
        this.abledDate = abledDate;
    }

    public java.util.Date getDisabledDate() {
        return disabledDate;
    }

    public void setDisabledDate(java.util.Date disabledDate) {
        this.disabledDate = disabledDate;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public java.util.Date getCreateTime1() {
        return createTime1;
    }

    public void setCreateTime1(java.util.Date createTime1) {
        this.createTime1 = createTime1;
    }

    public java.util.Date getAbledDate1() {
        return abledDate1;
    }

    public void setAbledDate1(java.util.Date abledDate1) {
        this.abledDate1 = abledDate1;
    }

    public java.util.Date getDisabledDate1() {
        return disabledDate1;
    }

    public void setDisabledDate1(java.util.Date disabledDate1) {
        this.disabledDate1 = disabledDate1;
    }
}