/**
 * 
 */
package com.youthor.bsp.core.wfss.model;

import java.io.Serializable;

public class AppFormField implements Serializable{
    
    private static final long serialVersionUID = -604256117466829932L;
    
    private String fieldId; 
     private String fieldName; 
     private String fieldAlias; 
     private String fieldInputType; 
     private String appFormId;
     private String isArray;
     
     
    public String getIsArray() {
        return isArray;
    }
    public void setIsArray(String isArray) {
        this.isArray = isArray;
    }
    public String getAppFormId() {
        return appFormId;
    }
    public void setAppFormId(String appFormId) {
        this.appFormId = appFormId;
    }
    public String getFieldAlias() {
        return fieldAlias;
    }
    public void setFieldAlias(String fieldAlias) {
        this.fieldAlias = fieldAlias;
    }
    public String getFieldId() {
        return fieldId;
    }
    public void setFieldId(String fieldId) {
        this.fieldId = fieldId;
    }
    public String getFieldInputType() {
        return fieldInputType;
    }
    public void setFieldInputType(String fieldInputType) {
        this.fieldInputType = fieldInputType;
    }
    public String getFieldName() {
        return fieldName;
    }
    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

}
