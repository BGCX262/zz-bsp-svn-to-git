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


import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.model.DictTree;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.web.form.DictTreeForm;




public class DictTreeAction extends BaseStrutsAction{
    
    private IAbdfServiceFacade abdfServiceFacade;
    
    
      private static final String FORWARD_dictTreeList = "dictTreeList";
      private static final String FORWARD_dictTreeEdit = "dictTreeEdit";
      private static final String FORWARD_DelToList = "delToList";
      
      private static final String ActionFormClass =DictTreeForm.class.getName();
      private static final String modelClass =DictTree.class.getName();
      


    public void setItsmServiceFacade(IAbdfServiceFacade abdfServiceFacade) {
        this.abdfServiceFacade = abdfServiceFacade;
    }

    public ActionForward getTopDictTreeByType(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String treeType=request.getParameter("treeType");
         DictTree dictTreeRoot=abdfServiceFacade.getDictTreeRoot(treeType);
           request.setAttribute("dictTreeRoot",dictTreeRoot);
        List pageList=abdfServiceFacade.getTopDictTreeByType(treeType);
        request.setAttribute("pageList",pageList);
        return mapping.findForward(FORWARD_dictTreeList);    
    }
    
    public ActionForward initDictTree(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        DictTreeForm dictTreeForm=(DictTreeForm)form;
       String parentId=request.getParameter("parentId");

       
       if(parentId!=null&&!parentId.equals(""))
       {
           DictTree dictTree=abdfServiceFacade.getDictTreeById(parentId);
           String allParentId=dictTree.getAllParentId();
           if(allParentId!=null&&!allParentId.equals(""))
               allParentId=allParentId+":"+dictTree.getTreeId();
           else
           {
               allParentId=dictTree.getTreeId();
           }
           String allParentName=dictTree.getAllParentName();
           
           if(allParentName!=null&&!allParentName.equals(""))
               allParentName=allParentName+":"+dictTree.getTreeName();
           else
           {
               allParentName=dictTree.getTreeName();
           }
          
           dictTreeForm.setAllParentId(allParentId);
           dictTreeForm.setAllParentName(allParentName);
         
       }
       DictTree dictTreeRoot=abdfServiceFacade.getDictTreeRoot(dictTreeForm.getTreeType());
       request.setAttribute("dictTreeRoot",dictTreeRoot);
        return mapping.findForward(FORWARD_dictTreeEdit);    
    }
    
    public ActionForward deleteDictTree(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        DictTreeForm dictTreeForm=(DictTreeForm)form;
        
        String [] dictTreeIds=request.getParameterValues("itemIdCheckBox");
        boolean delete=abdfServiceFacade.deleteDictTreeByIds(dictTreeIds); 
        if(dictTreeForm.getTreeId()!=null)
        {
            List subdictTreeList=abdfServiceFacade.getSubDictTreeByParentId(dictTreeForm.getTreeId());
            request.setAttribute("subDictTreeList",subdictTreeList);
            request.setAttribute("reloadTree","true");
            DictTree dictTreeRoot=abdfServiceFacade.getDictTreeRoot(dictTreeForm.getTreeType());
            request.setAttribute("dictTreeRoot",dictTreeRoot);
            return mapping.findForward(FORWARD_dictTreeEdit);
        }
        else
        {
        
            String treeType=request.getParameter("treeType");
            List pageList=abdfServiceFacade.getTopDictTreeByType(treeType);
            request.setAttribute("pageList",pageList);
             request.setAttribute("reloadTree","true");
             DictTree dictTreeRoot=abdfServiceFacade.getDictTreeRoot(dictTreeForm.getTreeType());
                request.setAttribute("dictTreeRoot",dictTreeRoot);
            return mapping.findForward(FORWARD_DelToList);
        }
    }
    
    public ActionForward showDictTree(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        DictTreeForm dictTreeForm=(DictTreeForm)form;
        DictTree dictTree=abdfServiceFacade.getDictTreeById(dictTreeForm.getTreeId());
        dictTreeForm=(DictTreeForm)this.modelToForm(dictTree,ActionFormClass);
        request.setAttribute("DictTreeForm",dictTreeForm);
        List subDictTreeList=abdfServiceFacade.getAllSubDictTreeByParentId(dictTree.getTreeId());
        request.setAttribute("subDictTreeList",subDictTreeList);
        DictTree dictTreeRoot=abdfServiceFacade.getDictTreeRoot(dictTreeForm.getTreeType());
        request.setAttribute("dictTreeRoot",dictTreeRoot);
        return mapping.findForward(FORWARD_dictTreeEdit);    
    }
    
    public ActionForward moveDictTree(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        DictTreeForm dictTreeForm=(DictTreeForm)form;
        
        String moveToDataId=request.getParameter("moveToDataId");
        String upAndDown=request.getParameter("upAndDown");
        DictTree target=abdfServiceFacade.getDictTreeById(moveToDataId);
        String [] sources=request.getParameterValues("itemIdCheckBox");
        if(upAndDown.equals("down"))
        {
            for(int i=0;i<sources.length;i++)
            {
                DictTree source =abdfServiceFacade.getDictTreeById(sources[i]);
                source.setParentId(target.getTreeId());
                if(StringHelper.doWithNull(target.getAllParentId()).equals(""))
                {
                    source.setAllParentId(target.getTreeId());
                    source.setAllParentName(target.getTreeName());
                }
                else
                {
                    source.setAllParentId(target.getAllParentId()+":"+target.getTreeId());
                    source.setAllParentName(target.getAllParentName()+":"+target.getTreeName());
                }
                abdfServiceFacade.updateMoveDictTree(source);
            }
        }
        else
        {
            for(int i=0;i<sources.length;i++)
            {
                DictTree source =abdfServiceFacade.getDictTreeById(sources[i]);
                source.setParentId(StringHelper.doWithNull(target.getParentId()));
                source.setAllParentId(target.getAllParentId());
                source.setAllParentName(target.getAllParentName());
                abdfServiceFacade.updateMoveDictTree(source);
            }
        }
        if(dictTreeForm!=null&&dictTreeForm.getTreeId()!=null&&!dictTreeForm.getTreeId().equals(""))
        {
            request.setAttribute("dictTreeForm",dictTreeForm);
            List subDictTreeList=abdfServiceFacade.getSubDictTreeByParentId(dictTreeForm.getTreeId());
            request.setAttribute("subDictTreeList",subDictTreeList);
            request.setAttribute("reloadTree","true");
            DictTree dictTreeRoot=abdfServiceFacade.getDictTreeRoot(dictTreeForm.getTreeType());
            request.setAttribute("dictTreeRoot",dictTreeRoot);
            
            return mapping.findForward(FORWARD_dictTreeEdit);
        }
        else
        {
            
            String treeType=request.getParameter("treeType");
            List pageList=abdfServiceFacade.getTopDictTreeByType(treeType);
            request.setAttribute("pageList",pageList);
            request.setAttribute("reloadTree","true");
            DictTree dictTreeRoot=abdfServiceFacade.getDictTreeRoot(dictTreeForm.getTreeType());
            request.setAttribute("dictTreeRoot",dictTreeRoot);
            return mapping.findForward(FORWARD_DelToList);
        }    
    }
    
    
    
    
    public ActionForward saveDictTree(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        DictTreeForm dictTreeForm=(DictTreeForm)form;
        DictTree dictTree=(DictTree)this.formToModel(dictTreeForm,modelClass);
        if(StringHelper.doWithNull(dictTree.getTreeId()).equals(""))
        {

            abdfServiceFacade.addDictTree(dictTree);
            dictTreeForm.setTreeId(dictTree.getTreeId());
            request.setAttribute("reloadTree","true");
        }
        else
        {
            String dictTreeNameOld=request.getParameter("dictTreeNameOld");
            if(!dictTreeNameOld.trim().equals(dictTreeForm.getTreeName().trim()))
            {
                request.setAttribute("reloadTree","true");
            }
            
            String orderShowOld=request.getParameter("orderShowOld");
            if(Float.parseFloat(orderShowOld)!=dictTreeForm.getOrderShow())
            {
                request.setAttribute("reloadTree","true");
            }
            
            
            List subdictTreeList=abdfServiceFacade.getSubDictTreeByParentId(dictTree.getTreeId());
            request.setAttribute("subdictTreeList",subdictTreeList);
            
            abdfServiceFacade.updateDictTree(dictTree);
        }
        DictTree dictTreeRoot=abdfServiceFacade.getDictTreeRoot(dictTreeForm.getTreeType());
        request.setAttribute("dictTreeRoot",dictTreeRoot);
        return mapping.findForward(FORWARD_dictTreeEdit);    
    }

    public void setAbdfServiceFacade(IAbdfServiceFacade abdfServiceFacade) {
        this.abdfServiceFacade = abdfServiceFacade;
    }
          

}
