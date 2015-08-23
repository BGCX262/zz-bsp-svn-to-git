package com.youthor.bsp.view.urss.web.action;

import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.core.urss.model.Right;

import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.criterion.IDictDynamic;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;

import com.youthor.bsp.view.urss.dict.AppDict;
import com.youthor.bsp.view.urss.web.action.helper.RightActionHelper;

public class UserRightAction extends BaseStrutsAction{
    
    private IUrssServiceFacade urssServiceFacade;
    
    
      private static final String FORWARD_UserRightEdit = "userRightEdit";
      private static final String FORWARD_SaveUserRightHandle = "saveUserRightHandle";
      private static final String FORWARD_OrgTree = "orgTree";
    

      public ActionForward orgTreeUserRight(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
            Org orgTreeRoot=urssServiceFacade.getTreeRootOrg(WebHelper.getTopOrgId(request.getSession(), "GS"));
            request.setAttribute("orgTreeRoot",orgTreeRoot);
            return mapping.findForward(FORWARD_OrgTree);
        }

      public ActionForward showUserRight(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
            String orgId=request.getParameter("orgId");
            String appId=request.getParameter("appId");
            String [] roles =request.getParameterValues("roles");
            String rolesStr=StringHelper.arrToString(roles);
            request.setAttribute("rolesStr",rolesStr);
            if(appId==null||appId.equals(""))
            {
                IDictDynamic appDict=new AppDict();
                List appList=appDict.execute(request);
                if(appList!=null&&appList.size()>0)
                {
                    Item item=(Item)appList.get(0);
                    appId=item.getKey();
                }
            }
            if(appId==null||appId.equals("")) return null;
            request.setAttribute("appId",appId);
            Org org=urssServiceFacade.getOrgById(orgId);
            request.setAttribute("org",org);
            List functionList=urssServiceFacade.getFunctionWithResourceByAppId(appId);
            request.setAttribute("functionList",functionList);
            //根据用用户和选择角色找到已选择的资源
            List userResList=urssServiceFacade.getUserRescoureByAppIdOrgIdRoleIds(appId,orgId,roles);
            request.setAttribute("userResList",userResList);
            return mapping.findForward(FORWARD_UserRightEdit);
        }

      public ActionForward saveUserRight(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
            String orgId=request.getParameter("orgId");
            String appId=request.getParameter("appId");
            String [] resources=request.getParameterValues("resources");
            List rightList=new ArrayList();
            if(resources!=null&&resources.length>0)
            {

                for(int i=0;i<resources.length;i++)
                {
                    String [] arr=StringHelper.split(resources[i],":");
                    RightActionHelper.getLinkAssign(request, orgId, appId, rightList, arr);
                    if(RightActionHelper.isCanAdd(rightList,arr[0]))
                    {
                        Right right=new Right();
                        right.setAppId(appId);
                        right.setMemberId(orgId);
                        right.setResourceId(arr[0]);
                        right.setFunModuleId(arr[1]);
                        rightList.add(right);
                        
                    }
                }
            }
            boolean b=urssServiceFacade.saveUserRight(appId,orgId,rightList);
            if(b)
            {
                request.setAttribute("prom","保存权限成功");
            }
            else
            {
                request.setAttribute("prom","保存权限失败");
            }
            return mapping.findForward(FORWARD_SaveUserRightHandle);    
        }
      
    public void setUrssServiceFacade(IUrssServiceFacade urssServiceFacade) {
        this.urssServiceFacade = urssServiceFacade;
    }
    
    

}
