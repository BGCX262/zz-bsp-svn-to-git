package com.youthor.bsp.view.abdf.common.validation.impl;

import javax.servlet.http.HttpServletRequest;

import com.youthor.bsp.core.abdf.common.model.validation.Validation;
import com.youthor.bsp.view.abdf.common.validation.IValidationMethod;

public class ValidationRequiredMethod implements IValidationMethod{

	@Override
	public boolean executeValidation(String value, HttpServletRequest request,Validation validation) {
        if (value==null || value.trim().equals("")) return false;
		return true;
	}

}
