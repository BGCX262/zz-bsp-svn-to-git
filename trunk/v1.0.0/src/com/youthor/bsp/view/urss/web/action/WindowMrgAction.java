package com.youthor.bsp.view.urss.web.action;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.MD5Helper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.common.model.MrgRightMenu;
import com.youthor.bsp.core.urss.model.ComUser;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
public class WindowMrgAction extends BaseStrutsAction{
    
    private  IUrssServiceFacade urssServiceFacade;
      private static final String FORWARD_Window = "Window";
      
    public void setUrssServiceFacade(IUrssServiceFacade urssServiceFacade) {
        this.urssServiceFacade = urssServiceFacade;
    }

    public ActionForward mrgLogonToSystem(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String username=request.getParameter("username");
        String pwd=request.getParameter("password");
        pwd=MD5Helper.MD5Encode(pwd);
        ComUser comUser=urssServiceFacade.getComUserLogon(username,pwd);
        if(comUser!=null)
        {
            request.getSession().setAttribute(Constants.GLOBAL_MRG_USER,comUser);
            String userType=StringHelper.doWithNull(comUser.getUserType());
            //超级用户
            if(userType.equals("-1"))
            {
                 //if(request.getSession().getServletContext().getAttribute(Constants.GLOBAL_POWER_SUPER)==null)
                {
                  String realPath=request.getSession().getServletContext().getRealPath("/WEB-INF/classes/right/super.xml");
                  List  powerMenus  =setPowerMenuMrg(request,realPath);
                  request.getSession().getServletContext().setAttribute(Constants.GLOBAL_POWER_SUPER,powerMenus);
                 }
            }

            else if(userType.equals("0")) //公司管理用户
            {
                //if(request.getSession().getServletContext().getAttribute(Constants.GLOBAL_POWER_COM)==null)
                 {
                  String realPath=request.getSession().getServletContext().getRealPath("/WEB-INF/classes/right/com.xml");
                  List  powerMenus  =setPowerMenuMrg(request,realPath);
                  request.getSession().getServletContext().setAttribute(Constants.GLOBAL_POWER_COM,powerMenus);
                 }
            }
            else if(userType.equals("1")) //应用用户
            {
                //if(request.getSession().getServletContext().getAttribute(Constants.GLOBAL_POWER_APP)==null)
                 {
                  String realPath=request.getSession().getServletContext().getRealPath("/WEB-INF/classes/right/app.xml");
                  List  powerMenus  =setPowerMenuMrg(request,realPath);
                  request.getSession().getServletContext().setAttribute(Constants.GLOBAL_POWER_APP,powerMenus);
                 }
            }
        }
        return mapping.findForward(FORWARD_Window);    
    }    
    
   private List setPowerMenuMrg(HttpServletRequest request,String realPath) throws Exception
   {
     
         File file=new File(realPath);
        java.io.InputStream xmlDocInput = new FileInputStream(file);
        SAXBuilder saxBuilder = new SAXBuilder();
         Document xmlMapDoc = saxBuilder.build(xmlDocInput);
         Element root = xmlMapDoc.getRootElement();
         List xmlList=root.getChildren();
         List powerMenus=new ArrayList();
         for(int j=0;j<xmlList.size();j++)
         {
             Element e = (Element)xmlList.get(j);
             MrgRightMenu mrgRight=new MrgRightMenu();
             mrgRight.setName(e.getAttributeValue("name"));
             mrgRight.setUrl(StringHelper.doWithNull(e.getAttributeValue("url")));
             mrgRight.setShow(e.getAttributeValue("show"));
             List subE=e.getChildren();
             if(subE!=null&&subE.size()>0)
             {
                 List powerMenusSub=new ArrayList();
                 for(int n=0;n<subE.size();n++)
                 {
                    
                     Element element = (Element)subE.get(n);
                     MrgRightMenu mrgRightsub=new MrgRightMenu();
                     mrgRightsub.setName(element.getAttributeValue("name"));
                     mrgRightsub.setUrl(StringHelper.doWithNull(element.getAttributeValue("url")));
                     mrgRightsub.setShow(element.getAttributeValue("show"));
                     powerMenusSub.add(mrgRightsub);
                 }
                 mrgRight.setSubMeu(powerMenusSub);
             }
             powerMenus.add(mrgRight);
         }
         return powerMenus;
   }
}
