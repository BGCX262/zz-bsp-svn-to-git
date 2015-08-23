package com.youthor.bsp.view.abdf.common.taglib;

import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.youthor.bsp.core.abdf.common.helper.ObjectHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.view.abdf.common.helper.CheckBoxHtmlHelper;
import com.youthor.bsp.view.abdf.common.helper.DropDownHtmlHelper;
import com.youthor.bsp.view.abdf.common.helper.RadioBoxHtmlHelper;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;








public class RadioBoxTag extends BodyTagSupport{

        private static final long serialVersionUID = 8777952045314052117L;
        private String dictType; //字典类型id;
       private boolean disabled=false;//是否不可用
       private String defaultValue = "";//默认值
       private String name;    //bean放在jps内值对象中的key
       private String property;//属性
       private boolean struts=true;//是否struts形式.如果是从name,property中得值,如果是false，从defaultValue中得值
       private String scope="request";//存在范围
       private boolean dynamic=false;
       private String onclick;
       private String onchange;
       private boolean addBr=false;
       private String valueType="id";
      
       public String getValueType() {
        return valueType;
    }

    public void setValueType(String valueType) {
        this.valueType = valueType;
    }

    public void release() {
            this.dictType=null;
            this.defaultValue=null;
            this.name=null;
            this.scope=null ;
            this.onclick=null ;
            this.onchange=null ;
            super.release();
        }
       
     public int doStartTag() {

            return EVAL_BODY_INCLUDE;
        }

        public int doEndTag() throws JspException {
            JspWriter out = pageContext.getOut();
            StringBuffer buf = new StringBuffer();
            HttpServletRequest request=(HttpServletRequest) pageContext.getRequest();
            HttpSession session=request.getSession();
            if(this.struts)
             {
                    Object dataObject=WebHelper.getObjectByWebContainer(pageContext,scope,name);
                    Object propertyObject=ObjectHelper.getMethodValue(this.property,dataObject);
                    this.defaultValue=StringHelper.objectToString(propertyObject);
             }
            if(dynamic)
             {
                 try {
                    buf.append(RadioBoxHtmlHelper.getHtmlByDynamic(this.dictType, this.defaultValue,this.addBr,this.onchange,this.onclick,this.property,this.disabled, request));
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
             }
            else
            {
                try {
                    buf.append(RadioBoxHtmlHelper.getHtmlByDict(this.dictType,this.valueType,this.defaultValue,this.addBr,this.onchange,this.onclick,this.property,this.disabled,request));
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
            try {
                out.println(buf.toString());
            } catch (IOException ex) {
            }

            return EVAL_PAGE;
        }

        public boolean isAddBr() {
            return addBr;
        }

        public void setAddBr(boolean addBr) {
            this.addBr = addBr;
        }

        public String getDefaultValue() {
            return defaultValue;
        }

        public void setDefaultValue(String defaultValue) {
            this.defaultValue = defaultValue;
        }

        public String getDictType() {
            return dictType;
        }

        public void setDictType(String dictType) {
            this.dictType = dictType;
        }

        public boolean isDisabled() {
            return disabled;
        }

        public void setDisabled(boolean disabled) {
            this.disabled = disabled;
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

        public String getOnchange() {
            return onchange;
        }

        public void setOnchange(String onchange) {
            this.onchange = onchange;
        }

        public String getOnclick() {
            return onclick;
        }

        public void setOnclick(String onclick) {
            this.onclick = onclick;
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

    
}
