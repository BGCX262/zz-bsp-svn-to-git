/**
 * 
 */
package com.youthor.bsp.core.wfss.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


public class AppForm  implements Serializable{
    
    private static final long serialVersionUID = 7803606861788812397L;
    
    private String appFormId;
    private String appFormCode ;
    private String appFormName ;
    private String appId ;
    private String comId ;
    private String appFormUrl ;
    private String editionId;
    private List appFormFieldList = new ArrayList();
    public List getAppFormFieldList() {
		return appFormFieldList;
	}
	public void setAppFormFieldList(List appFormFieldList) {
		this.appFormFieldList = appFormFieldList;
	}
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
