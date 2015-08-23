package com.youthor.bsp.view.abdf.common.validation;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.youthor.bsp.core.abdf.common.model.validation.Validation;



public interface IValidationMethod {
     public boolean executeValidation(String value,HttpServletRequest request,Validation validation);
}
