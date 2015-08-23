package com.youthor.bsp.view.abdf.common.plugin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;

import org.apache.struts.action.ActionServlet;
import org.apache.struts.action.PlugIn;
import org.apache.struts.config.ModuleConfig;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;

import com.youthor.bsp.core.abdf.common.AbdfCache;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.model.validation.Validation;
import com.youthor.bsp.core.abdf.common.model.validation.ValidationField;
import com.youthor.bsp.core.abdf.common.model.validation.ValidationForm;
import com.youthor.bsp.core.abdf.common.model.validation.ValidationParam;

public class InitValdationPlugIn implements PlugIn{
   private String urlPath;

    public String getUrlPath() {
        return urlPath;
    }
    
    public void setUrlPath(String urlPath) {
        this.urlPath = urlPath;
    }
    
    public void init(ActionServlet servlet, ModuleConfig arg1) throws ServletException {
        String urlRealPath = servlet.getServletContext().getRealPath(this.urlPath);
        File file = new File(urlRealPath);
        File [] directorys = file.listFiles();
        Map map = new HashMap();
        if(directorys!=null && directorys.length>0) {
            for(int i =0;i<directorys.length;i++) {
                File subDirectory = directorys[i];
                if(!subDirectory.isDirectory()) continue;
                String directoryName = subDirectory.getName();
                File [] subFiles = subDirectory.listFiles();
                if (subFiles!=null && subFiles.length>0) {
                   for(int j=0;j<subFiles.length;j++) {
                     File subFile = subFiles[j];
                     String fileName = subFile.getName();
                     String [] names = StringHelper.split(fileName, ".");
                     if(names.length == 1) continue;
                     if(names.length==2 && names[1]!=null && !names[1].equals("") && !names[1].equals("xml")) continue;
                     if(names.length>2) continue;
                     if(subFile.isDirectory()) continue;
                     java.io.InputStream xmlDocInput = null;
                     try {
                         xmlDocInput = new FileInputStream(subFile);
                     } catch (FileNotFoundException e1) {
                         // TODO Auto-generated catch block
                         e1.printStackTrace();
                     }
                      SAXBuilder saxBuilder = new SAXBuilder();
                      Document xmlMapDoc= null;
                      try {
                          xmlMapDoc = saxBuilder.build(xmlDocInput);
                      } catch (JDOMException e1) {
                          // TODO Auto-generated catch block
                          e1.printStackTrace();
                      } catch (IOException e1) {
                          // TODO Auto-generated catch block
                          e1.printStackTrace();
                      }
                      Element root = xmlMapDoc.getRootElement();
                      List xmlList=root.getChildren();
                      for(int n=0;n<xmlList.size();n++)
                      {
                         Element e = (Element)xmlList.get(n);
                         ValidationForm validationForm = new ValidationForm();
                         validationForm.setDisplayContent(e.getAttributeValue("displayContent"));
                         String formName = e.getAttributeValue("name");
                         validationForm.setName(formName);
                         validationForm.setExtJava(e.getAttributeValue("extJava"));
                         validationForm.setDisplayType(e.getAttributeValue("displayType"));
                         
                       
                        System.out.println("formName==="+formName);
                         
                         List paramList = new ArrayList();
                         validationForm.setParamList(paramList);
						 List paramListElement = e.getChildren("param");
						 
						 if(paramListElement!=null && paramListElement.size()>0) {
							 for (int w=0;w<paramListElement.size();w++) {
								 Element eParam = (Element)paramListElement.get(w);  
								 ValidationParam validationParam = new ValidationParam();
								 validationParam.setDataType(eParam.getAttributeValue("dataType"));
								 validationParam.setValue(eParam.getAttributeValue("value"));
								
								 String page = eParam.getAttributeValue("page");
								 validationParam.setValidationForm(validationForm);
								
			                     if(page.equals("true")) {
			                        validationParam.setPage(true);
			                     }
			                     else {
			                        validationParam.setPage(false);
			                     }
			                     paramList.add(validationParam);
							 }
						 }
						  List fieldList = new ArrayList();
	                      validationForm.setFieldList(fieldList);
						  List fieldListElement = e.getChildren("field");
                          if(fieldListElement!=null && fieldListElement.size()>0) {
                        	 for(int m=0;m<fieldListElement.size();m++) {
                        		 Element eField = (Element)fieldListElement.get(m);
                        		 ValidationField validationField = new ValidationField();
                        		 validationField.setDesc(eField.getAttributeValue("desc"));
                        		 validationField.setFireFieldName(eField.getAttributeValue("fireFieldName"));
                        		 validationField.setFireFieldValue(eField.getAttributeValue("fireFieldValue"));
                        		 validationField.setName(eField.getAttributeValue("name"));
                        		 validationField.setValidationForm(validationForm);
                        		 fieldList.add(validationField);
                        		 
                        		 List validationList = new ArrayList();
                        		 validationField.setValidationList(validationList);
                        		 List validationListElement = eField.getChildren("validation");
                        		 if(validationListElement!=null && validationListElement.size()>0) {
									 for (int r=0;r<validationListElement.size();r++) {
										 Element eValidation = (Element)validationListElement.get(r);   
										 Validation validation = new Validation();
										 validation.setName(eValidation.getAttributeValue("name"));
										 validation.setParam(eValidation.getAttributeValue("params"));
										 validation.setDisplayError(eValidation.getAttributeValue("displayError"));
										 validation.setFire(eValidation.getAttributeValue("fire"));
										 validation.setFireValue(eValidation.getAttributeValue("fireValue"));
										 
										 String atServer = eValidation.getAttributeValue("atServer");
					                     if(atServer!=null && atServer.equals("false")) {
					                    	 validation.setAtServer(false);
					                     }
					                     else {
					                    	 validation.setAtServer(true);
					                     }
					                     
										 validation.setValidationField(validationField);
										 validationList.add(validation);
										 
										
									  }
                        		 }
                        		 
                        	 }
                         }
                         map.put(directoryName+"-"+formName, validationForm);
                      }
                   }
                }    
            }
       }
        
        AbdfCache.mapValidationForm=map; 
  }
    
    public void destroy() {
         
    }
}
