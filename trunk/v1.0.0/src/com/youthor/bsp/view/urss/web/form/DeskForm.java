package com.youthor.bsp.view.urss.web.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class DeskForm extends BaseForm{
    private static final long serialVersionUID = -8255169308374017389L;
    
    private String deskId;    //桌面id
    private String deskName;  //周面名称
    private String initDisplay;  //应用编码
    private String appId;     //应用id
    private String deskUrl;   //桌面链接
    private float orderIndex; //桌面排序号
    private String comUd;  //注册公司
    
    public String getAppId() {
        return appId;
    }
    public void setAppId(String appId) {
        this.appId = appId;
    }
    public String getDeskId() {
        return deskId;
    }
    public void setDeskId(String deskId) {
        this.deskId = deskId;
    }
    public String getDeskName() {
        return deskName;
    }
    public void setDeskName(String deskName) {
        this.deskName = deskName;
    }
    public String getDeskUrl() {
        return deskUrl;
    }
    public void setDeskUrl(String deskUrl) {
        this.deskUrl = deskUrl;
    }
    public String getInitDisplay() {
        return initDisplay;
    }
    public void setInitDisplay(String initDisplay) {
        this.initDisplay = initDisplay;
    }
    public float getOrderIndex() {
        return orderIndex;
    }
    public void setOrderIndex(float orderIndex) {
        this.orderIndex = orderIndex;
    }
	public String getComUd() {
		return comUd;
	}
	public void setComUd(String comUd) {
		this.comUd = comUd;
	}
  
    
    
    
    
}
