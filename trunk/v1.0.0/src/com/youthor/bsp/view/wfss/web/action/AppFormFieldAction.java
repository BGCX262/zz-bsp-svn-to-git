/**
 * 
 */
package com.youthor.bsp.view.wfss.web.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.core.wfss.model.AppForm;
import com.youthor.bsp.core.wfss.model.AppFormField;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.wfss.web.form.AppFormFieldForm;


public class AppFormFieldAction extends BaseStrutsAction{
    


      private static final String FORWARD_AppFormFieldList = "appFormFieldList";
      private static final String FORWARD_AppFormFieldEdit = "appFormFieldEdit";
      private static final String FORWARD_DelToList = "delToList";
      
      private static final String ActionFormClass = "com.youthor.bsp.view.wfss.web.form.AppFormFieldForm";
      private static final String modelClass = "com.youthor.bsp.core.wfss.model.AppFormField";
      
    private IWfssServiceFacade wfssServiceFacade;
    public void setWfssServiceFacade(IWfssServiceFacade wfssServiceFacade) {
        this.wfssServiceFacade = wfssServiceFacade;
    }
    
    public ActionForward getFormFieldByFormId(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String appFormId=request.getParameter("appFormId");
        List pageList=new ArrayList();
        pageList=wfssServiceFacade.getAppFormFieldByFormId(appFormId);
        request.setAttribute("pageList",pageList);
        request.setAttribute("appFormId",appFormId);
        AppForm appForm=wfssServiceFacade.getAppFormById(appFormId);
        request.setAttribute("appForm",appForm);
        return mapping.findForward(FORWARD_AppFormFieldList);    
    }
    
    public ActionForward initFormField(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String appFormId=request.getParameter("appFormId");
        request.setAttribute("appFormId",appFormId);
         AppFormFieldForm appFormFieldForm=(AppFormFieldForm)form;
         appFormFieldForm.setIsArray("N");
         AppForm appForm=wfssServiceFacade.getAppFormById(appFormId);
            request.setAttribute("appForm",appForm);
        return mapping.findForward(FORWARD_AppFormFieldEdit);    
    }
    
public ActionForward saveFormField(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
      AppFormFieldForm appFormFieldForm=(AppFormFieldForm)form;
      AppFormField appFormField=(AppFormField)this.formToModel(appFormFieldForm,modelClass);
      request.setAttribute("formId",appFormField.getAppFormId());
      AppForm appForm=wfssServiceFacade.getAppFormById(appFormField.getAppFormId());
        request.setAttribute("appForm",appForm);
    if(StringHelper.doWithNull(appFormField.getFieldId()).equals(""))
    {
        wfssServiceFacade.addAppFormField(appFormField);
        appFormFieldForm.setFieldId(appFormField.getFieldId());
        
    }
    else
    {
        wfssServiceFacade.updateAppFormField(appFormField);
    }
        return mapping.findForward(FORWARD_AppFormFieldEdit);    
    }

public ActionForward showFormField(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
    AppFormFieldForm appFormFieldForm=(AppFormFieldForm)form;
    AppFormField appFormField=wfssServiceFacade.getAppFormFieldById(appFormFieldForm.getFieldId());
    appFormFieldForm=(AppFormFieldForm)this.modelToForm(appFormField,ActionFormClass);
    request.setAttribute("AppFormFieldForm",appFormFieldForm);
    AppForm appForm=wfssServiceFacade.getAppFormById(appFormField.getAppFormId());
    request.setAttribute("appForm",appForm);
        return mapping.findForward(FORWARD_AppFormFieldEdit);    
}

public ActionForward deleteFormField(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String [] ids=request.getParameterValues("itemIdCheckBox");
        wfssServiceFacade.deleteAppFormFieldByIds(ids);
        
        return mapping.findForward(FORWARD_DelToList);    
    }


}
