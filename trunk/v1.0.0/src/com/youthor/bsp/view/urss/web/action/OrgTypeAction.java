/**
 * 
 */
package com.youthor.bsp.view.urss.web.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.OrgType;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.helper.ValidationHelper;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;
import com.youthor.bsp.view.urss.web.form.OrgTypeForm;


public class OrgTypeAction extends BaseStrutsAction{


      private static final String FORWARD_OrgTypeList = "orgTypeList";
      private static final String FORWARD_OrgTypeEdit = "orgTypeEdit";
      private static final String FORWARD_DelToList = "delToList";
      
      private static final String ActionFormClass = OrgTypeForm.class.getName();
      private static final String modelClass = OrgType.class.getName();
      
    private IUrssServiceFacade urssServiceFacade;
    public void setUrssServiceFacade(IUrssServiceFacade urssServiceFacade) {
        this.urssServiceFacade = urssServiceFacade;
    }
    
    public ActionForward getOrgTypeByComId(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        Page page=(Page)request.getAttribute(Page.PAGE_INFO);
        HttpSession session=request.getSession();
        String comId=WebHelper.getTopOrgId(session, Constants.GLOBAL_GS);
        List pageList=new ArrayList();
        pageList=urssServiceFacade.getOrgTypeByComId(comId);
        request.setAttribute("pageList",pageList);
        return mapping.findForward(FORWARD_OrgTypeList);    
    }
    
    public ActionForward initOrgType(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
    	 HttpSession session=request.getSession();
	     String comId=WebHelper.getTopOrgId(session, Constants.GLOBAL_GS);
	     OrgTypeForm orgTypeFrom=(OrgTypeForm)form;
	     orgTypeFrom.setComId(comId);
	     orgTypeFrom.setSystemIn("N");
    	return mapping.findForward(FORWARD_OrgTypeEdit);    
    }
    
public ActionForward saveOrgType(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
      OrgTypeForm orgTypeFrom=(OrgTypeForm)form;
      OrgType orgType=(OrgType)this.formToModel(orgTypeFrom,modelClass);
      boolean b = ValidationHelper.isAuthorityForCom(request,OrgType.class,orgType.getOrgTypeId());
      if (!b) {
      	  response.sendRedirect(request.getContextPath()+"/forwardNoPowerInfo_abdf.do");
  	      return null; 
      }
      List errorList = ValidationHelper.validateForm(request, "urss", "orgTypeEdit");
      if (errorList.isEmpty()){
	      HttpSession session=request.getSession();
	      String comId=WebHelper.getTopOrgId(session, Constants.GLOBAL_GS);
	      if(StringHelper.doWithNull(orgType.getOrgTypeId()).equals("")){
	        orgType.setComId(comId);
	        orgType.setSystemIn("N");
	        urssServiceFacade.addOrgType(orgType);
	        orgTypeFrom.setOrgTypeId(orgType.getOrgTypeId());
	      }
	     else{
	        urssServiceFacade.updateOrgType(orgType);
	      }
	      response.sendRedirect(request.getContextPath()+"/showOrgType_urss.do?orgTypeId="+orgType.getOrgTypeId());
	      return null; 
      }
        return mapping.findForward(FORWARD_OrgTypeEdit);    
}

public ActionForward showOrgType(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
    OrgTypeForm orgTypeForm=(OrgTypeForm)form;
    OrgType orgType=urssServiceFacade.getOrgTypeById(orgTypeForm.getOrgTypeId());
    boolean b = ValidationHelper.isAuthorityForCom(request,orgType);
    if (!b) {
    	  response.sendRedirect(request.getContextPath()+"/forwardNoPowerInfo_abdf.do");
	      return null; 
    }
    
    orgTypeForm=(OrgTypeForm)this.modelToForm(orgType,ActionFormClass);
    request.setAttribute("OrgTypeForm",orgTypeForm);
        return mapping.findForward(FORWARD_OrgTypeEdit);    
}

public ActionForward deleteOrgType(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String [] ids=request.getParameterValues("itemIdCheckBox");
        HttpSession session=request.getSession();
        List erroeList =  new ArrayList();
        session.setAttribute("ERROR_LIST_INFO",erroeList);
	    String comId=WebHelper.getTopOrgId(session, Constants.GLOBAL_GS);
        if (ids!=null && ids.length>0) {
        	for(int i=0;i<ids.length;i++) {
        		OrgType orgType = urssServiceFacade.getOrgTypeById(ids[i]);
        		if (orgType!=null) {
        		    int num = urssServiceFacade.getHasOrgNum(orgType.getOrgTypeCode(),comId);
        		    if (num>0) {
        		    	erroeList.add(orgType.getOrgTypeName()+"下拥有组织，不能删");
        		    }
        		    else {
        		    	urssServiceFacade.deleteOrgType(orgType);
        		    }
        		}
        	}
        }
        return mapping.findForward(FORWARD_DelToList);    
    }

public ActionForward validateOrgTypeIsUseing(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
    String orgTypeCode = request.getParameter("orgTypeCode");
    String comId = request.getParameter("comId");
    StringBuffer sb=new StringBuffer();
    sb.append("false");
    PrintWriter out = response.getWriter();
    out.print(sb.toString());
    
    return null;    
}


}
