package com.youthor.bsp.view.abdf.common.taglib;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.youthor.bsp.core.abdf.common.model.validation.ValidationForm;



public class ErrorDisplay extends BodyTagSupport{
	
	   public int doEndTag() throws JspException {
		   try {
	           JspWriter out = pageContext.getOut();
	           StringBuffer buf = new StringBuffer();
	           StringBuffer bufErrorContent = new StringBuffer();
	           HttpServletRequest request=(HttpServletRequest) pageContext.getRequest();
	          
	           HttpSession  session = request.getSession();
	           ValidationForm validationForm = (ValidationForm)session.getAttribute("ERROR_ValidationForm");
	           session.removeAttribute("ERROR_ValidationForm");
	           
	           List errorList = (List)session.getAttribute("ERROR_LIST_INFO");
	           session.removeAttribute("ERROR_LIST_INFO");
	           
	           if (errorList!=null && errorList.size()>0) {
	        	   for(int i=0;i<errorList.size();i++) {
	        		   bufErrorContent.append((String)errorList.get(i)+"");
	        	   }
	        	   buf.append("<SCRIPT>\n");
	               buf.append("var messContent=\"<div style='padding:20px 0 20px 0;text-align:center'>"+bufErrorContent.toString()+"</div>\";\n");
	               buf.append("showMessageBoxCenter('错误提示',messContent,350);\n");
	        	  // buf.append("alert(\""+bufErrorContent.toString()+"\");\n");
	               buf.append("</SCRIPT>\n");  
	               out.println(buf.toString());
	           }
		   }
	       catch(Exception ex)
	       {
	        
	       }

           return EVAL_PAGE;
     }

}
