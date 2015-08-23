package com.youthor.bsp.view.abdf.common.taglib;




import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;



public class TopTableTag extends BodyTagSupport{
    
    private String id="";
    private String className="right_top";
    private String tdClassName="right_top_td";
    private String width = "100%";

    public String getWidth() {
        return width;
    }

    public void setWidth(String width) {
        this.width = width;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    
    public String getTdClassName() {
        return tdClassName;
    }

    public void setTdClassName(String tdClassName) {
        this.tdClassName = tdClassName;
    }

    public int doEndTag() throws JspException {
        try {
         JspWriter out = pageContext.getOut();
          StringBuffer buf = new StringBuffer();
          buf.append("</td>\n");
          buf.append("</tr>\n");
          buf.append("</table>\n");
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
              buf.append("<table width='"+this.width+"'  border='0' cellpadding='0' cellspacing='0' class='"+this.className+"' ");
              if(this.id!=null&&!this.id.equals(""))
              {
                  buf.append(" id='"+this.id+"' ");
              }
              buf.append(">\n");
              buf.append("<tr>\n");
              buf.append("<td  class='"+this.tdClassName+"'>\n");
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
