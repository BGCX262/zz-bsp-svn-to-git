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
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.core.urss.model.App;
import com.youthor.bsp.core.wfss.model.AppForm;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;
import com.youthor.bsp.view.wfss.common.WFCacheHelper;
import com.youthor.bsp.view.wfss.web.form.AppFormForm;


public class AppFormAction  extends BaseStrutsAction{
    

      private static final String FORWARD_AppFormList = "appFormList";
      private static final String FORWARD_AppFormEdit = "appFormEdit";
      private static final String FORWARD_DelToList = "delToList";
      
      private static final String ActionFormClass = AppFormForm.class.getName();
      private static final String modelClass = AppForm.class.getName();
      
    private IWfssServiceFacade wfssServiceFacade;
    
    public void setWfssServiceFacade(IWfssServiceFacade wfssServiceFacade) {
        this.wfssServiceFacade = wfssServiceFacade;
    }

    
    public ActionForward queryPageAppForm(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String appId=WebHelper.getAppId();
        List pageList=wfssServiceFacade.getAppFormByAppId(appId);
        App app=WebHelper.getApp();
        request.setAttribute("app",app);
         String reloadTree=(String)request.getAttribute("reloadTree");
         if(reloadTree!=null)
         {
             request.setAttribute("reloadTree","true");
         }
        request.setAttribute("pageList",pageList);
        return mapping.findForward(FORWARD_AppFormList);    
    }
    
    public ActionForward initAppForm(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        App app=WebHelper.getApp();
        request.setAttribute("app",app);
        return mapping.findForward(FORWARD_AppFormEdit);    
    }
    
public ActionForward saveAppForm(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
      AppFormForm appFormFrom=(AppFormForm)form;
      AppForm appForm=(AppForm)this.formToModel(appFormFrom,modelClass);
    
    if(StringHelper.doWithNull(appForm.getAppFormId()).equals(""))
    {
        appForm.setComId(WebHelper.getTopOrgId(request.getSession(),"GS"));
        wfssServiceFacade.addAppForm(appForm);
        appFormFrom.setAppFormId(appForm.getAppFormId());
        request.setAttribute("reloadTree","true");
        
    }
    else
    {
        String appFormNameOld=request.getParameter("appFormNameOld");
        if(appFormNameOld==null) appFormNameOld="";
        if(!appFormNameOld.equals(appForm.getAppFormName()))
            request.setAttribute("reloadTree","true");
        wfssServiceFacade.updateAppForm(appForm);
    }
    
    
    App app=WebHelper.getApp();
    request.setAttribute("app",app);
    
    
    
    
        return mapping.findForward(FORWARD_AppFormEdit);    
    }

public ActionForward showAppForm(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
    AppFormForm appFormForm=(AppFormForm)form;
    AppForm appForm=wfssServiceFacade.getAppFormById(appFormForm.getAppFormId());
    appFormForm=(AppFormForm)this.modelToForm(appForm,ActionFormClass);
    request.setAttribute("AppFormForm",appFormForm);
    App app=WebHelper.getApp();
    request.setAttribute("app",app);
    return mapping.findForward(FORWARD_AppFormEdit);    
}

public ActionForward deleteAppForm(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String [] ids=request.getParameterValues("itemIdCheckBox");
        wfssServiceFacade.deleteAppFormByIds(ids);
        request.setAttribute("reloadTree","true");
        return mapping.findForward(FORWARD_DelToList);    
    }
    
}
