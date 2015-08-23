/**
 * 
 */
package com.youthor.bsp.view.urss.web.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;


public class OrgTypeForm extends BaseForm{

    private static final long serialVersionUID = 5956154649875893530L;
    
    private String orgTypeId;
    private String orgTypeName;
    private String orgTypeCode;
    private String comId;
    private String isUseing="Y";
    private String systemIn = "N";
    private int orgNumber = 0;
    public int getOrgNumber() {
		return orgNumber;
	}
	public void setOrgNumber(int orgNumber) {
		this.orgNumber = orgNumber;
	}
	public String getSystemIn() {
		return systemIn;
	}
	public void setSystemIn(String systemIn) {
		this.systemIn = systemIn;
	}
	public String getIsUseing() {
        return isUseing;
    }
    public void setIsUseing(String isUseing) {
        this.isUseing = isUseing;
    }
    public String getOrgTypeCode() {
        return orgTypeCode;
    }
    public void setOrgTypeCode(String orgTypeCode) {
        this.orgTypeCode = orgTypeCode;
    }
    public String getOrgTypeId() {
        return orgTypeId;
    }
    public void setOrgTypeId(String orgTypeId) {
        this.orgTypeId = orgTypeId;
    }
    public String getOrgTypeName() {
        return orgTypeName;
    }
    public void setOrgTypeName(String orgTypeName) {
        this.orgTypeName = orgTypeName;
    }
    public String getComId() {
        return comId;
    }
    public void setComId(String comId) {
        this.comId = comId;
    }
}
