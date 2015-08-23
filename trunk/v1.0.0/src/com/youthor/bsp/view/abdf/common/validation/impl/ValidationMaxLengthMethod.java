package com.youthor.bsp.view.abdf.common.validation.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.youthor.bsp.core.abdf.common.model.validation.Validation;
import com.youthor.bsp.core.abdf.common.model.validation.ValidationParam;
import com.youthor.bsp.view.abdf.common.validation.IValidationMethod;

public class ValidationMaxLengthMethod implements IValidationMethod{

	@Override
	public boolean executeValidation( String value, HttpServletRequest request,Validation validation) {
        int vlaueLength = value.length();
        List paramList = validation.getValidationField().getValidationForm().getParamList();
        String paraIndex = validation.getParam();
        int paraIndexInt = Integer.parseInt(paraIndex);
        ValidationParam validationParam = (ValidationParam)paramList.get(paraIndexInt);
        if (!validationParam.isPage()) {
        	int length = Integer.parseInt(validationParam.getValue());
        	return vlaueLength <= length;
        }
		return true;
	}

}
