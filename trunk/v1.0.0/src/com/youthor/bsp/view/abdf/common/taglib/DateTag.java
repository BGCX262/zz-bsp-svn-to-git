package com.youthor.bsp.view.abdf.common.taglib;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.youthor.bsp.core.abdf.common.helper.DateHelper;
import com.youthor.bsp.core.abdf.common.helper.ObjectHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;

public class DateTag extends BodyTagSupport{
    private static final long serialVersionUID = 5292126388489247814L;
    private boolean time=false;
     private boolean disabled=false;//是否不可用
     private boolean readOnly=true;//是否不可用
       private String defaultValue = "";//默认值
       private String name;    //bean放在jps内值对象中的key
       private String property;//属性
       private boolean struts=true;//是否struts形式.如果是从name,property中得值,如果是false，从defaultValue中得值
       private String scope="request";//存在范围

    public String getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
    }

    public boolean isDisabled() {
        return disabled;
    }

    public void setDisabled(boolean disabled) {
        this.disabled = disabled;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public String getScope() {
        return scope;
    }

    public void setScope(String scope) {
        this.scope = scope;
    }

    public boolean isStruts() {
        return struts;
    }

    public void setStruts(boolean struts) {
        this.struts = struts;
    }

    public boolean isTime() {
        return time;
    }

    public void setTime(boolean time) {
        this.time = time;
    }

    public int doEndTag() throws JspException {
         return EVAL_BODY_INCLUDE;
    }

    public int doStartTag() throws JspException {
        try {
              JspWriter out = pageContext.getOut();
              StringBuffer buf = new StringBuffer();
              HttpServletRequest request=(HttpServletRequest) pageContext.getRequest();
              HttpSession session=request.getSession();
              if(this.struts)
               {
                   Object dataObject=WebHelper.getObjectByWebContainer(pageContext,scope,name);
                   Object propertyObject=ObjectHelper.getMethodValue(this.property,dataObject);
                   Date date=(Date)propertyObject;
                   if(this.isTime())
                     this.defaultValue=DateHelper.converDateToLongStr(date);
                   else
                       this.defaultValue=DateHelper.converDateToShortStr(date);
               }
              buf.append("<input type='text' value='"+this.defaultValue+"' class='formStyleall' name='"+this.property+"' id='"+this.property+"' onfocus='calendar("+this.time+")'");
              if(readOnly)
              {
                  buf.append("readOnly='true' ");
              }
              if(this.disabled)
              {
                  buf.append("disabled='true' ");
              }
              buf.append("/>&nbsp;&nbsp;");
              out.println(buf.toString());
          }
       catch(Exception ex)
       {
        
       }
        return EVAL_BODY_INCLUDE;
    }

    public void release() {
        
        super.release();
    }

    public boolean isReadOnly() {
        return readOnly;
    }

    public void setReadOnly(boolean readOnly) {
        this.readOnly = readOnly;
    }

}
