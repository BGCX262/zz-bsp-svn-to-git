package com.youthor.bsp.view.abdf.common.taglib;




import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;



public class BottomTableTag extends BodyTagSupport{
    
    private String id="";
    private String className="right_bottom";
    private int height=29;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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
              buf.append("<table width='100%'  border='0' height='"+height+"' cellpadding='0' cellspacing='0' class='"+this.className+"' ");
              if(this.id!=null&&!this.id.equals(""))
              {
                  buf.append(" id='"+this.id+"' ");
              }
              buf.append(">\n");
              buf.append("<tr>\n");
              buf.append("<td  height='"+height+"'  align='center'>\n");
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

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

}
