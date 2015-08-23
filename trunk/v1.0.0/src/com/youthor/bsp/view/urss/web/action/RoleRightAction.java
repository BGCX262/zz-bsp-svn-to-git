package com.youthor.bsp.view.urss.web.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.velocity.app.Velocity;

import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.model.codebuilder.XMLModel;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.App;
import com.youthor.bsp.core.urss.model.Right;
import com.youthor.bsp.core.urss.model.Role;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.code.builder.ContentEngine;
import com.youthor.bsp.view.urss.helper.WebHelper;
import com.youthor.bsp.view.urss.web.action.helper.RightActionHelper;
import com.youthor.bsp.view.urss.web.form.AppForm;

public class RoleRightAction extends BaseStrutsAction{
    
    private IUrssServiceFacade urssServiceFacade;
    
    
      private static final String FORWARD_RoleRightList = "roleRightList";
      private static final String FORWARD_SaveRoleRightHandle = "saveRoleRightHandle";
     
    public ActionForward getFunctionByRoleId(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String roleId=request.getParameter("roleId");
        String appId=request.getParameter("appId");
        //根据应用，得到应用下所有资源的
        List functionList=urssServiceFacade.getFunctionWithResourceByAppId(appId);
        request.setAttribute("functionList",functionList);
        App app=urssServiceFacade.getAppById(appId);
        Role role=urssServiceFacade.getRoleById(roleId);
        //根据角色id和应用id得到这个角色在应用下分配的权限
        List roleList=urssServiceFacade.getRightByAppIdRoleId(appId,roleId);
        request.setAttribute("roleList",roleList);
        request.setAttribute("app",app);
        request.setAttribute("role",role);
        return mapping.findForward(FORWARD_RoleRightList);    
    }

    
    public ActionForward saveRoleRight(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String roleId=request.getParameter("roleId");
        String appId=request.getParameter("appId");
        String [] resources=request.getParameterValues("resources");
        List rightList=new ArrayList();
        if(resources!=null&&resources.length>0)
        {

            for(int i=0;i<resources.length;i++)
            {
                String [] arr=StringHelper.split(resources[i],":");
                RightActionHelper.getLinkAssign(request, roleId, appId, rightList, arr);
                if(RightActionHelper.isCanAdd(rightList,arr[0]))
                {
                    Right right=new Right();
                    right.setAppId(appId);
                    right.setMemberId(roleId);
                    right.setResourceId(arr[0]);
                    right.setFunModuleId(arr[1]);
                    rightList.add(right);
                    
                }
            }
        }
        boolean b=urssServiceFacade.saveRoleRight(appId,roleId,rightList);
        if(b)
        {
            request.setAttribute("prom","保存权限成功");
        }
        else
        {
            request.setAttribute("prom","保存权限失败");
        }
        return mapping.findForward(FORWARD_SaveRoleRightHandle);    
    }


    

    
    public void setUrssServiceFacade(IUrssServiceFacade urssServiceFacade) {
        this.urssServiceFacade = urssServiceFacade;
    }    
    

}
