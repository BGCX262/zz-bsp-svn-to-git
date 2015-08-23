package com.youthor.bsp.core.abdf.common.model.validation;

import java.util.ArrayList;
import java.util.List;

public class ValidationForm {
     private String name;
     private String displayType;
     private String displayContent;
     private String extJava;
     
     private List fieldList = new ArrayList();
     private List paramList = new ArrayList();
     
	public List getParamList() {
		return paramList;
	}
	public void setParamList(List paramList) {
		this.paramList = paramList;
	}
	public List getFieldList() {
		return fieldList;
	}
	public void setFieldList(List fieldList) {
		this.fieldList = fieldList;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDisplayType() {
		return displayType;
	}
	public void setDisplayType(String displayType) {
		this.displayType = displayType;
	}
	public String getDisplayContent() {
		return displayContent;
	}
	public void setDisplayContent(String displayContent) {
		this.displayContent = displayContent;
	}
	
	public String getExtJava() {
		return extJava;
	}
	public void setExtJava(String extJava) {
		this.extJava = extJava;
	}
}
