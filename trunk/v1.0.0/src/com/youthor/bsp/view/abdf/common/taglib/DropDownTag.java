
package com.youthor.bsp.view.abdf.common.taglib;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.youthor.bsp.core.abdf.common.helper.ObjectHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.view.abdf.common.helper.DropDownHtmlHelper;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;





public class DropDownTag extends BodyTagSupport{
    private static final long serialVersionUID = -3910789971992579041L;
        private boolean disabled=false;
        private String defaultValue = "";
        private String dictType;
        private String onchange;
        private String styleClass;
        private String style;
        private String styleId;  
        private String title;    
        private String name;    
        private String property;
        private boolean struts=true;
        private String scope="request";
        private boolean multiple = false; 
        private int size = 1;  
        private boolean require = false;  
        private boolean dynamic=false;
        private String valueType="id";

    

        public String getValueType() {
            return valueType;
        }

        public void setValueType(String valueType) {
            this.valueType = valueType;
        }

        public boolean isDynamic() {
            return dynamic;
        }

        public void setDynamic(boolean dynamic) {
            this.dynamic = dynamic;
        }

        public String getDictType() {
        return dictType;
    }

    public void setDictType(String dictType) {
        this.dictType = dictType;
    }

        public String getOnchange() {
            return onchange;
        }

        public void setOnchange(String onchange) {
            this.onchange = onchange;
        }

        

        public boolean isStruts() {
            return struts;
        }

        public void setStruts(boolean struts) {
            this.struts = struts;
        }

    public int doStartTag() {

            return EVAL_BODY_INCLUDE;
        }

        public int doEndTag() throws JspException {
              JspWriter out = pageContext.getOut();
                StringBuffer buf = new StringBuffer();
                buf.append("<select name='" + this.property + "' ");
                String id=this.property;
                if(styleId != null&&!styleId.equals(""))
                    id=styleId;
                    buf.append("id='" +id + "' ");
                if (this.styleClass != null&&!this.styleClass.equals("")) {
                    buf.append("class='" + this.styleClass + "' ");
                }
                if (this.style != null&&!this.style.equals("")) {
                    buf.append("style=\"" + this.style + "\" ");
                }
               
                if (this.onchange != null&&!this.onchange.equals("")) {
                    buf.append("onchange=\"" + this.onchange + "\" ");
                }
               
                if(disabled)
                {
                     buf.append(" disabled='" + this.disabled + "' ");
                }
                if (this.title != null&&!this.title.equals("")) {
                    buf.append(" title=\"" + this.title + "\" ");
                }
                if (this.multiple) {
                    buf.append(" multiple "); 
                }
                
                buf.append("size='" + this.size + "' ");
                buf.append(">");
                HttpServletRequest request=(HttpServletRequest) pageContext.getRequest();
                HttpSession session=request.getSession();

                if (!this.require) {
                    buf.append("<option value='' >----请选择----</option>");
                }
               
                 if(this.struts)
                 {
                        Object dataObject=WebHelper.getObjectByWebContainer(pageContext,scope,name);
                        Object propertyObject=ObjectHelper.getMethodValue(this.property,dataObject);
                        this.defaultValue=StringHelper.objectToString(propertyObject);
                 }
                 if(dynamic)
                 {
                     try {
                        buf.append(DropDownHtmlHelper.getHtmlByDynamic(this.dictType,this.defaultValue,request));
                    } catch (Exception e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                 }
                 else
                 {
                     try {
                            buf.append(DropDownHtmlHelper.getHtmlByDict(this.dictType,this.valueType,this.defaultValue,request));
                        } catch (Exception e) {
                            // TODO Auto-generated catch block
                            e.printStackTrace();
                        }
                 }
               
         
                buf.append("</select>");
                
                
                try {
                    out.print(buf.toString());
                } catch (IOException ex) {
                }

                return EVAL_PAGE;
        }

        
        
       
    

        public String getDefaultValue() {
            return defaultValue;
        }

        public void setDefaultValue(String defaultValue) {
            this.defaultValue = defaultValue;
        }

        public boolean isMultiple() {
            return multiple;
        }

        public void setMultiple(boolean multiple) {
            this.multiple = multiple;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        
        public boolean isRequire() {
            return require;
        }

        public void setRequire(boolean require) {
            this.require = require;
        }

        public int getSize() {
            return size;
        }

        public void setSize(int size) {
            this.size = size;
        }

        

        public String getStyle() {
            return style;
        }

        public void setStyle(String style) {
            this.style = style;
        }

        public String getStyleClass() {
            return styleClass;
        }

        public void setStyleClass(String styleClass) {
            this.styleClass = styleClass;
        }

        public String getStyleId() {
            return styleId;
        }

        public void setStyleId(String styleId) {
            this.styleId = styleId;
        }

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }

        public boolean isDisabled() {
            return disabled;
        }

        public void setDisabled(boolean disabled) {
            this.disabled = disabled;
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

    

}
