package com.youthor.bsp.core.abdf.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class DictType implements Serializable{

    private static final long serialVersionUID = 3191741361708328807L;
    private String dictTypeId;//字典类型id
    private String dictTypeName;//字典名称
    private String dictTypeCode;//字典类型编码
    private String moduleName;  //模块名
    private String comId;//公司id
    
    
    //所包含的字典
    private List dictList=new ArrayList();
    
    
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
    
    
    public List getDictList() {
        return dictList;
    }
    public void setDictList(List dictList) {
        this.dictList = dictList;
    }
    public String getModuleName() {
        return moduleName;
    }
    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }
    public String getComId() {
        return comId;
    }
    public void setComId(String comId) {
        this.comId = comId;
    }

}
