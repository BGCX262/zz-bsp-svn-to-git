package com.youthor.bsp.view.abdf.common.action;

import java.io.PrintWriter;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.youthor.bsp.core.abdf.common.helper.TagHtmlHelper;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;




public class OrgAction extends BaseStrutsAction {
    
    private static final String CONTENT_TYPE = "text/xml;charset=UTF-8";
    private IUrssServiceFacade urssServiceFacade;
    

    
    
    
    
    


    public ActionForward orgTree(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String urlBase=request.getContextPath();
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        StringBuffer sbXML=new StringBuffer();
        sbXML.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
        sbXML.append("\t<tree>\n");
        String orgParentId =  request.getParameter("orgParentId");
        List orgList=urssServiceFacade.getOrgListByParent(orgParentId);
        String includeChild=request.getParameter("includeChild");
        if(includeChild==null||includeChild.equals(""))
            includeChild="true";
        if(orgList!=null&&orgList.size()>0)
        {
            for(int i=0;i<orgList.size();i++)
            {
                Org orgTreePo=(Org)orgList.get(i);
                if(includeChild.equals("false")) 
                {
                    if(!orgTreePo.getOrgTypeCode().equals("YG")) continue;
                }
                String action = "javascript:doChangeMain('"+orgTreePo.getOrgId()+"' ,'"+orgTreePo.getOrgName()+"','"+orgTreePo.getOrgTypeCode()+"','"+orgTreePo.getAllParentId()+"','"+orgTreePo.getAllParentName()+"','"+orgTreePo.getAllParentCode()+"')";
                
                
                String icon = urlBase+"/bsp/abdf/skins/default/img/xloadtree/folder.png";
                 String openIcon = urlBase+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png";
                 String src=urlBase+"/orgTree_abdf.do?orgParentId="+orgTreePo.getOrgId();
                 sbXML.append(TagHtmlHelper.makeItemXML(orgTreePo.getOrgName(), action, src, icon, openIcon));
                
            }
        }
        
        sbXML.append("\t</tree>\n");
        out.print(sbXML.toString());
        return null;    
    }

    public void setUrssServiceFacade(IUrssServiceFacade urssServiceFacade) {
        this.urssServiceFacade = urssServiceFacade;
    }

    

}
