package com.youthor.bsp.view.abdf.common.helper;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.PropertyUtils;

import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.AbdfCache;
import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.abdf.common.model.validation.Validation;
import com.youthor.bsp.core.abdf.common.model.validation.ValidationField;
import com.youthor.bsp.core.abdf.common.model.validation.ValidationForm;
import com.youthor.bsp.core.abdf.common.model.validation.ValidationParam;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.view.abdf.common.validation.IValidationMethod;

public class ValidationHelper {
	
	 public static boolean isAuthorityForCom(String comId,Class clazz,String idValue) {
		 if (StringHelper.doWithNull(idValue).equals("")) return true;
		 IAbdfServiceFacade abdfServiceFacade = (IAbdfServiceFacade)SpringHelper.getBean("abdfServiceFacade");
		 Object object = abdfServiceFacade.getObjectByClassAndIdValue(clazz,idValue);
		 
		 try {
			String objComId = (String)PropertyUtils.getProperty(object, "comId");
			return objComId.trim().equals(comId.trim());
			
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// ObjectHelper.getMethodValue(property, object);
		 return true;
	 }
	 
	 
     public static boolean isAuthorityForCom(HttpServletRequest request,Class cla,String idValue) {
    	 if (StringHelper.doWithNull(idValue).equals("")) return true;
    	  HttpSession session=request.getSession();
	      String comId=WebHelper.getTopOrgId(session, Constants.GLOBAL_GS);
		 return isAuthorityForCom(comId,cla,idValue);
	 }
     
     public static boolean isAuthorityForCom(HttpSession session,Class cla,String idValue) {
    	 if (StringHelper.doWithNull(idValue).equals("")) return true;
	      String comId=WebHelper.getTopOrgId(session, Constants.GLOBAL_GS);
		 return isAuthorityForCom(comId,cla,idValue);
	 }
     
 	public static boolean isAuthorityForCom(HttpServletRequest request, Object object) {
		  HttpSession session=request.getSession();
	      String comId=WebHelper.getTopOrgId(session, Constants.GLOBAL_GS);
		 try {
				String objComId = (String)PropertyUtils.getProperty(object, "comId");
				return objComId.trim().equals(comId.trim());
				
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// ObjectHelper.getMethodValue(property, object);
			 return true;
	}
	 
	 
	 public static List validateForm(HttpServletRequest request,String moduleName,String formName) {
		 ValidationForm validationForm =  (ValidationForm)AbdfCache.mapValidationForm.get(moduleName+"-"+formName);
		 List paramList = validationForm.getParamList();
		 HttpSession  session = request.getSession();
		 session.setAttribute("ERROR_ValidationForm",validationForm);
		 List fieldList = validationForm.getFieldList();
		 if (fieldList!=null && fieldList.size()>0) {
			 for(int i=0;i<fieldList.size();i++) {
				 ValidationField validationField = (ValidationField)fieldList.get(i);
				 String value = "";
				 if (!validationField.isArray()) {
					 value = request.getParameter(validationField.getName());
				 }
				 else {
					 //是数组的形式
				 }
				 List validationList = validationField.getValidationList();
				 if (validationList!=null && validationList.size()>0) {
					 for(int j=0;j<validationList.size();j++) {
						 Validation validation = (Validation)validationList.get(j);
						 if (!validation.isAtServer()) continue;
						 IValidationMethod validationMethod = (IValidationMethod)SpringHelper.getBean(validation.getName());
						 boolean isValid = validationMethod.executeValidation(value, request, validation);
						 if (!isValid) {
							 List erroeList = (List)session.getAttribute("ERROR_LIST_INFO");
							 if (erroeList == null) {
								 erroeList= new ArrayList();
								 session.setAttribute("ERROR_LIST_INFO",erroeList);
							 }
							 //替换参数
							 String displayError = validation.getDisplayError();
							 String ParamIndexs = validation.getParam();
							 if (ParamIndexs!=null && !ParamIndexs.trim().equals("")) {
								 String [] paramIndexArr = StringHelper.split(ParamIndexs, ",");
								 for(int n=0;n<paramIndexArr.length;n++) {
									 int paramIndex = Integer.parseInt(paramIndexArr[n]);
									 ValidationParam validationParam = (ValidationParam)paramList.get(paramIndex);
									 if (!validationParam.isPage()) {
										 displayError = displayError.replace("{"+paramIndex+"}", validationParam.getValue());
									 }
								 }
							 }
							 erroeList.add(validationField.getDesc()+displayError);
							 break;
						 }
					 }
				 }
			 }
		 }
		 List erroeList = (List)session.getAttribute("ERROR_LIST_INFO");
		 if (erroeList == null) erroeList = new ArrayList();
		 return erroeList;
	 }



}
