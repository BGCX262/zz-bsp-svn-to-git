package com.youthor.bsp.view.abdf.web.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.youthor.bsp.core.abdf.model.Subassembly;
import com.youthor.bsp.core.abdf.model.SubassemblyField;
import com.youthor.bsp.core.abdf.model.codebuilder.Field;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.web.form.SubassemblyForm;

public class SubassemblyAction extends BaseStrutsAction{
    private IAbdfServiceFacade abdfServiceFacade;
    
    
      private static final String FORWARD_SubassemblyList = "subassemblyList";
      private static final String FORWARD_SubassemblyEdit1 = "subassemblyEdit1";
      private static final String FORWARD_SubassemblyEdit2 = "subassemblyEdit2";
      private static final String FORWARD_SubassemblyFrame = "subassemblyFrame";
      
      
      private static final String ActionFormClass =SubassemblyForm.class.getName();
      private static final String modelClass =Subassembly.class.getName();
      
    public ActionForward getAllSubassembly(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        List pageList=abdfServiceFacade.getAllSubassembly();
        request.setAttribute("pageList",pageList);
        return mapping.findForward(FORWARD_SubassemblyList);    
    }
           
    public ActionForward showSubassembly(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        SubassemblyForm subassemblyForm=(SubassemblyForm)form;
        String subassemblyId=subassemblyForm.getSubassemblyId();
        
        Subassembly subassembly=abdfServiceFacade.getSubassemblyById(subassemblyId);
        subassemblyForm=(SubassemblyForm)this.modelToForm(subassembly,ActionFormClass);
        request.setAttribute("SubassemblyForm",subassemblyForm);
        return mapping.findForward(FORWARD_SubassemblyEdit2);    
    }    
    
    
    public ActionForward initSubassembly(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        
        return mapping.findForward(FORWARD_SubassemblyEdit1);    
    }    
    
    
    
    
    
    public ActionForward saveSubassembly(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        SubassemblyForm subassemblyForm=(SubassemblyForm)form;
        String subassemblyId =request.getParameter("subassemblyId");
        if(subassemblyId==null||subassemblyId.equals(""))
        {
            //根据表名是到要初始化的字段
            String tableName=request.getParameter("tableName");
            Subassembly subassembly= new Subassembly();
            subassembly.setTableName(tableName);
            subassemblyForm.setTableName(tableName);
            List field=abdfServiceFacade.getDataTableField(tableName);
            List SubassemblyFieldList=new ArrayList();
            if(field!=null&&field.size()>0)
            {
                for(int i=0;i<field.size();i++)
                {
                    Field fieldItem=(Field)field.get(i);
                    SubassemblyField subassemblyField=new SubassemblyField();
                    subassemblyField.setDataFieldName(fieldItem.getFiledName());
                    subassemblyField.setWebInputName(fieldItem.getPropertyName());
                    SubassemblyFieldList.add(subassemblyField);
                }
            }
            subassembly.setSubassemblyFieldList(SubassemblyFieldList);
            subassemblyId=abdfServiceFacade.addSubassembly(subassembly);
            subassemblyForm.setSubassemblyId(subassemblyId);
            request.setAttribute("subassemblyId",subassemblyId);
            return mapping.findForward(FORWARD_SubassemblyFrame);
             
        }
        else
        {
            subassemblyForm=(SubassemblyForm)form;
            Subassembly subassembly=(Subassembly)this.formToModel(subassemblyForm,modelClass);
            abdfServiceFacade.updateSubassembly(subassembly);
            return mapping.findForward(FORWARD_SubassemblyFrame);
        }
        
        
    }
    
    

    public void setAbdfServiceFacade(IAbdfServiceFacade abdfServiceFacade) {
        this.abdfServiceFacade = abdfServiceFacade;
    }    
    
    
    

}
