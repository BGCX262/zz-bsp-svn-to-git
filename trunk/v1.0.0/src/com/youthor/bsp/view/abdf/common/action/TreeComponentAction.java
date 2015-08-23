package com.youthor.bsp.view.abdf.common.action;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.form.TreeForm;


import com.youthor.bsp.core.abdf.common.AbdfCache;

import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.model.Tree;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.abdf.model.DictTreeType;

import com.youthor.bsp.core.facade.IAbdfServiceFacade;
public class TreeComponentAction extends BaseStrutsAction{
    private static final String CONTENT_TYPE = "text/xml;charset=UTF-8";
     private static final String FORWARD_treeList = "treeList";
     private static final String FORWARD_treeEdit = "treeEdit";
    private IAbdfServiceFacade abdfServiceFacade;
    
    public void setAbdfServiceFacade(IAbdfServiceFacade abdfServiceFacade) {
        this.abdfServiceFacade = abdfServiceFacade;
    }

    public ActionForward listTopNodeObjectByType(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
         String treeType=request.getParameter("treeType");
         String reloadTree = request.getParameter("reloadTree");
         if (!StringHelper.doWithNull(reloadTree).equals("")) {
             request.setAttribute("reloadTree","true" );
         }
         DictTreeType dictTreeType=(DictTreeType)AbdfCache.mapTreeDictType.get(treeType);
         if(dictTreeType==null)
         {
           dictTreeType=abdfServiceFacade.getDictTreeTypeByCode(treeType);
           AbdfCache.mapTreeDictType.put(treeType,dictTreeType);
         }
         Page page=(Page)request.getAttribute(Page.PAGE_INFO);
         List listTopNodeObject=abdfServiceFacade.listTopNodeObjectByType(page,dictTreeType);
         request.setAttribute("dictTreeType",dictTreeType);
         request.setAttribute("pageList",listTopNodeObject);
         return mapping.findForward(FORWARD_treeList);        
    }
    
    public ActionForward initTreeNodeObject(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
         String treeType=request.getParameter("treeType");
         TreeForm treeForm = (TreeForm)form;
         DictTreeType dictTreeType=(DictTreeType)AbdfCache.mapTreeDictType.get(treeType);
         request.setAttribute("dictTreeType",dictTreeType); 
         String parentId=request.getParameter("parentId");
         if(parentId!=null&&!parentId.equals(""))
           {
             Object modelObject=abdfServiceFacade.getTreeNodeById(dictTreeType.getModelClass(),parentId);
             Tree tree = (Tree)modelObject;
             String allParentId=tree.getAllParentId();
               if(allParentId!=null&&!allParentId.equals(""))
                   allParentId=allParentId+":"+tree.getId();
               else
               {
                   allParentId=tree.getId();
               }
               String allParentName=tree.getAllParentName();
               
               if(allParentName!=null&&!allParentName.equals(""))
                   allParentName=allParentName+":"+tree.getName();
               else
               {
                   allParentName=tree.getName();
               }
              
               treeForm.setAllParentId(allParentId);
               treeForm.setAllParentName(allParentName);
             
           }
         return mapping.findForward(FORWARD_treeEdit);        
    }
    
    
    public ActionForward saveTreeNodeObject(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
         String treeType=request.getParameter("treeTypeCode");
         TreeForm treeForm = (TreeForm)form;
         String id = treeForm.getId();
         DictTreeType dictTreeType=(DictTreeType)AbdfCache.mapTreeDictType.get(treeType);
         request.setAttribute("dictTreeType",dictTreeType);
         Object modelObject = this.formToModel(treeForm,dictTreeType.getModelClass());
         if (id == null || id.equals("")) {
             
             id = abdfServiceFacade.addTreeObject(modelObject);
             treeForm.setId(id);
             request.setAttribute("reloadTree","true");
            
         }
         else {
             String nameOld=request.getParameter("nameOld");
             if (nameOld == null) nameOld="";
             if(!nameOld.trim().equals(treeForm.getName().trim())) {
                    request.setAttribute("reloadTree","true");
                }
             String orderIndexOld=request.getParameter("orderIndexOld");
             if (orderIndexOld == null) orderIndexOld="0";
             if(Float.parseFloat(orderIndexOld) != treeForm.getOrderIndex()) {
                 request.setAttribute("reloadTree","true");
             }
             
             id = abdfServiceFacade.updateTreeObject(modelObject);
             List subTreeNodes = abdfServiceFacade.getSubTreeNodesByParentId(dictTreeType.getModelClass(),id);
             request.setAttribute("subTreeNodes", subTreeNodes);
         }
         return mapping.findForward(FORWARD_treeEdit);        
    }
    
    public ActionForward showTreeNodeObject(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
         String id=request.getParameter("id");
         String treeType=request.getParameter("treeTypeCode");
         DictTreeType dictTreeType=(DictTreeType)AbdfCache.mapTreeDictType.get(treeType);
         request.setAttribute("dictTreeType",dictTreeType);
         Object modelObject=abdfServiceFacade.getTreeNodeById(dictTreeType.getModelClass(),id);
         TreeForm treeForm = (TreeForm)this.modelToForm(modelObject, TreeForm.class.getName());
         request.setAttribute("TreeForm", treeForm);
         List subTreeNodes = abdfServiceFacade.getSubTreeNodesByParentId(dictTreeType.getModelClass(),id);
         request.setAttribute("subTreeNodes", subTreeNodes);
         String reloadTree = request.getParameter("reloadTree");
         if (!StringHelper.doWithNull(reloadTree).equals("")) {
             request.setAttribute("reloadTree","true" );
         }
         return mapping.findForward(FORWARD_treeEdit);        
    }
    
    
    public ActionForward deleteTreeNodeObject(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String [] ids=request.getParameterValues("itemIdCheckBox");
        String treeType=request.getParameter("treeTypeCode");
        DictTreeType dictTreeType=(DictTreeType)AbdfCache.mapTreeDictType.get(treeType);
        if (ids!=null && ids.length>0) {
            for(int i=0;i<ids.length ;i++) {
                String id = ids[i];
                abdfServiceFacade.deleteTreeNodeObject(dictTreeType,id);
            }
        }
        TreeForm treeForm  =(TreeForm)form;
        if (treeForm.getId() ==null || treeForm.getId().equals("")) {
            response.sendRedirect(request.getContextPath()+"/listTopNodeObjectByType_abdf.do?treeType="+dictTreeType.getTreeTypeCode()+"&reloadTree=true");
        }
        else {
            response.sendRedirect(request.getContextPath()+"/showTreeNodeObject_abdf.do?id="+treeForm.getId()+"&reloadTree=true&treeTypeCode="+dictTreeType.getTreeTypeCode());
        }
        return null;
             
    }
    
    
    
    public ActionForward moveTreeNode(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        
        String moveToDataId=request.getParameter("moveToDataId");
        String upAndDown=request.getParameter("upAndDown");
        String treeType=request.getParameter("treeTypeCode");
        
        DictTreeType dictTreeType=(DictTreeType)AbdfCache.mapTreeDictType.get(treeType);
        request.setAttribute("dictTreeType",dictTreeType);
        Object modelObject=abdfServiceFacade.getTreeNodeById(dictTreeType.getModelClass(),moveToDataId);
        Tree target = (Tree)modelObject;
         
        String [] sources=request.getParameterValues("itemIdCheckBox");
        if(upAndDown.equals("down"))
        {
            for(int i=0;i<sources.length;i++)
            {
                Object source =abdfServiceFacade.getTreeNodeById(dictTreeType.getModelClass(),sources[i]);
                BeanUtils.setProperty(source, "parentId", target.getId());
            
                if(StringHelper.doWithNull(target.getAllParentId()).equals(""))
                {
                    
                    BeanUtils.setProperty(source, "allParentId", target.getId());
                    BeanUtils.setProperty(source, "allParentName", target.getName());
                    
                }
                else
                {
                    BeanUtils.setProperty(source, "allParentId", target.getAllParentId()+":"+target.getId());
                    BeanUtils.setProperty(source, "allParentName", target.getAllParentName()+":"+target.getName());
                }
                abdfServiceFacade.updateMoveTreeNodeObject(dictTreeType.getModelClass(),source);
            }
        }
        else
        {
            for(int i=0;i<sources.length;i++)
            {
                Object source =abdfServiceFacade.getTreeNodeById(dictTreeType.getModelClass(),sources[i]);
                BeanUtils.setProperty(source, "parentId", target.getParentId());
                BeanUtils.setProperty(source, "allParentId", target.getAllParentId());
                BeanUtils.setProperty(source, "allParentName", target.getAllParentName());
                
                abdfServiceFacade.updateMoveTreeNodeObject(dictTreeType.getModelClass(),source);
            }
        }
        
        TreeForm treeForm  =(TreeForm)form;
        if (treeForm.getId() ==null || treeForm.getId().equals("")) {
            response.sendRedirect(request.getContextPath()+"/listTopNodeObjectByType_abdf.do?treeType="+dictTreeType.getTreeTypeCode()+"&reloadTree=true");
        }
        else {
            response.sendRedirect(request.getContextPath()+"/showTreeNodeObject_abdf.do?id="+treeForm.getId()+"&reloadTree=true");
        }
          return null;
    }
    

}
