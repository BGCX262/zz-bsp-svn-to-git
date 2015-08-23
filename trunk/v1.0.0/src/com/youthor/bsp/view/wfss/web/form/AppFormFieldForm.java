/**
 * 
 */
package com.youthor.bsp.view.wfss.web.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;


public class AppFormFieldForm extends BaseForm{

    private static final long serialVersionUID = -8938130065069536980L;
    
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
