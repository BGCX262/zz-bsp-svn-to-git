package com.youthor.bsp.view.abdf.common.taglib;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.youthor.bsp.core.abdf.common.helper.ObjectHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.view.abdf.common.helper.DictHelper;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;






public class CodeToNameTag extends BodyTagSupport{
    private static final long serialVersionUID = -7660485271814666756L;
    private String dictType;
    private String value;
    private String valueType = "value";
    private String name;
    private String property;
    private String scope="request";
    private boolean struts=true;
    private boolean dynamic=false;
    
    
    public String getDictType() {
        return dictType;
    }
    public void setDictType(String dictType) {
        this.dictType = dictType;
    }
    public boolean isDynamic() {
        return dynamic;
    }
    public void setDynamic(boolean dynamic) {
        this.dynamic = dynamic;
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
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }
    public int doEndTag() throws JspException {
            JspWriter out = pageContext.getOut();
            StringBuffer buf = new StringBuffer();
            HttpServletRequest request=(HttpServletRequest) pageContext.getRequest();
           
            if(this.struts)
            {
                Object dataObject=WebHelper.getObjectByWebContainer(pageContext,scope,name);
                Object propertyObject=ObjectHelper.getMethodValue(this.property,dataObject);
                this.value=StringHelper.objectToString(propertyObject);
            }
            try {
                buf.append(DictHelper.CodeToName(dictType,value,dynamic,valueType,request));
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            try {
                out.println(buf.toString());
            } catch (IOException ex) {
            }

            return EVAL_PAGE;
      }
    public String getValueType() {
        return valueType;
    }
    public void setValueType(String valueType) {
        this.valueType = valueType;
    }
    
     
        
}
