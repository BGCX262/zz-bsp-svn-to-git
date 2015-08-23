package com.youthor.bsp.view.abdf.common.validation.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.model.validation.Validation;
import com.youthor.bsp.core.abdf.common.model.validation.ValidationParam;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.view.abdf.common.validation.IValidationMethod;

public class ValidationHasForeignDataValueMethod implements IValidationMethod{

	@Override
	public boolean executeValidation(String value, HttpServletRequest request,Validation validation) {
		if (value == null || value.trim().equals("")) return true;
		String fire = validation.getFire();
		if (fire != null && !fire.trim().equals("")) {
			String firePageValue = request.getParameter(fire);
			String fireValue = validation.getFireValue();
			if (firePageValue!=null && fireValue!=null && !firePageValue.trim().equals(fireValue)) {
				return true;
			}
		}
			
        List paramList = validation.getValidationField().getValidationForm().getParamList();
        String paramIndex = validation.getParam();
        String [] paramArr = StringHelper.split(paramIndex, ",");
        
        ValidationParam validationParam = (ValidationParam)paramList.get(Integer.parseInt(paramArr[0]));
        String className = validationParam.getValue();

        Map map = new HashMap();
      
        for(int i=1;i<paramArr.length;i++) {
        	validationParam = (ValidationParam)paramList.get(Integer.parseInt(paramArr[i]));
        	
        	String propertyName =validationParam.getValue();
        	String propertyValue = request.getParameter(propertyName);
        	map.put(propertyName, propertyValue);
        }
        IAbdfServiceFacade abdfServiceFacade = (IAbdfServiceFacade)SpringHelper.getBean("abdfServiceFacade");
        int num = abdfServiceFacade.getExistForeignData(className,map);
        if (num>0) return false;
		return true;
	}

}
