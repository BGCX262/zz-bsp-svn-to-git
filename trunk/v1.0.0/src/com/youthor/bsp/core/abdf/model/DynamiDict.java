package com.youthor.bsp.core.abdf.model;

import java.util.ArrayList;
import java.util.List;

public class DynamiDict {
    private String code;
    private String name;
    private String type;
    
    private List dataItem=new ArrayList();
    
    public List getDataItem() {
        return dataItem;
    }
    public void setDataItem(List dataItem) {
        this.dataItem = dataItem;
    }
    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }

}
