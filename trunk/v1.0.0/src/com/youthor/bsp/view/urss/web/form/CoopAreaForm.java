/**
 * 
 */
package com.youthor.bsp.view.urss.web.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class CoopAreaForm  extends BaseForm{
    private static final long serialVersionUID = -4039311984673532834L;

    private String  coopAreaId; 
    private String coopAreaName; 
   
    private String coopAreaImg; 
    private String isDynamic; 
    private String implInf; 
    private float orderShow; 
   
    private String coopAreaCode;
    
  
    
   
    public String getCoopAreaId() {
        return coopAreaId;
    }
    public void setCoopAreaId(String coopAreaId) {
        this.coopAreaId = coopAreaId;
    }
    public String getCoopAreaImg() {
        return coopAreaImg;
    }
    public void setCoopAreaImg(String coopAreaImg) {
        this.coopAreaImg = coopAreaImg;
    }
    public String getCoopAreaName() {
        return coopAreaName;
    }
    public void setCoopAreaName(String coopAreaName) {
        this.coopAreaName = coopAreaName;
    }
    public String getImplInf() {
        return implInf;
    }
    public void setImplInf(String implInf) {
        this.implInf = implInf;
    }
    public String getIsDynamic() {
        return isDynamic;
    }
    public void setIsDynamic(String isDynamic) {
        this.isDynamic = isDynamic;
    }
    public float getOrderShow() {
        return orderShow;
    }
    public void setOrderShow(float orderShow) {
        this.orderShow = orderShow;
    }
   
    
 
	
    public String getCoopAreaCode() {
        return coopAreaCode;
    }
    public void setCoopAreaCode(String coopAreaCode) {
        this.coopAreaCode = coopAreaCode;
    }
    
    
}
