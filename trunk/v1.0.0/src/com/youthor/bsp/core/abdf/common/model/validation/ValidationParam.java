package com.youthor.bsp.core.abdf.common.model.validation;

public class ValidationParam {
    private String dataType;
    private String value;
    private boolean page;
    private int index;
    private ValidationForm validationForm;
  
	public ValidationForm getValidationForm() {
		return validationForm;
	}
	public void setValidationForm(ValidationForm validationForm) {
		this.validationForm = validationForm;
	}

	public String getDataType() {
		return dataType;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public boolean isPage() {
		return page;
	}
	public void setPage(boolean page) {
		this.page = page;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
}
