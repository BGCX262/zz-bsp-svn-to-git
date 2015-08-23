package com.youthor.bsp.view.urss.web.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.helper.MD5Helper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.ComUser;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.urss.helper.WebHelper;
import com.youthor.bsp.view.urss.web.form.ComUserForm;

public class ComUserAction extends BaseStrutsAction{
    
      private static final String FORWARD_ComUserList = "comUserList";
      private static final String FORWARD_ComUserEdit = "comUserEdit";
      private static final String FORWARD_ComUserDel = "delToList";
      
      private static final String ActionFormClass = "com.youthor.bsp.view.urss.web.form.ComUserForm";
      private static final String modelClass = "com.youthor.bsp.core.urss.model.ComUser";
      
    private IUrssServiceFacade urssServiceFacade;
    public void setUrssServiceFacade(IUrssServiceFacade urssServiceFacade) {
        this.urssServiceFacade = urssServiceFacade;
    }
    
    public ActionForward listPageComUser(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        Page page=(Page)request.getAttribute(Page.PAGE_INFO);
        String comId="";
        
        if(!WebHelper.isSuperAdmin(request.getSession()))
        {
            comId=WebHelper.getCurrComId(request.getSession());
        }
        List pageList=urssServiceFacade.listPageComUser(page,comId);
        request.setAttribute("pageList",pageList);
        return mapping.findForward(FORWARD_ComUserList);    
    }
    
    
    public ActionForward initComUser(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        ComUserForm comUserFrom=(ComUserForm)form;
        return mapping.findForward(FORWARD_ComUserEdit);    
    }
    
    
    public ActionForward saveComUser(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        ComUserForm comUserFrom=(ComUserForm)form;
        ComUser comUser=(ComUser)this.formToModel(comUserFrom,modelClass);
        
        if(StringHelper.doWithNull(comUser.getComUserId()).equals(""))
        {
            
            comUser.setPwd(MD5Helper.MD5Encode(comUser.getPwd()));
            urssServiceFacade.addComUser(comUser);
            comUserFrom.setComUserId(comUser.getComUserId());
            comUserFrom.setPwd(comUser.getPwd());
        }
        else
        {
            String pwdOld=request.getParameter("pwdOld");
            if(!comUser.getPwd().trim().equals(pwdOld))
            {
                comUser.setPwd(MD5Helper.MD5Encode(comUser.getPwd()));
                comUserFrom.setPwd(comUser.getPwd());
            }
            urssServiceFacade.updateComUser(comUser);
        }
        return mapping.findForward(FORWARD_ComUserEdit);    
    }
    
    public ActionForward showComUser(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        ComUserForm comUserFrom=(ComUserForm)form;
        ComUser comUser=urssServiceFacade.getComUserById(comUserFrom.getComUserId());
        comUserFrom=(ComUserForm)this.modelToForm(comUser,ActionFormClass);
        request.setAttribute("ComUserForm",comUserFrom);
        return mapping.findForward(FORWARD_ComUserEdit);    
    }
    
    public ActionForward deleteComUser(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
         String comId=request.getParameter("comId");
         
        request.setCharacterEncoding("UTF-8");
            response.setHeader("Cache-Control","no-cache");
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().write("666");
        return null;    
    }

    
    

}
