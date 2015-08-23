package com.youthor.bsp.view.abdf.web.form;

import com.youthor.bsp.view.abdf.common.base.BaseForm;

public class DictForm extends BaseForm{
    private static final long serialVersionUID = -7799006745506978644L;
    private String dictId;//字典id
    private String dictTypeId;//字典类型id
    private String dictValue;//字典值
    private String dictAlias;//字典别名
    private String dictDes;//字典描述
    private String isUse;//是否在用
    private int orderIndex;//排序号
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
    public int getOrderIndex() {
        return orderIndex;
    }
    public void setOrderIndex(int orderIndex) {
        this.orderIndex = orderIndex;
    }
    public String getDictAlias() {
        return dictAlias;
    }
    public void setDictAlias(String dictAlias) {
        this.dictAlias = dictAlias;
    }
    

}
