/**
 * 
 */
package com.youthor.bsp.view.abdf.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import com.youthor.bsp.core.abdf.common.helper.QueryCodeHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.model.OnLineHelper;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.helper.AttachFactoryHelper;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;
import com.youthor.bsp.view.abdf.web.form.OnLineHelperForm;






public class OnLineHelperAction extends BaseStrutsAction{
    
    private IAbdfServiceFacade abdfServiceFacade;
    
    
      private static final String FORWARD_onLineHelperList = "onLineHelperList";
      private static final String FORWARD_onLineHelperEdit = "onLineHelperEdit";
      private static final String FORWARD_onLineHelperView = "onLineHelperView";
      
      private static final String FORWARD_DelToList = "delToList";
      
      private static final String ActionFormClass =OnLineHelperForm.class.getName();
      private static final String modelClass =OnLineHelper.class.getName();
      




    

    public ActionForward getTopOnLineHelper(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {

        List pageList=abdfServiceFacade.getTopOnLineHelper();
        request.setAttribute("pageList",pageList);
        return mapping.findForward(FORWARD_onLineHelperList);    
    }
    
    public ActionForward initOnLineHelper(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        OnLineHelperForm onLineHelperForm=(OnLineHelperForm)form;
       String parentId=request.getParameter("parentId");
       if(parentId!=null&&!parentId.equals(""))
       {
           OnLineHelper onLineHelper=abdfServiceFacade.getOnLineHelperById(parentId);
           String allParentId=onLineHelper.getAllParentId();
           if(allParentId!=null&&!allParentId.equals(""))
               allParentId=allParentId+":"+onLineHelper.getOnLineHelperId();
           else
           {
               allParentId=onLineHelper.getOnLineHelperId();
           }
           String allParentName=onLineHelper.getAllParentName();
           
           if(allParentName!=null&&!allParentName.equals(""))
               allParentName=allParentName+":"+onLineHelper.getOnLineHelperName();
           else
           {
               allParentName=onLineHelper.getOnLineHelperName();
           }
          
           onLineHelperForm.setAllParentId(allParentId);
           onLineHelperForm.setAllParentName(allParentName);
         
       }
       
        return mapping.findForward(FORWARD_onLineHelperEdit);    
    }
    
    public ActionForward deleteOnLineHelper(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        OnLineHelperForm onLineHelperForm=(OnLineHelperForm)form;
        
        String [] onLineHelperIds=request.getParameterValues("itemIdCheckBox");
        boolean delete=abdfServiceFacade.deleteOnLineHelperByIds(onLineHelperIds); 
        if(onLineHelperForm.getOnLineHelperId()!=null)
        {
            List subonLineHelperList=abdfServiceFacade.getSubOnLineHelperByParentId(onLineHelperForm.getOnLineHelperId());
            request.setAttribute("subOnLineHelperList",subonLineHelperList);
            request.setAttribute("reloadTree","true");
            
            
             List attachListData=abdfServiceFacade.getAttachInfoListByAppId(onLineHelperForm.getOnLineHelperId());
             request.setAttribute("attachListData",attachListData);
            return mapping.findForward(FORWARD_onLineHelperEdit);
        }
        else
        {
        
            
            List pageList=abdfServiceFacade.getTopOnLineHelper();
            request.setAttribute("pageList",pageList);
             request.setAttribute("reloadTree","true");
             
            return mapping.findForward(FORWARD_DelToList);
        }
    }
    
    public ActionForward deleteAttachHelp(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        OnLineHelperForm onLineHelperForm=(OnLineHelperForm)form;
        
        String [] attachIds=request.getParameterValues("itemIdFileCheckBox");
        if(attachIds!=null&&attachIds.length>0)
        {
            for(int i=0;i<attachIds.length;i++)
            {
                abdfServiceFacade.deleteAttachInfo(abdfServiceFacade.getAttachInfoById(attachIds[i]));
            }
        }
       
//            List subonLineHelperList=abdfServiceFacade.getSubOnLineHelperByParentId(onLineHelperForm.getOnLineHelperId());
//            request.setAttribute("subOnLineHelperList",subonLineHelperList);
//            
//            
//             List attachListData=abdfServiceFacade.getAttachInfoListByAppId(onLineHelperForm.getOnLineHelperId());
//             request.setAttribute("attachListData",attachListData);
        response.sendRedirect(request.getContextPath()+"/showOnLineHelper.do?onLineHelperId="+onLineHelperForm.getOnLineHelperId());
            return null;
       
        
    }
    
    public ActionForward showOnLineHelperByCode(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        OnLineHelperForm onLineHelperForm=(OnLineHelperForm)form;
        
        OnLineHelper onLineHelper=abdfServiceFacade.getOnLineHelperByCode(onLineHelperForm.getOnLineHelperCode());
        if (onLineHelper!=null ) {
            request.setAttribute("onLineHelperId", onLineHelper.getOnLineHelperId());
        }
        return mapping.findForward("onLineHelperView");
        
    }
    
    
    public ActionForward showOnLineHelper(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        OnLineHelperForm onLineHelperForm=(OnLineHelperForm)form;
        OnLineHelper onLineHelper=abdfServiceFacade.getOnLineHelperById(onLineHelperForm.getOnLineHelperId());
        onLineHelperForm=(OnLineHelperForm)this.modelToForm(onLineHelper,ActionFormClass);
        request.setAttribute("OnLineHelperForm",onLineHelperForm);
        List subOnLineHelperList=abdfServiceFacade.getSubOnLineHelperByParentId(onLineHelper.getOnLineHelperId());
        request.setAttribute("subOnLineHelperList",subOnLineHelperList);
         List attachListData=abdfServiceFacade.getAttachInfoListByAppId(onLineHelper.getOnLineHelperId());
         request.setAttribute("attachListData",attachListData);
         String view = request.getParameter("view_help");
        
         if (view == null || view.equals("")) {
           return mapping.findForward(FORWARD_onLineHelperEdit);    
         }
         else {
             return mapping.findForward(FORWARD_onLineHelperView);     
         }
    }
    
    public ActionForward moveOnLineHelper(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        OnLineHelperForm onLineHelperForm=(OnLineHelperForm)form;
        
        String moveToDataId=request.getParameter("moveToDataId");
        String upAndDown=request.getParameter("upAndDown");
        OnLineHelper target=abdfServiceFacade.getOnLineHelperById(moveToDataId);
        String [] sources=request.getParameterValues("itemIdCheckBox");
        if(upAndDown.equals("down"))
        {
            for(int i=0;i<sources.length;i++)
            {
                OnLineHelper source =abdfServiceFacade.getOnLineHelperById(sources[i]);
                source.setParentId(target.getOnLineHelperId());
                if(StringHelper.doWithNull(target.getAllParentId()).equals(""))
                {
                    source.setAllParentId(target.getOnLineHelperId());
                    source.setAllParentName(target.getOnLineHelperName());
                }
                else
                {
                    source.setAllParentId(target.getAllParentId()+":"+target.getOnLineHelperId());
                    source.setAllParentName(target.getAllParentName()+":"+target.getOnLineHelperName());
                }
                abdfServiceFacade.updateMoveOnLineHelper(source);
            }
        }
        else
        {
            for(int i=0;i<sources.length;i++)
            {
                OnLineHelper source =abdfServiceFacade.getOnLineHelperById(sources[i]);
                source.setParentId(StringHelper.doWithNull(target.getParentId()));
                source.setAllParentId(target.getAllParentId());
                source.setAllParentName(target.getAllParentName());
                abdfServiceFacade.updateMoveOnLineHelper(source);
            }
        }
        if(onLineHelperForm!=null&&onLineHelperForm.getOnLineHelperId()!=null&&!onLineHelperForm.getOnLineHelperId().equals(""))
        {
            request.setAttribute("onLineHelperForm",onLineHelperForm);
            List subOnLineHelperList=abdfServiceFacade.getSubOnLineHelperByParentId(onLineHelperForm.getOnLineHelperId());
            request.setAttribute("subOnLineHelperList",subOnLineHelperList);
            request.setAttribute("reloadTree","true");
            
            
             List attachListData=abdfServiceFacade.getAttachInfoListByAppId(onLineHelperForm.getOnLineHelperId());
             request.setAttribute("attachListData",attachListData);
            return mapping.findForward(FORWARD_onLineHelperEdit);
        }
        else
        {
            
            
            List pageList=abdfServiceFacade.getTopOnLineHelper();
            request.setAttribute("pageList",pageList);
            request.setAttribute("reloadTree","true");
            
            return mapping.findForward(FORWARD_DelToList);
        }    
    }
    
    
    
    
    public ActionForward saveOnLineHelper(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        OnLineHelperForm onLineHelperForm=(OnLineHelperForm)form;
        if(onLineHelperForm.getOnLineHelperCode()==null||onLineHelperForm.getOnLineHelperCode().equals(""))
        {
            onLineHelperForm.setOnLineHelperCode(QueryCodeHelper.getQueryCode(onLineHelperForm.getOnLineHelperName()));
        }
        OnLineHelper onLineHelper=(OnLineHelper)this.formToModel(onLineHelperForm,modelClass);
        
        if(StringHelper.doWithNull(onLineHelper.getOnLineHelperId()).equals(""))
        {
            String id=abdfServiceFacade.addOnLineHelper(onLineHelper);
            onLineHelperForm.setOnLineHelperId(onLineHelper.getOnLineHelperId());
            request.setAttribute("reloadTree","true");
        }
        else
        {
            String onLineHelperNameOld=onLineHelperForm.getOnLineHelperNameOld();
            if(!onLineHelperNameOld.trim().equals(onLineHelperForm.getOnLineHelperName().trim()))
            {
                request.setAttribute("reloadTree","true");
            }
            
            float orderShowOld=onLineHelperForm.getOrderShowOld();
            if(orderShowOld!=onLineHelperForm.getOrderShow())
            {
                request.setAttribute("reloadTree","true");
            }
            
            
            List subonLineHelperList=abdfServiceFacade.getSubOnLineHelperByParentId(onLineHelper.getOnLineHelperId());
            request.setAttribute("subOnLineHelperList",subonLineHelperList);
            
            String id=abdfServiceFacade.updateOnLineHelper(onLineHelper);
        }
        Org sysOrg =WebHelper.getOrg(request.getSession());
        List attahFormList=onLineHelperForm.getAttahFormList();
         for(int i=0;i<attahFormList.size();i++)
          {
                FormFile formFile=(FormFile)attahFormList.get(i);
                AttachFactoryHelper.updateFile(formFile,onLineHelper.getOnLineHelperId(),"online_help",sysOrg,null,null);
          }
        
         List attachListData=abdfServiceFacade.getAttachInfoListByAppId(onLineHelper.getOnLineHelperId());
         request.setAttribute("attachListData",attachListData);

        return mapping.findForward(FORWARD_onLineHelperEdit);    
    }

    public void setAbdfServiceFacade(IAbdfServiceFacade abdfServiceFacade) {
        this.abdfServiceFacade = abdfServiceFacade;
    }
          

}
