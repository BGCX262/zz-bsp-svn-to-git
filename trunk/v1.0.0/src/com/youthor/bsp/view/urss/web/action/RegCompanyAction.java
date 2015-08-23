package com.youthor.bsp.view.urss.web.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.RegCompany;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.urss.web.form.RegCompanyForm;

public class RegCompanyAction extends BaseStrutsAction{
    
      private static final String FORWARD_RegCompanyList = "regCompanyList";
      private static final String FORWARD_RegCompanyEdit = "regCompanyEdit";
      private static final String FORWARD_RegCompanyDel = "delToList";
      
      private static final String ActionFormClass = "com.youthor.bsp.view.urss.web.form.RegCompanyForm";
      private static final String modelClass = "com.youthor.bsp.core.urss.model.RegCompany";
      
    private IUrssServiceFacade urssServiceFacade;
    public void setUrssServiceFacade(IUrssServiceFacade urssServiceFacade) {
        this.urssServiceFacade = urssServiceFacade;
    }
    
    public ActionForward queryPageRegCompany(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        RegCompany regCompany=new RegCompany();
        Page page=(Page)request.getAttribute(Page.PAGE_INFO);
        List pageList=urssServiceFacade.queryPageRegCompany(page,regCompany);
        request.setAttribute("pageList",pageList);
        return mapping.findForward(FORWARD_RegCompanyList);    
    }
    
    
    public ActionForward initRegCompany(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        RegCompanyForm regCompanyFrom=(RegCompanyForm)form;
        regCompanyFrom.setCreateTime(new Date());
        return mapping.findForward(FORWARD_RegCompanyEdit);    
    }
    
    
    public ActionForward saveRegCompany(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        RegCompanyForm regCompanyFrom=(RegCompanyForm)form;
        RegCompany regCompany=(RegCompany)this.formToModel(regCompanyFrom,modelClass);
        
        if(StringHelper.doWithNull(regCompany.getComId()).equals(""))
        {
            urssServiceFacade.addRegCompany(regCompany);
            regCompanyFrom.setComId(regCompany.getComId());
        }
        else
        {
            urssServiceFacade.updateRegCompany(regCompany);
        }
        return mapping.findForward(FORWARD_RegCompanyEdit);    
    }
    
    public ActionForward showRegCompany(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        RegCompanyForm regCompanyForm=(RegCompanyForm)form;
        RegCompany regCompany=urssServiceFacade.getRegCompanyById(regCompanyForm.getComId());
        regCompanyForm=(RegCompanyForm)this.modelToForm(regCompany,ActionFormClass);
        request.setAttribute("RegCompanyForm",regCompanyForm);
        return mapping.findForward(FORWARD_RegCompanyEdit);    
    }
    
    public ActionForward deleteRegCompany(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
         String comId=request.getParameter("comId");
         
        request.setCharacterEncoding("UTF-8");
            response.setHeader("Cache-Control","no-cache");
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().write("666");
        return null;    
    }

    
    

}
