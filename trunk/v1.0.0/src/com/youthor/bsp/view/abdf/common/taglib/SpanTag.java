package com.youthor.bsp.view.abdf.common.taglib;




import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;



public class SpanTag extends BodyTagSupport{
    
    private String id="CONTENT_SPAN";
    private int subHeight=60;
    private String className="right_middle";
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getSubHeight() {
        return subHeight;
    }

    public void setSubHeight(int subHeight) {
        this.subHeight = subHeight;
    }

    public int doEndTag() throws JspException {
        try {
         JspWriter out = pageContext.getOut();
          StringBuffer buf = new StringBuffer();
          buf.append("</span>\n");
          buf.append("<script language=\"javascript\">\n");
          buf.append("document.getElementById('"+this.id+"').style.height=document.body.clientHeight-"+this.subHeight+";\n");
          buf.append("window.onresize = onresize_"+this.id+";\n");
          buf.append("function onresize_"+this.id+"() {\n");
          buf.append("document.getElementById('"+this.id+"').style.height=document.body.clientHeight-"+this.subHeight+";\n");
          buf.append("}\n");
          buf.append("</script>\n");
          out.println(buf.toString());
          }
       catch(Exception ex)
       {
           ex.printStackTrace();
       }
          
        return EVAL_PAGE;
    }

    public int doStartTag() throws JspException {
        try {
              JspWriter out = pageContext.getOut();
              StringBuffer buf = new StringBuffer();
              buf.append("<span  id='"+this.id+"' class='"+this.className+"'>\n");
            
              out.println(buf.toString());
          }
        catch(Exception ex)
        {
          ex.printStackTrace();
        }
        return EVAL_BODY_INCLUDE;
    }

    public void release() {
        this.className="";
        this.id="";
        
        super.release();
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

}
