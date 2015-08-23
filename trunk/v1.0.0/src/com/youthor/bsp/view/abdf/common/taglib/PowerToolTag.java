package com.youthor.bsp.view.abdf.common.taglib;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.facade.IPortalUrssServiceFacade;
import com.youthor.bsp.view.abdf.common.helper.PowerButtonHTML;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;

public class PowerToolTag extends BodyTagSupport{
    private static final long serialVersionUID = -825883656862740732L;
    private String funCode;
    private String groupName;
    private Map parameter;
    private String type = "td";
    private boolean favorite = true;

    public boolean isFavorite() {
        return favorite;
    }

    public void setFavorite(boolean favorite) {
        this.favorite = favorite;
    }

    public int doStartTag() {
            return EVAL_BODY_INCLUDE;
        }
     
      public int doEndTag() throws JspException {
          HttpSession session=pageContext.getSession();
          HttpServletRequest request=(HttpServletRequest) pageContext.getRequest();
          JspWriter out = pageContext.getOut();
          StringBuffer buf=null;
         List buttonList= null;
              IPortalUrssServiceFacade portalUrssServiceFacade=(IPortalUrssServiceFacade)SpringHelper.getBean("portalUrssServiceFacade");
              buttonList=portalUrssServiceFacade.getCurrPageButtons(WebHelper.getAppId(),funCode,WebHelper.getOrgId(session));
              buf=PowerButtonHTML.getPowerHTMLByButton(request, buttonList,this.groupName,this.parameter,this.type,this.favorite);
            
            
          try {
             out.println(buf.toString());
     } catch (IOException e) {
             e.printStackTrace();
     }

     
          return EVAL_PAGE;    
      }
     
     public void release() {
            this.funCode=null;
            this.groupName=null;
            this.parameter=null;
            this.type="button";
        }

    public String getFunCode() {
        return funCode;
    }

    public void setFunCode(String funCode) {
        this.funCode = funCode;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public Map getParameter() {
        return parameter;
    }

    public void setParameter(Map parameter) {
        this.parameter = parameter;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

}
