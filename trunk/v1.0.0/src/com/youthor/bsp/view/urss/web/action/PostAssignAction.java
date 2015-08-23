/**
 * 
 */
package com.youthor.bsp.view.urss.web.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.helper.TagHtmlHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.common.Constants;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.core.urss.model.Post;
import com.youthor.bsp.core.urss.model.PostAssign;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.urss.helper.WebHelper;
import com.youthor.bsp.view.urss.web.form.PostForm;


public class PostAssignAction extends BaseStrutsAction{
    
    

      private static final String Forward_OrgTree = "orgTree";
      private static final String FORWARD_PostAssignEdit = "postAssignEdit";
      private static final String FORWARD_PostOrgEdit = "postOrgEdit";
      private static final String FORWARD_DelToList = "delToList";
      private static final String CONTENT_TYPE = "text/xml;charset=UTF-8";
      private static final String ActionFormClass = PostForm.class.getName();
      private static final String modelClass = Post.class.getName();
      
    private IUrssServiceFacade urssServiceFacade;
    public void setUrssServiceFacade(IUrssServiceFacade urssServiceFacade) {
        this.urssServiceFacade = urssServiceFacade;
    }
    
    public ActionForward postAssignForward(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        Org orgTreeRoot=urssServiceFacade.getTreeRootOrg(WebHelper.getCurrComId(request.getSession()));
        request.setAttribute("orgTreeRoot",orgTreeRoot);
        return mapping.findForward(Forward_OrgTree);
    }
    
    
    public ActionForward postAssignOrgTree(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String urlBase=request.getContextPath();
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        StringBuffer sbXML=new StringBuffer();
        sbXML.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
        sbXML.append("\t<tree>\n");
        String orgParentId =  request.getParameter("orgParentId");
        List orgList=urssServiceFacade.getOrgListByParent(orgParentId);
        if(orgList!=null&&orgList.size()>0)
        {
            for(int i=0;i<orgList.size();i++)
            {
                Org orgTreePo=(Org)orgList.get(i);
                if(orgTreePo.getOrgTypeCode().equals(Constants.GLOBAL_ORG_YG)) continue;
                String action = "javascript:doChangeMain('"+orgTreePo.getOrgId()+"' ,'"+orgTreePo.getParentId()+"','"+orgTreePo.getOrgTypeCode()+"')";
                
                
                String icon = urlBase+"/bsp/abdf/skins/default/img/xloadtree/folder.png";
                 String openIcon = urlBase+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png";
                 String src=urlBase+"/postAssignOrgTree_urss.do?orgParentId="+orgTreePo.getOrgId();
                 sbXML.append(TagHtmlHelper.makeItemXML(orgTreePo.getOrgName(), action, src, icon, openIcon));
                
            }
        }
        
        sbXML.append("\t</tree>\n");
        out.print(sbXML.toString());
        return null;    
    }
    
    
    
    public ActionForward showPostAssign(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String orgId=request.getParameter("orgId");
        Org org=urssServiceFacade.getOrgById(orgId);
        request.setAttribute("org",org);
        List postAssignList=urssServiceFacade.getPostAssignsByOrgId(orgId);
        request.setAttribute("postAssignList",postAssignList);
        //根据orgId得到岗位信息
        return mapping.findForward(FORWARD_PostAssignEdit);
    }
    
    public ActionForward savePostAssign(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String orgId=request.getParameter("orgId");
        String allPostId=request.getParameter("allPostId");
        Org org=urssServiceFacade.getOrgById(orgId);
        request.setAttribute("org",org);
        urssServiceFacade.savePostAssign(orgId,allPostId);
        List postAssignList=urssServiceFacade.getPostAssignsByOrgId(orgId);
        request.setAttribute("postAssignList",postAssignList);
        return mapping.findForward(FORWARD_PostAssignEdit);
    }

    public ActionForward deletePostAssign(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String orgId=request.getParameter("orgId");
        Org org=urssServiceFacade.getOrgById(orgId);
        request.setAttribute("org",org);
        String [] assignIds=request.getParameterValues("itemIdCheckBox");
        urssServiceFacade.deletePostAssignByIds(assignIds);
        List postAssignList=urssServiceFacade.getPostAssignsByOrgId(orgId);
        request.setAttribute("postAssignList",postAssignList);
        return mapping.findForward(FORWARD_PostAssignEdit);
    }
    
    public ActionForward showPostOrg(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String orgId=request.getParameter("orgId");
        Org org=urssServiceFacade.getOrgById(orgId);
        request.setAttribute("org",org);
        String assignId=request.getParameter("assignId");
        PostAssign postAssign=urssServiceFacade.getpostAssignWithOrgsById(assignId);
        request.setAttribute("postAssign",postAssign);
        //根据orgId得到岗位信息
        return mapping.findForward(FORWARD_PostOrgEdit);
    }
    
    
    
    
}
