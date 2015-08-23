package com.youthor.bsp.view.abdf.common.taglib;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.facade.IPortalUrssServiceFacade;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;

/**
 * 控制权限本体内容是否显示的标签
 * 
 * @author jason
 * 
 */
public class PowerAreaTag extends BodyTagSupport {
    private static final long serialVersionUID = -825883656862740733L;
    private String funCode;
    private String resourceCode;

    
    @Override
    public int doStartTag() throws JspException {
        HttpSession session = pageContext.getSession();
        IPortalUrssServiceFacade portalUrssServiceFacade = (IPortalUrssServiceFacade) SpringHelper.getBean("portalUrssServiceFacade");
        
        boolean ret = portalUrssServiceFacade.isHavePowerOfResource(WebHelper.getAppId(), 
                WebHelper.getOrgId(session), funCode, resourceCode);
        
        System.out.println("doStartTag--->" + ret);
        if(ret){
            return EVAL_BODY_INCLUDE;
        }
        else{
            return SKIP_BODY;
        }
    }

    public void release() {
        this.funCode = null;
        this.resourceCode = null;
    }

    public String getFunCode() {
        return funCode;
    }

    public void setFunCode(String funCode) {
        this.funCode = funCode;
    }

    public String getResourceCode() {
        return resourceCode;
    }

    public void setResourceCode(String resourceCode) {
        this.resourceCode = resourceCode;
    }
}
