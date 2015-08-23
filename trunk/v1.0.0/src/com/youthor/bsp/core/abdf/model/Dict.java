package com.youthor.bsp.core.abdf.model;

import java.io.Serializable;

public class Dict implements Serializable{
    private static final long serialVersionUID = -6576299751541895992L;
    private String dictId;//字典id
    private String dictTypeId;//字典类型id
    private String dictValue;//字典值
    private String dictAlias;//字典别名
    private String dictDes;//字典描述
    private String isUse;//是否在用
    private int orderIndex;//排序号
    public int getOrderIndex() {
        return orderIndex;
    }
    public void setOrderIndex(int orderIndex) {
        this.orderIndex = orderIndex;
    }
    public String getDictDes() {
        return dictDes;
    }
    public void setDictDes(String dictDes) {
        this.dictDes = dictDes;
    }
    public String getDictId() {
        return dictId;
    }
    public void setDictId(String dictId) {
        this.dictId = dictId;
    }
    public String getDictTypeId() {
        return dictTypeId;
    }
    public void setDictTypeId(String dictTypeId) {
        this.dictTypeId = dictTypeId;
    }
    public String getDictValue() {
        return dictValue;
    }
    public void setDictValue(String dictValue) {
        this.dictValue = dictValue;
    }
    public String getIsUse() {
        return isUse;
    }
    public void setIsUse(String isUse) {
        this.isUse = isUse;
    }
    public String getDictAlias() {
        return dictAlias;
    }
    public void setDictAlias(String dictAlias) {
        this.dictAlias = dictAlias;
    }

}
