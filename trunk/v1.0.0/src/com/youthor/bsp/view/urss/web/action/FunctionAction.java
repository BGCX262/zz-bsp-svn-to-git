package com.youthor.bsp.view.urss.web.action;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.AbdfCache;
import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.ConfigInfoHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.App;
import com.youthor.bsp.core.urss.model.CoopArea;
import com.youthor.bsp.core.urss.model.Function;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.urss.helper.WebHelper;
import com.youthor.bsp.view.urss.web.form.FunctionForm;

public class FunctionAction extends BaseStrutsAction{
    
    private IUrssServiceFacade urssServiceFacade;
    
    
      private static final String FORWARD_FunctionList = "functionList";
      private static final String FORWARD_FunctionEdit = "functionEdit";
      private static final String FORWARD_DelToList = "delToList";
      
      private static final String ActionFormClass =FunctionForm.class.getName();
      private static final String modelClass =Function.class.getName();
      
    public void setUrssServiceFacade(IUrssServiceFacade urssServiceFacade) {
        this.urssServiceFacade = urssServiceFacade;
    }

    public ActionForward getTopFunctionByAppId(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String appid=request.getParameter("appd");
        if(appid == null || appid.equals("")) {
            App appG = AbdfCache.app;
            appid = appG.getAppId();
        }
        App app=urssServiceFacade.getAppById(appid);
        List pageList=urssServiceFacade.getTopFunctionByAppId(appid);
        request.setAttribute("pageList",pageList);
        request.setAttribute("app",app);
        return mapping.findForward(FORWARD_FunctionList);    
    }
    
    public ActionForward initFunction(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        FunctionForm functionForm=(FunctionForm)form;
        
         String parentId=request.getParameter("parentId");
         
         
         
         if(parentId!=null&&!parentId.equals(""))
           {
               Function function=urssServiceFacade.getFunctionById(parentId);
               String allParentId=function.getAllParentId();
               if(allParentId!=null&&!allParentId.equals(""))
                   allParentId=allParentId+":"+function.getFunModuleId();
               else
               {
                   allParentId=function.getFunModuleId();
               }
               String allParentName=function.getAllParentName();
               
               if(allParentName!=null&&!allParentName.equals(""))
                   allParentName=allParentName+":"+function.getFunModuleName();
               else
               {
                   allParentName=function.getFunModuleName();
               }
              
               functionForm.setAllParentId(allParentId);
               functionForm.setAllParentName(allParentName);
             
           }
        functionForm.setIsPublic("N");
        functionForm.setWindowStyle("I");
        functionForm.setIsMenu("Y");
        functionForm.setOrderIndex(0F);
        return mapping.findForward(FORWARD_FunctionEdit);    
    }
    
    public ActionForward deleteFunction(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        FunctionForm functionForm=(FunctionForm)form;
        
        String [] functionIds=request.getParameterValues("itemIdCheckBox");
        boolean delete=urssServiceFacade.deleteFunctionByIds(functionIds);
        
        if(functionForm.getFunModuleId()!=null)
        {
            List subFunctionList=urssServiceFacade.getSubFunctionByParentId(functionForm.getFunModuleId());
            request.setAttribute("subFunctionList",subFunctionList);
            request.setAttribute("reloadTree","true");
            return mapping.findForward(FORWARD_FunctionEdit);
        }
        else
        {
            String comId=WebHelper.getCurrComId(request.getSession());
            String appid=request.getParameter("appId");
            App app=urssServiceFacade.getAppById(appid);
            List pageList=urssServiceFacade.getTopFunctionByAppId(appid);
            request.setAttribute("pageList",pageList);
            request.setAttribute("app",app); 
             request.setAttribute("reloadTree","true");
            return mapping.findForward(FORWARD_DelToList);
        }
    }
    
    public ActionForward showFunction(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        FunctionForm functionForm=(FunctionForm)form;
        Function function=urssServiceFacade.getFunctionById(functionForm.getFunModuleId());
        functionForm=(FunctionForm)this.modelToForm(function,ActionFormClass);
        request.setAttribute("FunctionForm",functionForm);
        List subFunctionList=urssServiceFacade.getSubFunctionByParentId(function.getFunModuleId());
        request.setAttribute("subFunctionList",subFunctionList);
        return mapping.findForward(FORWARD_FunctionEdit);    
    }
    
    public ActionForward moveFunction(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        FunctionForm functionForm=(FunctionForm)form;
        
        String moveToDataId=request.getParameter("moveToDataId");
        String upAndDown=request.getParameter("upAndDown");
        Function target=urssServiceFacade.getFunctionById(moveToDataId);
        String [] sources=request.getParameterValues("itemIdCheckBox");
        if(upAndDown.equals("down"))
        {
            for(int i=0;i<sources.length;i++)
            {
                Function source =urssServiceFacade.getFunctionById(sources[i]);
                
                source.setParentId(target.getFunModuleId());
                if(StringHelper.doWithNull(target.getAllParentId()).equals(""))
                {
                    source.setAllParentId(target.getFunModuleId());
                    source.setAllParentName(target.getFunModuleName());
                }
                else
                {
                    source.setAllParentId(target.getAllParentId()+":"+target.getFunModuleId());
                    source.setAllParentName(target.getAllParentName()+":"+target.getFunModuleName());
                }
                urssServiceFacade.updateMoveFunction(source);
            }
        }
        else
        {
            for(int i=0;i<sources.length;i++)
            {
                Function source =urssServiceFacade.getFunctionById(sources[i]);
                source.setParentId(StringHelper.doWithNull(target.getParentId()));
                source.setAllParentId(target.getAllParentId());
                source.setAllParentName(target.getAllParentName());
                urssServiceFacade.updateMoveFunction(source);
            }
        }
        if(functionForm!=null&&functionForm.getFunModuleId()!=null&&!functionForm.getFunModuleId().equals(""))
        {
            request.setAttribute("FunctionForm",functionForm);
            List subFunctionList=urssServiceFacade.getSubFunctionByParentId(functionForm.getFunModuleId());
            request.setAttribute("subFunctionList",subFunctionList);
            request.setAttribute("reloadTree","true");
            return mapping.findForward(FORWARD_FunctionEdit);
        }
        else
        {
            String comId=WebHelper.getCurrComId(request.getSession());
            String appid=request.getParameter("appId");
            App app=urssServiceFacade.getAppById(appid);
            List pageList=urssServiceFacade.getTopFunctionByAppId(appid);
            request.setAttribute("pageList",pageList);
            request.setAttribute("app",app); 
             request.setAttribute("reloadTree","true");
            return mapping.findForward(FORWARD_DelToList);
        }
        
    }
    
    
    
    
    public ActionForward saveFunction(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        FunctionForm functionForm=(FunctionForm)form;
        Function function=(Function)this.formToModel(functionForm,modelClass);
        if(StringHelper.doWithNull(function.getFunModuleId()).equals(""))
        {
            urssServiceFacade.addFunction(function);
            functionForm.setFunModuleId(function.getFunModuleId());
            request.setAttribute("reloadTree","true");
        }
        else
        {
            String functionNameOld=request.getParameter("functionNameOld");
            if(!functionNameOld.trim().equals(functionForm.getFunModuleName().trim()))
            {
                request.setAttribute("reloadTree","true");
            }
            List subFunctionList=urssServiceFacade.getSubFunctionByParentId(function.getFunModuleId());
            request.setAttribute("subFunctionList",subFunctionList);
            urssServiceFacade.updateFunction(function);
        }
        return mapping.findForward(FORWARD_FunctionEdit);    
    }
           
    

}
