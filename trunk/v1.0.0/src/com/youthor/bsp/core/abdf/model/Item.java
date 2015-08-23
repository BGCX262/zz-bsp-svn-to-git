package com.youthor.bsp.core.abdf.model;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class Item implements Serializable{

    private static final long serialVersionUID = -3646449006370113095L;
    private String key;
    private String value;
    private String isUse;
    private Map extendPara=new HashMap();
    public String getKey() {
        return key;
    }
    public void setKey(String key) {
        this.key = key;
    }
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }
    public Map getExtendPara() {
        return extendPara;
    }
    public void setExtendPara(Map extendPara) {
        this.extendPara = extendPara;
    }
    public String getIsUse() {
        return isUse;
    }
    public void setIsUse(String isUse) {
        this.isUse = isUse;
    }
    

}
