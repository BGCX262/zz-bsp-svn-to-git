package com.youthor.bsp.core.urss.model;

import java.util.Date;

public class AppCom {
       private String appComId;
       private String appId;
       private String comId;
       private String status;
       private Date validDate;
       
       private String appName;
       private String comName;
       
    public String getAppComId() {
        return appComId;
    }
    public void setAppComId(String appComId) {
        this.appComId = appComId;
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
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getAppName() {
        return appName;
    }
    public void setAppName(String appName) {
        this.appName = appName;
    }
    public String getComName() {
        return comName;
    }
    public void setComName(String comName) {
        this.comName = comName;
    }
    public Date getValidDate() {
        return validDate;
    }
    public void setValidDate(Date validDate) {
        this.validDate = validDate;
    }
       
   }
