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
import com.youthor.bsp.core.urss.model.Resource;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.urss.web.form.ResourceForm;

public class ResourceAction extends BaseStrutsAction{
    
    private IUrssServiceFacade urssServiceFacade;
    
    
      private static final String FORWARD_ResourceList = "resourceList";
      private static final String FORWARD_ResourceEdit = "resourceEdit";
      private static final String FORWARD_DelToList = "delToList";
      
      private static final String ActionFormClass = ResourceForm.class.getName();
      private static final String modelClass = Resource.class.getName();
      
    public ActionForward getAllResourceByFunId(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String funId=request.getParameter("funModuleId");
        String appId=request.getParameter("appId");
        List pageList=urssServiceFacade.getResourcesByFunId(funId);
        request.setAttribute("funId",funId);
        request.setAttribute("appId",appId);
        request.setAttribute("pageList",pageList);
        return mapping.findForward(FORWARD_ResourceList);    
    }
           
    public ActionForward showResource(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        ResourceForm resourceForm=(ResourceForm)form;
        
        String resourceId=resourceForm.getResourceId();
        Resource resource=urssServiceFacade.getResourceId(resourceId);
        String coopId=resource.getCoopAreaId();
        resourceForm=(ResourceForm)this.modelToForm(resource,ActionFormClass);
        if(coopId!=null&&!coopId.equals(""))
        {
            CoopArea coopArea=urssServiceFacade.getCoopAreaById(coopId);
            String allName=coopArea.getCoopAreaName();
           
            resourceForm.setCoopAreaIdName(allName);
        }
        
        request.setAttribute("ResourceForm",resourceForm);
        return mapping.findForward(FORWARD_ResourceEdit);    
    }    
    
    
    public ActionForward initResource(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        ResourceForm resourceForm=(ResourceForm)form;
        resourceForm.setIsButton("Y");
        resourceForm.setHaveOrgRight("N");
        resourceForm.setIsMenuDisplay("N");
        resourceForm.setLinkAssign("N");
        resourceForm.setIsMenuDisplay("N");
        resourceForm.setAssignMethod("display");
        
        return mapping.findForward(FORWARD_ResourceEdit);    
    }    
    
    
    
    public ActionForward saveResource(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        ResourceForm resourceForm=(ResourceForm)form;    
        String [] linkAssignValues=request.getParameterValues("linkAssignValue");
        resourceForm.setLinkAssignValue(StringHelper.arrToString(linkAssignValues));
        Resource resource=(Resource)this.formToModel(resourceForm,modelClass);
        //对所有父id付值
        if(resource.getParentResId()!=null&&!resource.getParentResId().equals(""))
        {
            Resource resourceParent=urssServiceFacade.getResourceId(resource.getParentResId());
            if(!StringHelper.doWithNull(resourceParent.getAllParentResId()).equals(""))
            {
                resource.setAllParentResId(resourceParent.getAllParentResId()+","+resource.getParentResId());
            }
            else
            {
                resource.setAllParentResId(resource.getParentResId());
            }
            
        }
        String resourceId =resource.getResourceId();
        if(resourceId==null||resourceId.equals(""))
        {
            
            urssServiceFacade.addResource(resource);
            resourceForm.setResourceId(resource.getResourceId());
        }
        else
        {
            urssServiceFacade.updateResource(resource);
        }
        return mapping.findForward(FORWARD_ResourceEdit);
    }
    
    public ActionForward deleteResource(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String [] ids=request.getParameterValues("itemIdCheckBox");
        urssServiceFacade.deleteResourceByIds(ids);
         String funId=request.getParameter("funModuleId");
        
            request.setAttribute("funId",funId);
        return mapping.findForward(FORWARD_DelToList);    
    }    

    public void setUrssServiceFacade(IUrssServiceFacade urssServiceFacade) {
        this.urssServiceFacade = urssServiceFacade;
    }    
    

}
