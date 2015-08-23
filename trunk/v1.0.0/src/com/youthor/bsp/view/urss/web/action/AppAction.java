package com.youthor.bsp.view.urss.web.action;

import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


import com.youthor.bsp.core.abdf.common.helper.ConfigInfoHelper;
import com.youthor.bsp.core.abdf.common.helper.DateHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.App;
import com.youthor.bsp.core.urss.model.AppCom;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;

import com.youthor.bsp.view.urss.helper.WebHelper;
import com.youthor.bsp.view.urss.web.form.AppForm;

public class AppAction extends BaseStrutsAction{
    
    private IUrssServiceFacade urssServiceFacade;
    
    
      private static final String FORWARD_AppList = "appList";
      private static final String FORWARD_AppEdit = "appEdit";
      private static final String FORWARD_DelToList = "delToList";
      private static final String FORWARD_AppListWithApply = "listWithApply";
      
      
      private static final String ActionFormClass = AppForm.class.getName();
      private static final String modelClass = App.class.getName();
      
    public ActionForward getAllApp(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        //得到管理员id
        String comId=WebHelper.getCurrComId(request.getSession());
        List pageList=null;
        //如果是公司管理员，得到公司下所有的应用。
        //如果是应用管理员，得到此应用管理员所管理的应用
        pageList = urssServiceFacade.getAllApp();
        /**
        if(WebHelper.isComAdmin(request.getSession()))
           pageList=urssServiceFacade.getAllAppByComId(comId);
        else if(WebHelper.isAppAdmin(request.getSession()))
            pageList=urssServiceFacade.getAppByUserId(comId,WebHelper.getCurrComUser(request.getSession()).getComUserId());
        **/
        request.setAttribute("pageList",pageList);
        return mapping.findForward(FORWARD_AppList);    
    }
           
    public ActionForward showApp(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        AppForm appForm=(AppForm)form;
        String appId=appForm.getAppId();
        App app=urssServiceFacade.getAppById(appId);
        appForm=(AppForm)this.modelToForm(app,ActionFormClass);
        request.setAttribute("AppForm",appForm);
        return mapping.findForward(FORWARD_AppEdit);    
    }    
    
    public ActionForward showAppByCode(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        AppForm appForm=(AppForm)form;
        String appCode=ConfigInfoHelper.getProperty("AppCode");
        String comId=ConfigInfoHelper.getProperty("ComId");
        App app=urssServiceFacade.getAppByCode(comId,appCode);
        appForm=(AppForm)this.modelToForm(app,ActionFormClass);
        request.setAttribute("AppForm",appForm);
        return mapping.findForward(FORWARD_AppEdit);    
    }    
    
    
    
    public ActionForward initApp(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        AppForm appForm=(AppForm)form;
        appForm.setTurnOnMenu("Y");
        appForm.setStartupMenuCache("Y");
        return mapping.findForward(FORWARD_AppEdit);    
    }    
    
    
    public ActionForward getAllAppWithApply(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String comId=ConfigInfoHelper.getProperty("ComId");
        List pageListWithApply = urssServiceFacade.getAllAppWithApply(comId);
        List pageList = urssServiceFacade.getAllApp();
        request.setAttribute("pageListWithApply",pageListWithApply);
        request.setAttribute("pageList",pageList);
        return mapping.findForward(FORWARD_AppListWithApply);    
    }
    
    public ActionForward comApplyApp(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String comId=ConfigInfoHelper.getProperty("ComId");
        String appId = request.getParameter("appId");
        String isAutoApprovedApp=ConfigInfoHelper.getProperty("isAutoApprovedApp");
        AppCom appCom =new AppCom();
        appCom.setComId(comId);
        appCom.setAppId(appId);
        if(isAutoApprovedApp.equals("Y")) {
            appCom.setStatus("approved");
             String defautValidDays=ConfigInfoHelper.getProperty("defautValidDays");
             int intDefautValidDays=Integer.parseInt(defautValidDays);
             appCom.setValidDate(DateHelper.getDateByNeedDays(intDefautValidDays));
        }
        urssServiceFacade.addComApp(appCom);
        response.sendRedirect(request.getContextPath()+"/getAllAppWithApply_urss.do");
        return null;    
    }
    
    public ActionForward comCancelApp(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String comId=ConfigInfoHelper.getProperty("ComId");
        String appId = request.getParameter("appId");
        AppCom appCom = urssServiceFacade.getAppComByIds(comId,appId);
        urssServiceFacade.deleteComApp(appCom);
        response.sendRedirect(request.getContextPath()+"/getAllAppWithApply_urss.do");
        return null;    
    }
    
    
    public ActionForward saveApp(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        AppForm appForm=(AppForm)form;        
        App app=(App)this.formToModel(appForm,modelClass);
        String appId =app.getAppId();
        if(appId==null||appId.equals(""))
        {
            app.setComId(WebHelper.getCurrComId(request.getSession()));
            urssServiceFacade.addApp(app);
            appForm.setAppId(app.getAppId());
        }
        else
        {
            urssServiceFacade.updateApp(app);
        }
        return mapping.findForward(FORWARD_AppEdit);
    }
    
    public ActionForward deleteApp(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String [] ids=request.getParameterValues("itemIdCheckBox");
        //删除应用时要联带删除所有的子数据
        //角色人员、角色、功能、资源、权限、桌面、相关联接
        urssServiceFacade.deleteAppByIds(ids);
        return mapping.findForward(FORWARD_DelToList);    
    }    
    
    public ActionForward listComApplyApp(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        Page page=(Page)request.getAttribute(Page.PAGE_INFO);
        List pageList=urssServiceFacade.getComApplyAppWithPage(page);
        request.setAttribute("pageList",pageList);
        return mapping.findForward("listComApplyApp");    
    }    

    
    
    public void setUrssServiceFacade(IUrssServiceFacade urssServiceFacade) {
        this.urssServiceFacade = urssServiceFacade;
    }    
    
    

}
