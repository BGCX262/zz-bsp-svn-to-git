package com.youthor.bsp.view.abdf.web.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class DictTypeForm extends BaseForm{
    private static final long serialVersionUID = 6449351163353746599L;
    private String dictTypeId;//字典类型id
    private String dictTypeName;//字典名称
    private String dictTypeCode;//字典类型编码
    private String moduleName;  //模块名
    
    public String getDictTypeCode() {
        return dictTypeCode;
    }
    public void setDictTypeCode(String dictTypeCode) {
        this.dictTypeCode = dictTypeCode;
    }
    public String getDictTypeId() {
        return dictTypeId;
    }
    public void setDictTypeId(String dictTypeId) {
        this.dictTypeId = dictTypeId;
    }
    public String getDictTypeName() {
        return dictTypeName;
    }
    public void setDictTypeName(String dictTypeName) {
        this.dictTypeName = dictTypeName;
    }
    public String getModuleName() {
        return moduleName;
    }
    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }
    
    

}
