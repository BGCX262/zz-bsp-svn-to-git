package com.youthor.bsp.core.abdf.common.model.validation;

import java.util.ArrayList;
import java.util.List;

public class ValidationField {
    private String name;
    private String desc;
    private String fireFieldName;
    private String fireFieldValue;
    private boolean array =false;
    private ValidationForm validationForm;
    
    private List validationList = new ArrayList();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public String getFireFieldName() {
		return fireFieldName;
	}

	public void setFireFieldName(String fireFieldName) {
		this.fireFieldName = fireFieldName;
	}

	public String getFireFieldValue() {
		return fireFieldValue;
	}

	public void setFireFieldValue(String fireFieldValue) {
		this.fireFieldValue = fireFieldValue;
	}

	public List getValidationList() {
		return validationList;
	}

	public void setValidationList(List validationList) {
		this.validationList = validationList;
	}

	public boolean isArray() {
		return array;
	}

	public void setArray(boolean array) {
		this.array = array;
	}

	public ValidationForm getValidationForm() {
		return validationForm;
	}

	public void setValidationForm(ValidationForm validationForm) {
		this.validationForm = validationForm;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
    
    
    
}
