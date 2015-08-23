package com.youthor.bsp.view.abdf.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.abdf.model.Dict;
import com.youthor.bsp.core.abdf.model.DictType;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;
import com.youthor.bsp.view.abdf.web.form.DictForm;
import com.youthor.bsp.view.abdf.web.form.DictTypeForm;

public class DictAction extends BaseStrutsAction{
    private IAbdfServiceFacade abdfServiceFacade;
    
    
      private static final String FORWARD_DictList = "dictList";
      private static final String FORWARD_DictEdit = "dictEdit";
      private static final String FORWARD_DelToList = "delToList";
      
      private static final String ActionFormClass =DictForm.class.getName();
      private static final String modelClass =Dict.class.getName();
      
    
    public void setAbdfServiceFacade(IAbdfServiceFacade abdfServiceFacade) {
        this.abdfServiceFacade = abdfServiceFacade;
    }    
    
    
    public ActionForward listDict(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        Page page=(Page)request.getAttribute(Page.PAGE_INFO);
        String gsId=WebHelper.getTopOrgId(request.getSession(),Constants.GLOBAL_GS);
        String dictTypeCode=request.getParameter("dictTypeCode");
        if(dictTypeCode==null)
            return null;
        DictType dictType=abdfServiceFacade.getDictTyeByComIdCode(gsId,dictTypeCode);
        if(dictType==null)
            return null;
        request.setAttribute("dictTypeName",dictType.getDictTypeName());
        request.setAttribute("dictTypeId",dictType.getDictTypeId());
        request.setAttribute("dictTypeCode",dictTypeCode);
        
        List dictList=abdfServiceFacade.listDictByDictTypeId(page,dictType.getDictTypeId());
        request.setAttribute("pageDate",dictList);
        return mapping.findForward(FORWARD_DictList);    
    }
    
    public ActionForward initDict(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String dictTypeId=request.getParameter("dictTypeId");
        DictType dictType=abdfServiceFacade.getDictTypeById(dictTypeId);
        request.setAttribute("dictType",dictType);
        DictForm dictForm=(DictForm)form;
        dictForm.setDictTypeId(dictType.getDictTypeId());
        dictForm.setIsUse("Y");
        return mapping.findForward(FORWARD_DictEdit);    
    }
    
    public ActionForward saveDict(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        DictForm dictForm=(DictForm)form;
        Dict dict =(Dict)this.formToModel(dictForm,modelClass);
        if(StringHelper.doWithNull(dict.getDictId()).equals(""))
        {
            String dictId=abdfServiceFacade.addDict(dict);
            dictForm.setDictId(dictId);
        }
        else
        {
            abdfServiceFacade.updateDict(dict);
        }
        String dictTypeId=request.getParameter("dictTypeId");
        DictType dictType=abdfServiceFacade.getDictTypeById(dictTypeId);
        request.setAttribute("dictType",dictType);
        return mapping.findForward(FORWARD_DictEdit);    
    }
    
    
    public ActionForward showDict(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        DictForm dictForm=(DictForm)form;
        String dictId=dictForm.getDictId();
        Dict dict=abdfServiceFacade.getDictById(dictId);
        String dictTypeId=dict.getDictTypeId();
        DictType dictType=abdfServiceFacade.getDictTypeById(dictTypeId);
        request.setAttribute("dictType",dictType);
        dictForm=(DictForm)this.modelToForm(dict,ActionFormClass);
        request.setAttribute("DictForm",dictForm);
        return mapping.findForward(FORWARD_DictEdit);    
    }
    
    public ActionForward deleteDict(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        return mapping.findForward(FORWARD_DictEdit);    
    }
    
    
}
