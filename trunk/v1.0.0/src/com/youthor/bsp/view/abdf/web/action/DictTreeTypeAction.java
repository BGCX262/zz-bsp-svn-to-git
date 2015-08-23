/**
 * 
 */
package com.youthor.bsp.view.abdf.web.action;

import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.model.DictTreeType;
import com.youthor.bsp.core.abdf.model.FormLayout;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.helper.BuildListFormPage;
import com.youthor.bsp.view.abdf.web.form.DictTypeTreeForm;




public class DictTreeTypeAction extends BaseStrutsAction{
    
    private IAbdfServiceFacade abdfServiceFacade;
    
    private static final String CONTENT_TYPE = "text/xml;charset=UTF-8";
      private static final String FORWARD_dictTypeTreeList = "dictTypeTreeList";
      private static final String FORWARD_dictTypeTreeEdit = "dictTypeTreeEdit";
      private static final String FORWARD_DelToList = "delToList";
      
      private static final String ActionFormClass =DictTypeTreeForm.class.getName();
      private static final String modelClass =DictTreeType.class.getName();
      


    public void setItsmServiceFacade(IAbdfServiceFacade abdfServiceFacade) {
        this.abdfServiceFacade = abdfServiceFacade;
    }
    
   public ActionForward listDictTypeTree(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        List listDictTypeTree=abdfServiceFacade.getAlltDictTypeTree();
        request.setAttribute("listDictTypeTree",listDictTypeTree);
        return mapping.findForward(FORWARD_dictTypeTreeList);    
    }

    
    public ActionForward initDictTypeTree(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        DictTypeTreeForm dictTypeTreeForm=(DictTypeTreeForm)form;
        dictTypeTreeForm.setDelMode("logicDel");
        dictTypeTreeForm.setTreeStyle("sync");
        return mapping.findForward(FORWARD_dictTypeTreeEdit);    
    }
    

    
    public ActionForward showDictTypeTree(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        DictTypeTreeForm dictTypeTreeForm=(DictTypeTreeForm)form;
        String treeTypeId=dictTypeTreeForm.getTreeTypeId();
        DictTreeType dictTreeType=abdfServiceFacade.getDictTreeTypeById(treeTypeId);
        List formLayoutList=abdfServiceFacade.getFormLayoutListByParentId(treeTypeId);
        request.setAttribute("subProperty",formLayoutList);
        dictTypeTreeForm=(DictTypeTreeForm)this.modelToForm(dictTreeType,ActionFormClass);
        request.setAttribute("DictTypeTreeForm",dictTypeTreeForm);
        return mapping.findForward(FORWARD_dictTypeTreeEdit);    
    }
    
    
    
    
    
    public ActionForward saveDictTypeTree(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        DictTypeTreeForm dictTypeTreeForm=(DictTypeTreeForm)form;
        DictTreeType dictTreeType=(DictTreeType)this.formToModel(dictTypeTreeForm,modelClass);
        List subProperty=BuildListFormPage.buildSimpleList(FormLayout.class,request);
        dictTreeType.setSubPropertyList(subProperty);
        if(StringHelper.doWithNull(dictTreeType.getTreeTypeId()).equals(""))
        {
            String id=abdfServiceFacade.addDictTreeType(dictTreeType);
            dictTypeTreeForm.setTreeTypeId(id);
        }
        else
        {
            String id=abdfServiceFacade.updateDictTreeType(dictTreeType);
        }
        request.setAttribute("subProperty",subProperty);
        return mapping.findForward(FORWARD_dictTypeTreeEdit);    
    }

    public void setAbdfServiceFacade(IAbdfServiceFacade abdfServiceFacade) {
        this.abdfServiceFacade = abdfServiceFacade;
    }
    
    
    public ActionForward getExeProperty(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String className=request.getParameter("modelClass");
        String urlBase=request.getContextPath();
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        StringBuffer sbXML=new StringBuffer();
        sbXML.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
        sbXML.append("\t<rows>\n");
        Class classDTO = DictTreeTypeAction.class.getClassLoader().loadClass(
                className);
        Object objectDTO = classDTO.newInstance(); //创建DTO实例
        Field[] fields = objectDTO.getClass().getDeclaredFields(); //得到所有属性
        String treeFixedPropertys=Constants.TREE_FIXED_PROPERTYS;
        String [] treeFixedPropertyArr=StringHelper.split(treeFixedPropertys,",");
        for(int i=0;i<fields.length;i++)
        {
            Field field=(Field)fields[i];
            boolean isAdd=true;
            System.out.println("field.getName()==="+field.getName());
            
            for(int j=0;j<treeFixedPropertyArr.length;j++)
            {
                if(field.getName().equalsIgnoreCase(treeFixedPropertyArr[j]))
                {
                    isAdd=false;
                    break;
                }
            }
            if(isAdd)
               sbXML.append("\t<row property='"+field.getName()+"' dataType='"+field.getType().getName()+"'/>\n");
        }
        sbXML.append("\t</rows>\n");
        out.print(sbXML.toString());
        return null;    
    }


          

}
