/**
 * 
 */
package com.youthor.bsp.view.urss.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.CoopArea;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;
import com.youthor.bsp.view.urss.web.form.CoopAreaForm;

public class CoopAreaAction extends BaseStrutsAction{
    
    private IUrssServiceFacade urssServiceFacade;
    
    
      private static final String FORWARD_CoopAreaList = "coopAreaList";
      private static final String FORWARD_CoopAreaEdit = "coopAreaEdit";
      
      private static final String ActionFormClass =CoopAreaForm.class.getName();
      private static final String modelClass =CoopArea.class.getName();
      
    public void setUrssServiceFacade(IUrssServiceFacade urssServiceFacade) {
        this.urssServiceFacade = urssServiceFacade;
    }

    public ActionForward getCoopAreaByComId(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String comId=WebHelper.getTopOrgId(request.getSession(),"GS");       
        List pageList=urssServiceFacade.getAllCoopArea();
        request.setAttribute("pageList",pageList);
        return mapping.findForward(FORWARD_CoopAreaList);    
    }
    
    public ActionForward initCoopArea(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        CoopAreaForm coopAreaForm=(CoopAreaForm)form;   
        coopAreaForm.setIsDynamic("Y");
        return mapping.findForward(FORWARD_CoopAreaEdit);    
    }
    
    public ActionForward deleteCoopArea(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
    	 String [] coopAreaIds=request.getParameterValues("itemIdCheckBox");
         urssServiceFacade.deleteCoopAreaByIds(coopAreaIds);
         response.sendRedirect(request.getContextPath()+"/getCoopAreaByComId_urss.do");
         return null;
        
    }
    
    public ActionForward showCoopArea(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        CoopAreaForm coopAreaForm=(CoopAreaForm)form;
        CoopArea coopArea=urssServiceFacade.getCoopAreaById(coopAreaForm.getCoopAreaId());
        coopAreaForm=(CoopAreaForm)this.modelToForm(coopArea,ActionFormClass);
        request.setAttribute("CoopAreaForm",coopAreaForm);
        return mapping.findForward(FORWARD_CoopAreaEdit);    
    }
    
   
    
    public ActionForward saveCoopArea(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        CoopAreaForm coopAreaForm=(CoopAreaForm)form;
        CoopArea coopArea=(CoopArea)this.formToModel(coopAreaForm,modelClass);
        if(StringHelper.doWithNull(coopArea.getCoopAreaId()).equals(""))
        {
            urssServiceFacade.addCoopArea(coopArea);
            coopAreaForm.setCoopAreaId(coopArea.getCoopAreaId());
           
        }
        else
        {
            urssServiceFacade.updateCoopArea(coopArea);
        }
        response.sendRedirect(request.getContextPath()+"/showCoopArea_urss.do?coopAreaId="+coopAreaForm.getCoopAreaId());
        return null;
    }
          

}
