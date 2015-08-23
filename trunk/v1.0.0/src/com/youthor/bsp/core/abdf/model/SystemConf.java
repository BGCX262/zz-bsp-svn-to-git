package com.youthor.bsp.core.abdf.model;

public class SystemConf {
    private String key;
    private String value;
    private String memo;
    private String groupName;
    private String inputType;
    private String dictTypeCode;
    private String dictTypeValueType;
    private String systemIn;
    private String notNull;
    public String getInputType() {
        return inputType;
    }

    public void setInputType(String inputType) {
        this.inputType = inputType;
    }

    public String getDictTypeCode() {
        return dictTypeCode;
    }

    public void setDictTypeCode(String dictTypeCode) {
        this.dictTypeCode = dictTypeCode;
    }

    public String getDictTypeValueType() {
        return dictTypeValueType;
    }

    public void setDictTypeValueType(String dictTypeValueType) {
        this.dictTypeValueType = dictTypeValueType;
    }

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

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getSystemIn() {
        return systemIn;
    }

    public void setSystemIn(String systemIn) {
        this.systemIn = systemIn;
    }

    public String getNotNull() {
        return notNull;
    }

    public void setNotNull(String notNull) {
        this.notNull = notNull;
    }
}