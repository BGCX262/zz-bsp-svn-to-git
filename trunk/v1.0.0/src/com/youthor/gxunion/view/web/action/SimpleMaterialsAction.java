package com.youthor.gxunion.view.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;

import com.youthor.gxunion.common.util.Constants;
import com.youthor.gxunion.core.facade.IGxUnionServiceFacade;
import com.youthor.gxunion.core.model.SimpleMaterials;
import com.youthor.gxunion.view.web.form.SimpleMaterialsForm;

public class SimpleMaterialsAction extends BaseStrutsAction {
    private static final String FORWARD_SIMPLE_MATERIALS_LIST = "simpleMaterialsList";
    private static final String FORWARD_SIMPLE__MATERIALS_EDIT = "simpleMaterialsEdit";
    private static final String FORWARD_SIMPLE__MATERIALS_DEL  = "delToList";
    
    private static final String formClass = SimpleMaterialsForm.class.getName();
    private static final String modelClass = SimpleMaterials.class.getName();
    private IGxUnionServiceFacade serviceFacade;

    public ActionForward listPageMaterials(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        Page page=(Page)request.getAttribute(Page.PAGE_INFO);
        List pageList=serviceFacade.getValidSimpleMaterials(page, null);
        request.setAttribute("pageList",pageList);
        return mapping.findForward(FORWARD_SIMPLE_MATERIALS_LIST);    
    }
    
    public ActionForward initMaterials(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        return mapping.findForward(FORWARD_SIMPLE__MATERIALS_EDIT);    
    }
    
    public ActionForward saveMaterials(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        SimpleMaterialsForm mForm =(SimpleMaterialsForm)form;
        SimpleMaterials materials = (SimpleMaterials)formToModel(mForm, modelClass);
        materials.setStatus(Constants.GLOBAL_STATUS_VALID);
        
        if(StringHelper.isHasContent(mForm.getId())){
            materials = serviceFacade.updateSimpleMaterials(materials);
        }
        else{
            serviceFacade.addSimpleMaterials(materials);
        }
        
        mForm = (SimpleMaterialsForm)modelToForm(materials, formClass);
        request.setAttribute("SimpleMaterialsForm",mForm);

        return mapping.findForward(FORWARD_SIMPLE__MATERIALS_EDIT);    
    }
    
    public ActionForward deleteSimpleMaterials(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String [] ids = request.getParameterValues("itemIdCheckBox");
        if(ids != null && ids.length >0){
            for(int i=0;i<ids.length;i++){
                SimpleMaterials materials = serviceFacade.getSimpleMaterialsById(ids[i]);
                materials.setStatus(Constants.GLOBAL_STATUS_INVALID);
                serviceFacade.updateSimpleMaterials(materials);
            }
        }
        return mapping.findForward(FORWARD_SIMPLE__MATERIALS_DEL);    
    }
    
    public ActionForward showMaterials(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        SimpleMaterialsForm mForm =(SimpleMaterialsForm)form;
        SimpleMaterials materials = serviceFacade.getSimpleMaterialsById(mForm.getId());
        mForm = (SimpleMaterialsForm)modelToForm(materials, formClass);
        request.setAttribute("SimpleMaterialsForm",mForm);
        return mapping.findForward(FORWARD_SIMPLE__MATERIALS_EDIT);    
    }

    public IGxUnionServiceFacade getServiceFacade() {
        return serviceFacade;
    }

    public void setServiceFacade(IGxUnionServiceFacade serviceFacade) {
        this.serviceFacade = serviceFacade;
    }
}
