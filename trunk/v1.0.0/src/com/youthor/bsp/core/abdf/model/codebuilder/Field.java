package com.youthor.bsp.core.abdf.model.codebuilder;

import com.youthor.bsp.core.abdf.common.helper.StringHelper;

public class Field {
  private String filedName;//域名，数据库字段
  private String dataType;//数据库类型
  private String propertyName;//属性名，用于hibernate中的配置文件
  private String propertyDataType;//数据类型名， 用于hibernate中的配置文件
  private String propertyJavaDataType;//属性名，用于java model中的配置文件
  private String propertyMethodDataType;//方法名，用于java model中的方法
  
public String getPropertyMethodDataType() {
    return StringHelper.changeFirstToUpper(this.propertyName);
}
public void setPropertyMethodDataType(String propertyMethodDataType) {
    this.propertyMethodDataType = propertyMethodDataType;
}
public String getPropertyJavaDataType() {
    if(propertyDataType.equalsIgnoreCase("string"))
        return "String";
    return this.propertyDataType;
}
public void setPropertyJavaDataType(String propertyJavaDataType) {
    this.propertyJavaDataType = propertyJavaDataType;
}
public String getPropertyDataType() {
    if(propertyDataType==null) return "string";
    return propertyDataType;
}
public void setPropertyDataType(String propertyDataType) {
    this.propertyDataType = propertyDataType;
}
public String getPropertyName() {
    return propertyName;
}
public void setPropertyName(String propertyName) {
    this.propertyName = propertyName;
}
public String getDataType() {
    return dataType;
}
public void setDataType(String dataType) {
    this.dataType = dataType;
}
public String getFiledName() {
    return filedName;
}
public void setFiledName(String filedName) {
    this.filedName = filedName;
}
}
