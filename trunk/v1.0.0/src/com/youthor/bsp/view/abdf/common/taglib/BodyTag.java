package com.youthor.bsp.view.abdf.common.taglib;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.model.validation.ValidationForm;
import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine;
import com.youthor.bsp.core.wfss.model.Activity;
import com.youthor.bsp.core.wfss.model.AppForm;
import com.youthor.bsp.core.wfss.model.AppFormField;
import com.youthor.bsp.core.wfss.model.Process;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;

public class BodyTag extends BodyTagSupport{
    private static final long serialVersionUID = 5292126388489247814L;
    private String onload="";
    private String onunload;
    private boolean prompt=false;
    private String style;
    private String formId;
    private String moduleName="";
    private boolean runFlow=false;
    private String className="right_body";
    public boolean isRunFlow() {
        return runFlow;
    }

    public void setRunFlow(boolean runFlow) {
        this.runFlow = runFlow;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public String getFormId() {
        return formId;
    }

    public void setFormId(String formId) {
        this.formId = formId;
    }

    public String getOnload() {
        return onload;
    }

    public void setOnload(String onload) {
        this.onload = onload;
    }

    public String getOnunload() {
        return onunload;
    }

    public void setOnunload(String onunload) {
        this.onunload = onunload;
    }

    public boolean isPrompt() {
        return prompt;
    }

    public void setPrompt(boolean prompt) {
        this.prompt = prompt;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public int doEndTag() throws JspException {
        try {
         JspWriter out = pageContext.getOut();
          StringBuffer buf = new StringBuffer();
          HttpServletRequest request=(HttpServletRequest) pageContext.getRequest();
          buf.append("</body>");
         String buttonType = (String)request.getAttribute("ABDF_BUTTON_TYPE");
         if (buttonType!=null&&buttonType.equals("td")) {
             buf.append("<SCRIPT language=javascript>\n");
             buf.append("var cells = document.getElementById('toolBar').rows[0].cells;\n");
             buf.append("for (var i = 1; i < cells.length; i++){\n");
             buf.append("createButton(cells[i]);\n");
             buf.append("} \n");  
             buf.append(" </SCRIPT>\n");  
         }
        
            
          out.println(buf.toString());
          }
       catch(Exception ex)
       {
        
       }
          
        return EVAL_PAGE;
    }

    public int doStartTag() throws JspException {
        try {
              JspWriter out = pageContext.getOut();
              StringBuffer buf = new StringBuffer();
              HttpServletRequest request=(HttpServletRequest) pageContext.getRequest();
                HttpSession session=request.getSession();
                List buildJsFields=new ArrayList();
                List buildJsRequireFields=new ArrayList();
              buf.append("<body  ");
              String tempOnLoad=this.onload;
              StringBuffer bufErrorContent = new StringBuffer();
	              ValidationForm validationForm = (ValidationForm)session.getAttribute("ERROR_ValidationForm");
	              session.removeAttribute("ERROR_ValidationForm");
	           
	             List errorList = (List)session.getAttribute("ERROR_LIST_INFO");
	             session.removeAttribute("ERROR_LIST_INFO");
	           
	           if (errorList!=null && errorList.size()>0) {
	        	   for(int i=0;i<errorList.size();i++) {
	        		   bufErrorContent.append((String)errorList.get(i)+"<br/>");
	        	   }
	        	   if (!bufErrorContent.toString().equals("")) {
	        		   
	        		   if(tempOnLoad!=null&&!tempOnLoad.equals(""))
	                      {
	        			   tempOnLoad = "displayError('"+bufErrorContent.toString()+"','"+validationForm.getDisplayType()+"');"+tempOnLoad;
	                         
	                      }
	                      else
	                      {
	                    	  tempOnLoad = "displayError('"+bufErrorContent.toString()+"','"+validationForm.getDisplayType()+"')";
	                      }
	        		 
	        	   }
	           }
              if(!this.runFlow)
              {
                  if(formId!=null&&!formId.equals(""))
                  {
                	
       	           
                      if(tempOnLoad!=null&&!tempOnLoad.equals(""))
                      {
                          tempOnLoad="attachEventToFormElement('"+StringHelper.doWithNull(formId)+"');doToAddRedValidate('"+StringHelper.doWithNull(formId)+"','"+StringHelper.doWithNull(moduleName)+"');"+tempOnLoad;
                      }
                      else
                      {
                          tempOnLoad="attachEventToFormElement('"+StringHelper.doWithNull(formId)+"');doToAddRedValidate('"+StringHelper.doWithNull(formId)+"','"+StringHelper.doWithNull(moduleName)+"')";
                      }
                  }
//                  else
//                  {
//                      if(this.onload!=null&&!this.onload.equals(""))
//                      {
//                         tempOnLoad=this.onload;
//                      }
//                  }
              }
              else
              {
                 
                  Activity activity=(Activity)request.getAttribute("CURR_ACTIVITY");
                  IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
                  List filedList=wfCacheEngine.listAppFormFieldByAppFormId(activity.getAppFormId());
                  
                  String editFields=activity.getEditFields();
                  if(editFields==null) editFields="";
                  String [] editFieldsArr=StringHelper.split(editFields,",");
                
                  String notNullFields=activity.getNotNullFields();
                  if(notNullFields==null) notNullFields="";
                  String [] notNullFieldsArr=StringHelper.split(notNullFields,",");
                  
                  
                  
                  
                  if(filedList!=null&&filedList.size()>0)
                  {
                      for(int i=0;i<editFieldsArr.length;i++)
                      {
                          String editField=editFieldsArr[i];
                          for(int j=0;j<filedList.size();j++)
                          {
                              AppFormField appFormField=(AppFormField)filedList.get(j);
                              if(appFormField.getFieldAlias().equals(editField))
                              {
                                  buildJsFields.add(appFormField);
                                  break;
                              }
                          }
                      }
                      
                      for(int i=0;i<notNullFieldsArr.length;i++)
                      {
                          String notNullField=notNullFieldsArr[i];
                          for(int j=0;j<filedList.size();j++)
                          {
                              AppFormField appFormField=(AppFormField)filedList.get(j);
                              if(appFormField.getFieldAlias().equals(notNullField))
                              {
                                  buildJsRequireFields.add(appFormField);
                                  break;
                              }
                          }
                      }
                  }
                  String wfss_openAction = (String) request.getAttribute("wfss_openAction");
                    if (wfss_openAction == null || wfss_openAction.equals("CG"))
                        wfss_openAction = "DB";
                  if(tempOnLoad!=null&&!tempOnLoad.equals(""))
                  {
                     
                         if(wfss_openAction.equals("DB"))
                         {
                           tempOnLoad="attachEventToFormElement('"+StringHelper.doWithNull(formId)+"');attachEventToChangeFormField();attachEventFlowAddRed();"+tempOnLoad;
                         }
                         else
                         {
                             tempOnLoad="attachEventToFormElement('"+StringHelper.doWithNull(formId)+"');"+tempOnLoad;
                                
                         }
                    }
                  else
                  {
                      if(wfss_openAction.equals("DB"))
                      {
                        tempOnLoad="attachEventToFormElement('"+StringHelper.doWithNull(formId)+"');attachEventToChangeFormField();attachEventFlowAddRed();";
                      }
                      else
                      {
                          tempOnLoad="attachEventToFormElement('"+StringHelper.doWithNull(formId)+"');";
                            
                      }
                  }
              }
              if(tempOnLoad!=null&&!tempOnLoad.equals(""))
                 buf.append(" onload=\""+tempOnLoad+"\"");
              if(onunload!=null&&!onunload.equals(""))
              {
                  buf.append(" onunload=\""+onunload+"\"");
              }
              
              if(prompt)
              {
                  buf.append(" onbeforeunload='return(isClose())'");
              }
              
              if(WebHelper.projectIsOnLine(session))
              {
                  buf.append(" oncontextmenu=self.event.returnValue=false");
              }
              else
              {
                  
              }
              if(!StringHelper.doWithNull(style).trim().equals(""))
              {
                  buf.append(" style=\""+style+"\"");
              }
              
              if(!StringHelper.doWithNull(className).trim().equals(""))
              {
                  buf.append(" class=\""+className+"\"");
              }
              
              buf.append(">\n");
              if(buildJsFields!=null&&buildJsFields.size()>0)
              {
                  buf.append("<script language='javascript'>\n");
                  buf.append("var FLOW_EDIT_DIELDS=new Array();\n");
                  for(int i=0;i<buildJsFields.size();i++)
                  {
                      AppFormField appFormField=(AppFormField)buildJsFields.get(i);
                      buf.append("var FLOW_EDIT_DIELD=new WfField();\n");
                      buf.append("FLOW_EDIT_DIELD.setFieldAlias('"+appFormField.getFieldAlias()+"');\n");
                      buf.append("FLOW_EDIT_DIELD.setFieldInputType('"+appFormField.getFieldInputType()+"');\n");
                      buf.append("FLOW_EDIT_DIELD.setIsArray('"+appFormField.getIsArray()+"');\n");
                      buf.append("FLOW_EDIT_DIELDS["+i+"]=FLOW_EDIT_DIELD;\n");
                  }
                  buf.append("</script>\n");
              }
              
              if(buildJsRequireFields!=null&&buildJsRequireFields.size()>0)
              {
                  buf.append("<script language='javascript'>\n");
                  buf.append("var FLOW_NOT_NULL_DIELDS=new Array();\n");
                  for(int i=0;i<buildJsRequireFields.size();i++)
                  {
                      AppFormField appFormField=(AppFormField)buildJsRequireFields.get(i);
                      buf.append("var FLOW_NOT_NULL_DIELD=new WfField();\n");
                      buf.append("FLOW_NOT_NULL_DIELD.setFieldAlias('"+appFormField.getFieldAlias()+"');\n");
                      buf.append("FLOW_NOT_NULL_DIELD.setFieldChinaName('"+appFormField.getFieldName()+"');\n");
                      buf.append("FLOW_NOT_NULL_DIELD.setFieldInputType('"+appFormField.getFieldInputType()+"');\n");
                      buf.append("FLOW_NOT_NULL_DIELD.setIsArray('"+appFormField.getIsArray()+"');\n");
                      
                      buf.append("FLOW_NOT_NULL_DIELDS["+i+"]=FLOW_NOT_NULL_DIELD;\n");
                  }
                  buf.append("</script>\n");
              }
              
              out.println(buf.toString());
          }
       catch(Exception ex)
       {
         ex.printStackTrace();
       }
        return EVAL_BODY_INCLUDE;
    }

    public void release() {
        this.onload=null;
        this.onunload=null;
        this.style=null;
        this.formId=null ;
        this.runFlow=false;
        super.release();
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

}
