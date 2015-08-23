/**
 * 
 */
package com.youthor.bsp.core.urss.model;

import java.io.Serializable;


public class OrgType implements Serializable{

    private static final long serialVersionUID = -711088786388314935L;
    
    private String orgTypeId;
    private String orgTypeName;
    private String orgTypeCode;
    private String isUseing="Y";
    private String comId;
    private String systemIn = "N";
    private int orgNumber = 0;
    
    public String getSystemIn() {
		return systemIn;
	}
	public void setSystemIn(String systemIn) {
		this.systemIn = systemIn;
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
    public String getIsUseing() {
        return isUseing;
    }
    public void setIsUseing(String isUseing) {
        this.isUseing = isUseing;
    }
	public int getOrgNumber() {
		return orgNumber;
	}
	public void setOrgNumber(int orgNumber) {
		this.orgNumber = orgNumber;
	}
	
    

}
