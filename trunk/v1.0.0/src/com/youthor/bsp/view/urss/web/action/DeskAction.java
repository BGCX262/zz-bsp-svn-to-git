/**
 * 
 */
package com.youthor.bsp.view.urss.web.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.Desk;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.urss.helper.WebHelper;
import com.youthor.bsp.view.urss.web.form.DeskForm;

public class DeskAction extends BaseStrutsAction{
    
      private static final String FORWARD_DeskList = "deskList";
      private static final String FORWARD_DeskEdit = "deskEdit";
      private static final String FORWARD_DelToList = "delToList";
      
      private static final String ActionFormClass = DeskForm.class.getName();
      private static final String modelClass = Desk.class.getName();
      
    private IUrssServiceFacade urssServiceFacade;
    public void setUrssServiceFacade(IUrssServiceFacade urssServiceFacade) {
        this.urssServiceFacade = urssServiceFacade;
    }
    
    public ActionForward queryPageDesk(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        Desk desk=new Desk();
        Page page=(Page)request.getAttribute(Page.PAGE_INFO);
        String comId=WebHelper.getCurrComId(request.getSession());
        String userId=WebHelper.getCurrComUser(request.getSession()).getComUserId();
        List pageList=new ArrayList();
        if(WebHelper.isComAdmin(request.getSession()))
        {
            pageList=urssServiceFacade.queryPageDeskByComId(page,comId);
        }
        else if(WebHelper.isAppAdmin(request.getSession()))
        {
             pageList=urssServiceFacade.queryPageDeskByUserId(page,comId,userId);
        }
        request.setAttribute("pageList",pageList);
        return mapping.findForward(FORWARD_DeskList);    
    }
    
    public ActionForward initDesk(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        DeskForm deskFrom=(DeskForm)form;
        deskFrom.setInitDisplay("Y");
        return mapping.findForward(FORWARD_DeskEdit);    
    }
    
    public ActionForward saveDesk(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
      DeskForm deskFrom=(DeskForm)form;
      Desk desk=(Desk)this.formToModel(deskFrom,modelClass);
      
      if(StringHelper.doWithNull(desk.getDeskId()).equals(""))
      {
          desk.setComId(WebHelper.getCurrComId(request.getSession()));
          urssServiceFacade.addDesk(desk);
          deskFrom.setDeskId(desk.getDeskId());
          
      }
      else
      {
          urssServiceFacade.updateDesk(desk);
      }
        return mapping.findForward(FORWARD_DeskEdit);    
    }
  
  public ActionForward showDesk(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
    DeskForm deskForm=(DeskForm)form;
    Desk desk=urssServiceFacade.getDeskById(deskForm.getDeskId());
    deskForm=(DeskForm)this.modelToForm(desk,ActionFormClass);
      request.setAttribute("DeskForm",deskForm);
        return mapping.findForward(FORWARD_DeskEdit);    
  }
  
  public ActionForward deleteDesk(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String [] ids=request.getParameterValues("itemIdCheckBox");
        urssServiceFacade.deleteDeskByIds(ids);
        return mapping.findForward(FORWARD_DelToList);    
    }


}
