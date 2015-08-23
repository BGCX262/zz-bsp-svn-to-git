package com.youthor.bsp.core.wfss.model;

import java.io.Serializable;

public class Expression implements Serializable{
    private static final long serialVersionUID = -4210772998547289342L;
    private String expId;//表达式id
    private String expName;//表达式名称
    private String expType;//表达式分类
    private String expContent;//表达式内容
    private String expUseType;//表达式用途分类
    private String comId;//公司id
    private String appId;//系统id
    private String appFormId;//应用表单id
    public String getAppFormId() {
        return appFormId;
    }
    public void setAppFormId(String appFormId) {
        this.appFormId = appFormId;
    }
    public String getAppId() {
        return appId;
    }
    public void setAppId(String appId) {
        this.appId = appId;
    }
    public String getComId() {
        return comId;
    }
    public void setComId(String comId) {
        this.comId = comId;
    }
    public String getExpContent() {
        return expContent;
    }
    public void setExpContent(String expContent) {
        this.expContent = expContent;
    }
    public String getExpId() {
        return expId;
    }
    public void setExpId(String expId) {
        this.expId = expId;
    }
    public String getExpName() {
        return expName;
    }
    public void setExpName(String expName) {
        this.expName = expName;
    }
    public String getExpType() {
        return expType;
    }
    public void setExpType(String expType) {
        this.expType = expType;
    }
    public String getExpUseType() {
        return expUseType;
    }
    public void setExpUseType(String expUseType) {
        this.expUseType = expUseType;
    }

}
