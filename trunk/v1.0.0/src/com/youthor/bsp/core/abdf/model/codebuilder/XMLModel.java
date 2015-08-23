package com.youthor.bsp.core.abdf.model.codebuilder;

public class XMLModel {
    private String packageName;
    private String tableName;
    private String className;
    private String keyFieldName;
    private String keyPropertyName;
    public String getKeyFieldName() {
        return keyFieldName;
    }
    public void setKeyFieldName(String keyFieldName) {
        this.keyFieldName = keyFieldName;
    }
    public String getClassName() {
        return className;
    }
    public void setClassName(String className) {
        this.className = className;
    }
    public String getPackageName() {
        return packageName;
    }
    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }
    public String getTableName() {
        return tableName;
    }
    public void setTableName(String tableName) {
        this.tableName = tableName;
    }
    public String getKeyPropertyName() {
        return keyPropertyName;
    }
    public void setKeyPropertyName(String keyPropertyName) {
        this.keyPropertyName = keyPropertyName;
    }

}
