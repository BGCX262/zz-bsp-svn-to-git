package com.youthor.bsp.view.urss.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.CoopArea;
import com.youthor.bsp.core.abdf.model.ReportQueryPara;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.web.form.ReportQueryParaForm;

public class ReportQueryParaAction extends BaseStrutsAction{
    
    private IAbdfServiceFacade abdfServiceFacade;
    
    
      private static final String FORWARD_ReportQueryParaList = "reportQueryParaList";
      private static final String FORWARD_ReportQueryParaEdit = "reportQueryParaEdit";
      private static final String FORWARD_DelToList = "delToList";
      
      private static final String ActionFormClass = ReportQueryParaForm.class.getName();
      private static final String modelClass = ReportQueryPara.class.getName();
      
    public ActionForward getAllReportQueryParaByFunId(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String funId=request.getParameter("funModuleId");
        String appId=request.getParameter("appId");
        List pageList=abdfServiceFacade.getQueryParasByFunId(funId);
        request.setAttribute("funId",funId);
        request.setAttribute("appId",appId);
        request.setAttribute("pageList",pageList);
        return mapping.findForward(FORWARD_ReportQueryParaList);    
    }
           
    public ActionForward showReportQueryPara(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        ReportQueryParaForm reportQueryParaForm=(ReportQueryParaForm)form;
        
        String reportQueryParaId=reportQueryParaForm.getId();
        ReportQueryPara reportQueryPara=abdfServiceFacade.getReportQueryParaId(reportQueryParaId);
        reportQueryParaForm=(ReportQueryParaForm)this.modelToForm(reportQueryPara,ActionFormClass);
        request.setAttribute("ReportQueryParaForm",reportQueryParaForm);
        return mapping.findForward(FORWARD_ReportQueryParaEdit);    
    }    
    
    
    public ActionForward initReportQueryPara(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        ReportQueryParaForm reportQueryParaForm=(ReportQueryParaForm)form;
        reportQueryParaForm.setDataType("string");
        reportQueryParaForm.setInputType("text");
        reportQueryParaForm.setNotNull("N");
        return mapping.findForward(FORWARD_ReportQueryParaEdit);    
    }    
    
    
    
    public ActionForward saveReportQueryPara(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        ReportQueryParaForm reportQueryParaForm=(ReportQueryParaForm)form;    
       
        ReportQueryPara reportQueryPara=(ReportQueryPara)this.formToModel(reportQueryParaForm,modelClass);
        //对所有父id付值
        if(reportQueryPara.getId()!=null&&!reportQueryPara.getId().equals(""))
        {
        	abdfServiceFacade.updateReportQueryPara(reportQueryPara);
        }
        else {
        	String id = abdfServiceFacade.addReportQueryPara(reportQueryPara);
        	reportQueryParaForm.setId(id);
        }
        return mapping.findForward(FORWARD_ReportQueryParaEdit);
    }
    
    public ActionForward deleteReportQueryPara(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String [] ids=request.getParameterValues("itemIdCheckBox");
        abdfServiceFacade.deleteReportQueryParaByIds(ids);
         String funId=request.getParameter("funModuleId");
        
            request.setAttribute("funId",funId);
        return mapping.findForward(FORWARD_DelToList);    
    }

	public void setAbdfServiceFacade(IAbdfServiceFacade abdfServiceFacade) {
		this.abdfServiceFacade = abdfServiceFacade;
	}    

    
    

}
