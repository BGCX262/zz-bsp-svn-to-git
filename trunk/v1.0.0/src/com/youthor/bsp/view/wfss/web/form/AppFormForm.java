/**
 * 
 */
package com.youthor.bsp.view.wfss.web.form;

import java.io.Serializable;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

/**
 * @author 胡友成  2007-11-20
 *
 */
public class AppFormForm  extends BaseForm{
    
    private static final long serialVersionUID = 7803606861788812397L;
    
    private String appFormId;
    private String appFormCode ;
    private String appFormName ;
    private String appId ;
    private String comId ;
    private String appFormUrl ;
    private String editionId;
    public String getEditionId() {
        return editionId;
    }
    public void setEditionId(String editionId) {
        this.editionId = editionId;
    }
    public String getAppFormCode() {
        return appFormCode;
    }
    public void setAppFormCode(String appFormCode) {
        this.appFormCode = appFormCode;
    }
    public String getAppFormId() {
        return appFormId;
    }
    public void setAppFormId(String appFormId) {
        this.appFormId = appFormId;
    }
    public String getAppFormName() {
        return appFormName;
    }
    public void setAppFormName(String appFormName) {
        this.appFormName = appFormName;
    }
    public String getAppFormUrl() {
        return appFormUrl;
    }
    public void setAppFormUrl(String appFormUrl) {
        this.appFormUrl = appFormUrl;
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
    
    
    
}
