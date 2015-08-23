package com.youthor.bsp.view.abdf.web.form;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts.upload.FormFile;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class OnLineHelperForm extends BaseForm{
    private static final long serialVersionUID = 94085196033802505L;
    private String onLineHelperId; //数据库id
    private String  onLineHelperName; //索引名
    private String  onLineHelperCode; //索引编号
    private String  parentId; //父id
    private String  allParentId; //所有父id
    private String  allParentName;//所有父名称
    private String htmlContent;//html内容
    private float orderShow;//排序号
    private float orderShowOld;
    private String onLineHelperNameOld;
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

    public String getOnLineHelperNameOld() {
        return onLineHelperNameOld;
    }

    public void setOnLineHelperNameOld(String onLineHelperNameOld) {
        this.onLineHelperNameOld = onLineHelperNameOld;
    }

    public float getOrderShowOld() {
        return orderShowOld;
    }

    public void setOrderShowOld(float orderShowOld) {
        this.orderShowOld = orderShowOld;
    }
    
    

}
