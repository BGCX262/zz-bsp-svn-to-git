package com.youthor.bsp.view.urss.web.action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.ConfigInfoHelper;
import com.youthor.bsp.core.abdf.common.helper.QueryCodeHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.helper.TagHtmlHelper;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;
import com.youthor.bsp.view.urss.web.form.OrgForm;



public class OrgAction extends BaseStrutsAction {
    
    private static final String CONTENT_TYPE = "text/xml;charset=UTF-8";
    private IUrssServiceFacade urssServiceFacade;
    
    private static final String Action_Form = "com.youthor.bsp.view.urss.web.form.OrgForm";
    private static final String Model_Class = "com.youthor.bsp.core.urss.model.Org";
    private static final String Forward_OrgTree = "orgTree";
    private static final String Forward_OrgEdit = "orgEdit";
    private static final String Forward_SaveToEdit = "saveToEdit";
    private static final String Forward_UserPower = "userPower";
    
    
    
    
    


    public ActionForward orgTree(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
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
                String action = "javascript:doChangeMain('"+orgTreePo.getOrgId()+"' ,'"+orgTreePo.getParentId()+"','"+orgTreePo.getOrgTypeCode()+"')";
                String icon = urlBase+"/bsp/abdf/skins/default/img/xloadtree/folder.png";
                 String openIcon = urlBase+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png";
                 String src=urlBase+"/orgTree_urss.do?orgParentId="+orgTreePo.getOrgId();
                 sbXML.append(TagHtmlHelper.makeItemXML(orgTreePo.getOrgName(), action, src, icon, openIcon));
                
            }
        }
        
        sbXML.append("\t</tree>\n");
        out.print(sbXML.toString());
        return null;    
    }
    
    public ActionForward saveOrg(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        OrgForm orgTreeForm=(OrgForm)form;
        orgTreeForm.setQueryCode(QueryCodeHelper.getQueryCode(orgTreeForm.getOrgName()));
        String orgId=orgTreeForm.getOrgId();
        Org orgTreePo=(Org)this.formToModel(orgTreeForm,Model_Class);
        if(orgTreePo.getParentId()!=null&&orgTreePo.getParentId().equals("")) orgTreePo.setParentId(null); 
        if(orgId!=null&&!orgId.equals(""))
        {
            String orgNameOld=request.getParameter("orgNameOld");
            if(!orgNameOld.trim().equals(orgTreeForm.getOrgName().trim()))
            {
                request.setAttribute("reloadTree","true");
            }
            orgId=urssServiceFacade.updateOrg(orgTreePo);
        }
        else
        {
            orgTreePo.setUserId("N");
            orgId=urssServiceFacade.addOrg(orgTreePo);
            request.setAttribute("reloadTree","true");
        }
        
        request.setAttribute("orgId",orgId);
        return mapping.findForward(Forward_SaveToEdit);
        
    }
    
    
    public ActionForward showOrg(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        OrgForm orgTreeForm=(OrgForm)form;
        String orgId=(String)request.getAttribute("orgId");
        HttpSession session=request.getSession();
        if(orgId==null||orgId.equals(""))
            orgId=orgTreeForm.getOrgId();
        
        if(orgId==null||orgId.equals(""))
        {
          
             orgId = WebHelper.getTopOrgId(session, Constants.GLOBAL_GS);
        }
        
        /**初始化状态进入此action.
          处理逻辑如下：
          (1):从组织架构树中得到最顶层组织架构.
          (2):根据组织架构类型，到缓存中查找是否有相应的表配置。
              如果有：加载出相应数据放入Map中传出页面。
              如果无：直接把组织架构Vo--->Form传入页面
         */
        Org orgTreePo=null;
        orgTreePo=urssServiceFacade.getOrgById(orgId);
        //返回组织架构树中的信息
        orgTreeForm=(OrgForm)this.modelToForm(orgTreePo,Action_Form);
        if(orgTreeForm.getParentId()==null) orgTreeForm.setParentId("");
        request.setAttribute("OrgForm",orgTreeForm);
        orgId=orgTreePo.getOrgId();

        /**
         * 查找此组织架构下的子组织架构，只查下一级.转成actionForm后传入页面
         */
         List orgListChild=urssServiceFacade.getOrgListByParent(orgId);
         request.setAttribute("subOrgList",orgListChild);
        return mapping.findForward(Forward_OrgEdit);
        
    }
        
    public ActionForward initOrg(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        OrgForm orgTreeForm=(OrgForm)form;
        if(orgTreeForm.getParentId()!=null&&!orgTreeForm.getParentId().equals("")) {
            Org orgTreePo=urssServiceFacade.getOrgById(orgTreeForm.getParentId());
            
            if (orgTreePo!=null) {
                if (orgTreePo.getAllParentCode()!=null && !orgTreePo.getAllParentCode().equals("")){
                    orgTreeForm.setAllParentCode(orgTreePo.getAllParentCode()+":"+StringHelper.doWithNull(orgTreePo.getOrgTypeCode()));
                }
                else {
                    orgTreeForm.setAllParentCode(orgTreePo.getOrgTypeCode());
                }
                
                if (orgTreePo.getAllParentId()!=null && !orgTreePo.getAllParentId().equals("")){
                    orgTreeForm.setAllParentId(orgTreePo.getAllParentId()+":"+orgTreePo.getOrgId());
                }
                else {
                    orgTreeForm.setAllParentId(orgTreePo.getOrgId());
                }
                if (orgTreePo.getAllParentName()!=null && !orgTreePo.getAllParentName().equals("")){
                    orgTreeForm.setAllParentName(orgTreePo.getAllParentName()+":"+orgTreePo.getOrgName());
                }
                else {
                    orgTreeForm.setAllParentName(orgTreePo.getOrgName());
                }
            }
        }
        return mapping.findForward(Forward_OrgEdit);
    }
    public ActionForward forwardOrgTree(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
       HttpSession session=request.getSession();
       Org orgTreeRoot=urssServiceFacade.getTreeRootOrg(WebHelper.getTopOrgId(session, Constants.GLOBAL_GS));
        request.setAttribute("orgTreeRoot",orgTreeRoot);
        return mapping.findForward(Forward_OrgTree);
    }

    public void setUrssServiceFacade(IUrssServiceFacade urssServiceFacade) {
        this.urssServiceFacade = urssServiceFacade;
    }

    

}
