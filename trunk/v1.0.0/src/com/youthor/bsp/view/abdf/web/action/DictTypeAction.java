package com.youthor.bsp.view.abdf.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.model.DictType;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;
import com.youthor.bsp.view.abdf.web.form.DictTypeForm;

public class DictTypeAction extends BaseStrutsAction{
    private IAbdfServiceFacade abdfServiceFacade;
    
    
      private static final String FORWARD_DictTypeList = "dictTypeList";
      private static final String FORWARD_DictTypeEdit = "dictTypeEdit";
      private static final String FORWARD_DelToList = "delToList";
      
      private static final String ActionFormClass =DictTypeForm.class.getName();
      private static final String modelClass =DictType.class.getName();
      
    public ActionForward getAllDictType(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        List pageList=abdfServiceFacade.getAllDictType();
        request.setAttribute("pageList",pageList);
        return mapping.findForward(FORWARD_DictTypeList);    
    }
           
    public ActionForward showDictType(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        DictTypeForm dictTypeForm=(DictTypeForm)form;
        String dictTypeId=dictTypeForm.getDictTypeId();
        if(dictTypeId==null||dictTypeId.equals(""))
        {
            System.out.println("转入全局错误页");
            return null;
        }
        DictType dictType=abdfServiceFacade.getDictTypeById(dictTypeId);
        dictTypeForm=(DictTypeForm)this.modelToForm(dictType,ActionFormClass);
        request.setAttribute("DictTypeForm",dictTypeForm);
        return mapping.findForward(FORWARD_DictTypeEdit);    
    }    
    
    
    public ActionForward initDictType(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        
        return mapping.findForward(FORWARD_DictTypeEdit);    
    }    
    
    public ActionForward deleteDictType(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String [] ids=request.getParameterValues("itemIdCheckBox");
        abdfServiceFacade.deleteDictTypeByIds(ids);
        request.setAttribute("treeRefresh","true");
        return mapping.findForward(FORWARD_DelToList);    
    }    
    
    
    
    public ActionForward saveDictType(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        DictTypeForm dictTypeForm=(DictTypeForm)form;
        
        //只要修改了树中的显示属性，就要刷新树
        String dictTypeCodeOri=StringHelper.doWithNull(request.getParameter("dictTypeCodeOri"));
        String dictTypeNameOri=StringHelper.doWithNull(request.getParameter("dictTypeNameOri"));
        String moduleNameOri=StringHelper.doWithNull(request.getParameter("moduleNameOri"));
        String treeRefresh="false";
        
        if(!StringHelper.doWithNull(dictTypeForm.getDictTypeCode()).equals(dictTypeCodeOri))
        {
            treeRefresh="true";
        }
        
        if(!StringHelper.doWithNull(dictTypeForm.getDictTypeName()).equals(dictTypeNameOri))
        {
            treeRefresh="true";
        }
        
        if(!StringHelper.doWithNull(dictTypeForm.getModuleName()).equals(moduleNameOri))
        {
            treeRefresh="true";
        }
        
        DictType dictType=(DictType)this.formToModel(dictTypeForm,modelClass);
        dictType.setComId(WebHelper.getTopOrgId(request.getSession(),Constants.GLOBAL_GS));
        String dictTypeId =dictType.getDictTypeId();
        if(dictTypeId==null||dictTypeId.equals(""))
        {
            abdfServiceFacade.addDictType(dictType);
        }
        else
        {
            abdfServiceFacade.updateDictType(dictType);
        }
        request.setAttribute("treeRefresh",treeRefresh);
        return mapping.findForward(FORWARD_DictTypeEdit);
    }
    
    public ActionForward getDictTypeBymoduleName(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String moduleName=request.getParameter("moduleName");
        List pageList=abdfServiceFacade.getDictTypeByModuleName(moduleName);
        request.setAttribute("pageList",pageList);
        request.setAttribute("moduleName",moduleName);
        return mapping.findForward(FORWARD_DictTypeList);
    }

    public void setAbdfServiceFacade(IAbdfServiceFacade abdfServiceFacade) {
        this.abdfServiceFacade = abdfServiceFacade;
    }    
    
    
    
    
}
