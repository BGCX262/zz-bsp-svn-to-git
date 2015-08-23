/**
 * 
 */
package com.youthor.bsp.view.urss.web.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.ConfigInfoHelper;
import com.youthor.bsp.core.abdf.common.helper.MD5Helper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.helper.TagHtmlHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.core.urss.model.User;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;
import com.youthor.bsp.view.urss.web.form.UserForm;


public class UserAction extends BaseStrutsAction{
    
      private static final String FORWARD_UserList = "userList";
      private static final String FORWARD_UserEdit = "userEdit";
      private static final String FORWARD_UserTree = "userTree";
      private static final String FORWARD_DelToList = "delToList";
      private static final String FORWARD_listPageUserByOrgId = "listPageUserByOrgId";
      private static final String FORWARD_MODIFYPWD = "modifyPwdResult";
      
      private static final String ActionFormClass = "com.youthor.bsp.view.urss.web.form.UserForm";
      private static final String modelClass = "com.youthor.bsp.core.urss.model.User";
      
    private IUrssServiceFacade urssServiceFacade;
    public void setUrssServiceFacade(IUrssServiceFacade urssServiceFacade) {
        this.urssServiceFacade = urssServiceFacade;
    }
    
    public ActionForward modifyPassword(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        UserForm userForm=(UserForm)form;
        User user = (User)request.getSession().getAttribute(Constants.GLOBAL_USER);
        User ormUser = urssServiceFacade.userLogon(user.getLoginId(), MD5Helper.MD5Encode(userForm.getOldPwd()));
            
        System.out.println("user.getLoginId() --->" + user.getLoginId());
        System.out.println("user.getPwd() --->" + user.getPwd());
        System.out.println("MD5Helper.MD5Encode(userForm.getOldPwd() --->" + MD5Helper.MD5Encode(userForm.getOldPwd()));
        
        if(ormUser == null){
            request.setAttribute("hintMessage", "原始密码错误！");
            return mapping.findForward(FORWARD_MODIFYPWD);
        }
        else{
            ormUser.setPwd(MD5Helper.MD5Encode(userForm.getPwd()));
            urssServiceFacade.updateUser(ormUser);
            
            request.setAttribute("hintMessage", "修改密码成功！");
            return mapping.findForward(FORWARD_MODIFYPWD);
        }
    }
    
    public ActionForward listPageUnUserByOrgId(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        User user=new User();
        Page page=(Page)request.getAttribute(Page.PAGE_INFO);
        String orgId=request.getParameter("orgId");
        HttpSession session=request.getSession();
        if(orgId==null||orgId.equals("")) {
             
             orgId=WebHelper.getTopOrgId(session, Constants.GLOBAL_GS);
        }
        List pageList=urssServiceFacade.listPageUnUserByOrgId(page,orgId);
        request.setAttribute("pageList",pageList);
        request.setAttribute("orgId",orgId);
        Org org = urssServiceFacade.getOrgById(orgId);
        request.setAttribute("org", org);
        return mapping.findForward(FORWARD_UserList);    
    }
    
    
    public ActionForward listPageUserByOrgId(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        
        Page page=(Page)request.getAttribute(Page.PAGE_INFO);
        String orgId=request.getParameter("orgId");
        HttpSession session=request.getSession();
        if(orgId==null||orgId.equals("")) {
            orgId=WebHelper.getTopOrgId(session, Constants.GLOBAL_GS);
        }
        List pageList=urssServiceFacade.listPageUserByOrgId(page,orgId);
        request.setAttribute("pageList",pageList);
        return mapping.findForward(FORWARD_UserList);    
    }
    
    public ActionForward forwardUserTree(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        HttpSession session=request.getSession();
        String comId =WebHelper.getTopOrgId(session, Constants.GLOBAL_GS);
        Org orgTreeRoot=urssServiceFacade.getTreeRootOrg(comId);
        request.setAttribute("orgTreeRoot",orgTreeRoot);
        return mapping.findForward(FORWARD_UserTree);
    }
    
    
    public ActionForward showUser(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        UserForm userForm=(UserForm)form;
        String userId=userForm.getUserId();
        User user=urssServiceFacade.getUserByUserId(userId);
        userForm=(UserForm)this.modelToForm(user,ActionFormClass);
        request.setAttribute("UserForm",userForm);
        request.setAttribute("orgList",user.getOrgList());
        return mapping.findForward(FORWARD_UserEdit);    
    }
    
    public ActionForward saveUser(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        UserForm userForm=(UserForm)form;
        String [] orgIds=request.getParameterValues("orgId");
        User user=(User)this.formToModel(userForm,modelClass);
        if(user.getUserId()==null||user.getUserId().equals(""))
        {
            user.setPwd(MD5Helper.MD5Encode(user.getPwd()));
            String userId=urssServiceFacade.addUser(user,orgIds);
            userForm.setUserId(userId);
        }
        else
        {
            String pwdOld=request.getParameter("pwdOld");
            if(!user.getPwd().trim().equals(pwdOld))
            {
                user.setPwd(MD5Helper.MD5Encode(user.getPwd()));
                user.setPwd(user.getPwd());
            }
            String userId=urssServiceFacade.updateUser(user,orgIds);
        }
        List orgList=new ArrayList();
        if(orgIds!=null&&orgIds.length>0)
        {
            for(int i=0;i<orgIds.length;i++)
            {
                Org org=urssServiceFacade.getOrgById(orgIds[i]);
                orgList.add(org);
            }
        }
        request.setAttribute("orgList",orgList);
        return mapping.findForward(FORWARD_UserEdit);
    }
    
    public ActionForward initUser(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        UserForm userForm=(UserForm)form;
        HttpSession session=request.getSession();
        String comId =WebHelper.getTopOrgId(session, Constants.GLOBAL_GS);
        userForm.setComId(comId);
        String [] orgIds=request.getParameterValues("orgId");
        List orgList=new ArrayList();
        if(orgIds!=null&&orgIds.length>0)
        {
            for(int i=0;i<orgIds.length;i++)
            {
                Org org=urssServiceFacade.getOrgById(orgIds[i]);
                orgList.add(org);
                userForm.setUserName(org.getOrgName());
            }
        }
        request.setAttribute("orgList",orgList);
        return mapping.findForward(FORWARD_UserEdit);
    }
    
    public ActionForward deleteUser(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
         String [] ids=request.getParameterValues("itemIdCheckBox");
         if (ids != null && ids.length>0) {
             for (int i=0;i< ids.length;i++) {
                 urssServiceFacade.deleteUserById(ids[i]);
             }
         }
        return mapping.findForward(FORWARD_listPageUserByOrgId);
        
    }
    
    public ActionForward orgTreeUser(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String urlBase=request.getContextPath();
         String CONTENT_TYPE = "text/xml;charset=UTF-8";
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
                String action = "javascript:doChangeMain('"+orgTreePo.getOrgId()+"' ,'"+orgTreePo.getParentId()+"','"
                +orgTreePo.getOrgTypeCode()+"','"+orgTreePo.getAllParentName()+"','"+
                orgTreePo.getOrgName()+"','"+StringHelper.doWithNull(orgTreePo.getUserId())+"')";
                String icon = urlBase+"/bsp/abdf/skins/default/img/xloadtree/folder.png";
                 String openIcon = urlBase+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png";
                 String src=urlBase+"/orgTreeUser_urss.do?orgParentId="+orgTreePo.getOrgId();
                 sbXML.append(TagHtmlHelper.makeItemXML(orgTreePo.getOrgName(), action, src, icon, openIcon));
                
            }
        }
        
        sbXML.append("\t</tree>\n");
        out.print(sbXML.toString());
        return null;    
    }

}
