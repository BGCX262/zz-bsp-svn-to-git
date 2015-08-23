package com.youthor.bsp.core.abdf.common.model.validation;

import java.util.ArrayList;
import java.util.List;

public class Validation {
    private String name;
    private String param;
    private String displayError;
    private ValidationField validationField;
    private String fire;
    private String fireValue;
    private boolean atServer;
	public boolean isAtServer() {
		return atServer;
	}
	public void setAtServer(boolean atServer) {
		this.atServer = atServer;
	}
	public String getFire() {
		return fire;
	}
	public void setFire(String fire) {
		this.fire = fire;
	}
	public String getFireValue() {
		return fireValue;
	}
	public void setFireValue(String fireValue) {
		this.fireValue = fireValue;
	}
	public ValidationField getValidationField() {
		return validationField;
	}
	public void setValidationField(ValidationField validationField) {
		this.validationField = validationField;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getParam() {
		return param;
	}
	public void setParam(String param) {
		this.param = param;
	}
	public String getDisplayError() {
		return displayError;
	}
	public void setDisplayError(String displayError) {
		this.displayError = displayError;
	}
	
}
