package com.youthor.bsp.view.urss.web.action;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.AbdfCache;
import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.ConfigInfoHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.App;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.core.urss.model.Role;
import com.youthor.bsp.core.urss.model.RoleOrg;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;
import com.youthor.bsp.view.urss.web.form.RoleForm;

public class RoleAction extends BaseStrutsAction{
    
    private IUrssServiceFacade urssServiceFacade;
    
    
      private static final String FORWARD_RoleList = "roleList";
      private static final String FORWARD_RoleEdit = "roleEdit";
      private static final String FORWARD_DelToList = "delToList";
      private static final String FORWARD_RoleOrgList = "roleOrgList";
      private static final String FORWARD_RoleOrgAddToList = "roleOrgAddToList";
      private static final String FORWARD_RoleOrgDelToList = "roleOrgDelToList";
      private static final String FORWARD_QueryRoleOrg = "queryRoleOrg";
      private static final String FORWARD_AddRoleOrgQuery = "addRoleOrgQuery";
      private static final String FORWARD_DeleteRoleOrgQuery = "deleteRoleOrgQuery";
      
      private static final String ActionFormClass =RoleForm.class.getName();
      private static final String modelClass = Role.class.getName();
      
    public void setUrssServiceFacade(IUrssServiceFacade urssServiceFacade) {
        this.urssServiceFacade = urssServiceFacade;
    }

    public ActionForward getTopRoleByAppIdAndComId(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        //得到公司id
        HttpSession session=request.getSession();
        String comId=WebHelper.getTopOrgId(session, Constants.GLOBAL_GS);
        
        String appId=request.getParameter("appId");
        if(appId == null || appId.equals("")) {
            App appG = AbdfCache.app;
            appId = appG.getAppId();
        }
        //得到应用
        App app=urssServiceFacade.getAppById(appId);
        //得到公司下些应用顶层角色(目前只支持一层)
        List pageList=urssServiceFacade.getRoleByAppIdAndComId(appId,comId);
        request.setAttribute("pageList",pageList);
        request.setAttribute("app",app);
        String reloadTree = request.getParameter("reloadTree");
        request.setAttribute("reloadTree", reloadTree);
        return mapping.findForward(FORWARD_RoleList);    
    }
    
    public ActionForward initRole(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        RoleForm roleForm=(RoleForm)form;
        HttpSession session=request.getSession();
        String comId=WebHelper.getTopOrgId(session, Constants.GLOBAL_GS);
        roleForm.setComId(comId);
        roleForm.setRoleName("");
        roleForm.setRoleId("");
        roleForm.setSystemIn("N");
        return mapping.findForward(FORWARD_RoleEdit);    
    }
    
    public ActionForward deleteRole(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        RoleForm roleForm=(RoleForm)form;
        
        String [] roleIds=request.getParameterValues("itemIdCheckBox");
        if (roleIds!=null && roleIds.length>0) {
            for(int i=0;i<roleIds.length;i++) {
                urssServiceFacade.deleteRoleById(roleIds[i]);
            }
         }
            HttpSession session=request.getSession();
            String comId=WebHelper.getTopOrgId(session, Constants.GLOBAL_GS);
            String appId=request.getParameter("appId");
            if(appId == null || appId.equals("")) {
                App appG = AbdfCache.app;
                appId = appG.getAppId();
            }
            
             response.sendRedirect(request.getContextPath()+"/getTopRoleByAppIdAndComId_urss.do?appId="+appId+"&reloadTree=true");
            return null;		
           

    }
    
    public ActionForward showRole(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        RoleForm roleForm=(RoleForm)form;
        Role role=urssServiceFacade.getRoleById(roleForm.getRoleId());
        roleForm=(RoleForm)this.modelToForm(role,ActionFormClass);
        request.setAttribute("RoleForm",roleForm);
       
        return mapping.findForward(FORWARD_RoleEdit);    
    }
    
 
    
    
    
    public ActionForward saveRole(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        RoleForm roleForm=(RoleForm)form;
        Role role=(Role)this.formToModel(roleForm,modelClass);
        if(StringHelper.doWithNull(role.getRoleId()).equals(""))
        {
            urssServiceFacade.addRole(role);
            roleForm.setRoleId(role.getRoleId());
        }
        else
        {
            urssServiceFacade.updateRole(role);
        }
        response.sendRedirect(request.getContextPath()+"/showRole_urss.do?roleId="+role.getRoleId()+"&reloadTree=true");
        return null;	
    }
    
    
    public ActionForward listRoleOrgByRoleId(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String roleId=request.getParameter("roleId");
        if(roleId==null||roleId.equals(""))
            roleId=(String)request.getAttribute("roleId");
        Role role=urssServiceFacade.getRoleById(roleId);
        Page page=(Page)request.getAttribute(Page.PAGE_INFO);
        List pageList=pageList=urssServiceFacade.listRoleOrgByRoleId(page,roleId);
        request.setAttribute("pageList",pageList);
        request.setAttribute("roleId",roleId);
        request.setAttribute("role",role);
        
        return mapping.findForward(FORWARD_RoleOrgList);    
    }
    
    public ActionForward saveRoleOrg(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String roleId=request.getParameter("roleId");
        
        String selectOrgId=request.getParameter("selectOrgId");
        String [] orgs=StringHelper.split(selectOrgId,",");
        List roleOrgList=new ArrayList();
        for(int i=0;i<orgs.length;i++)
        {
            RoleOrg roleOrg=new RoleOrg();
            Org org = WebHelper.getOrg(request.getSession());
            roleOrg.setCreateId(org.getOrgId());
            roleOrg.setCreateName(org.getOrgName());
            roleOrg.setCreateTime(new Date());
            roleOrg.setOrgId(orgs[i]);
            roleOrg.setRoleId(roleId);
            roleOrgList.add(roleOrg);
        }
        urssServiceFacade.addRoleOrg(roleOrgList);
        request.setAttribute("roleId",roleId);
        return mapping.findForward(FORWARD_RoleOrgAddToList);    
    }
    
    
    public ActionForward deleteRoleOrg(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String roleId=request.getParameter("roleId");
        String [] itemIdCheckBoxs=request.getParameterValues("itemIdCheckBox");
        boolean b=urssServiceFacade.deleteRoleOrg(itemIdCheckBoxs);
        request.setAttribute("roleId",roleId);
        return mapping.findForward(FORWARD_RoleOrgDelToList);    
    }
    
    public ActionForward queryRoleOrg(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String roleId=request.getParameter("roleId");
        String parentId=request.getParameter("parentId");
        HttpSession session=request.getSession();
        String comId = WebHelper.getTopOrgId(session, Constants.GLOBAL_GS);
        if(parentId==null||parentId.equals("")){
            parentId=comId;
        }
        
        String orgQueryCode=request.getParameter("orgQueryCode");
        if(orgQueryCode!=null&&!orgQueryCode.equals("")) orgQueryCode=orgQueryCode.toUpperCase();
        String orgName=request.getParameter("orgName");
        List noAddList=urssServiceFacade.getNoAddToRoleOrg(roleId,orgName,orgQueryCode,parentId);
        request.setAttribute("noAddList",noAddList);
        List addList=urssServiceFacade.getAddToRoleOrg(roleId,orgName,orgQueryCode,parentId);
        request.setAttribute("addList",addList);
        return mapping.findForward(FORWARD_QueryRoleOrg);    
    }
    
    
    public ActionForward addRoleOrgFormQuery(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String roleId=request.getParameter("roleId");
        String [] orgs=request.getParameterValues("notAddOrg");
        String [] allParentNames=request.getParameterValues("allParentNames");
        String [] orgNames=request.getParameterValues("orgNames");
        List roleOrgList=new ArrayList();
        for(int i=0;i<orgs.length;i++)
        {
            RoleOrg roleOrg=new RoleOrg();
            Org org = WebHelper.getOrg(request.getSession());
            roleOrg.setCreateId(org.getOrgId());
            roleOrg.setCreateName(org.getOrgName());
            roleOrg.setCreateTime(new Date());
            roleOrg.setOrgId(orgs[i]);
            roleOrg.setRoleId(roleId);
            roleOrg.setOrgName(orgNames[i]);
            roleOrg.setAllParentName(allParentNames[i]);
            roleOrgList.add(roleOrg);
            
        }
        urssServiceFacade.addRoleOrg(roleOrgList);
        request.setAttribute("addList",roleOrgList);
        request.setAttribute("roleId",roleId);
        return mapping.findForward(FORWARD_AddRoleOrgQuery);    
    }
    
    public ActionForward deleteRoleOrgFormQuery(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String roleId=request.getParameter("roleId");
        String [] roleOrgIds=request.getParameterValues("addOrg");
        String [] allParentNames_dels=request.getParameterValues("allParentNames_del");
        String [] orgNames_dels=request.getParameterValues("orgNames_del");
        String [] orgIds_dels=request.getParameterValues("orgIds_del");
        boolean b=urssServiceFacade.deleteRoleOrg(roleOrgIds);
        List orgList=new ArrayList();
        for(int i=0;i<orgIds_dels.length;i++)
        {
            Org org=new Org();
            org.setAllParentName(allParentNames_dels[i]);
            org.setOrgName(orgNames_dels[i]);
            org.setOrgId(orgIds_dels[i]);
            orgList.add(org);
        }
        request.setAttribute("noAddList",orgList);
        return mapping.findForward(FORWARD_DeleteRoleOrgQuery);    
    }
           
    

}
