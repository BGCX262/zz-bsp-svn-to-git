/**
 * 
 */
package com.youthor.bsp.view.wfss.web.action;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.core.wfss.common.cache.mapcache.WFCacheData;
import com.youthor.bsp.core.wfss.model.Button;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.wfss.web.form.ButtonForm;



/**
 * 
 */
public class ButtonAction extends BaseStrutsAction {

    private static final String FORWARD_ButtonEdit = "buttonEdit";
    private static final String FORWARD_DelToList = "delToList";
    private static final String FORWARD_ListEdit = "buttonList";
    private static final String modelClass = Button.class.getName();
    private static final String actionFormClass = ButtonForm.class.getName();
    private IWfssServiceFacade wfssServiceFacade;
    public void setWfssServiceFacade(IWfssServiceFacade wfssServiceFacade) {
        this.wfssServiceFacade = wfssServiceFacade;
    }

    public ActionForward listButton(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List allButton=wfssServiceFacade.getAllButton();
        request.setAttribute("allButton",allButton);
        return mapping.findForward(FORWARD_ListEdit);
    }

    public ActionForward showButton(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ButtonForm buttonForm=(ButtonForm)form;
        String buttonId=buttonForm.getButtonId();
        Button button = wfssServiceFacade.getButtonById(buttonId);
        buttonForm=(ButtonForm)this.formToModel(button,actionFormClass);
        String [] buttonPositions=StringHelper.split(button.getButtonPosition(),",");
        buttonForm.setButtonPositions(buttonPositions);
        request.setAttribute("ButtonForm",buttonForm);
        return mapping.findForward(FORWARD_ButtonEdit);
    }
    
    
    public ActionForward initButton(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        return mapping.findForward(FORWARD_ButtonEdit);
    }
    
    
    public ActionForward saveButton(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ButtonForm buttonForm=(ButtonForm)form;
        String [] buttonPositions=buttonForm.getButtonPositions();
        Button button = (Button) this.formToModel(buttonForm, modelClass);
        String buttonId=buttonForm.getButtonId();
        String buttonPositionStr=StringHelper.arrToString(buttonPositions);
        button.setButtonPosition(buttonPositionStr);
        if(buttonId!=null&&!buttonId.equals(""))
        {
            buttonId=wfssServiceFacade.updateButton(button);
        }
        else
        {
            buttonId=wfssServiceFacade.addButton(button);
        }
        buttonForm.setButtonPositions(buttonPositions);
        buttonForm.setButtonId(buttonId);
        request.setAttribute("ButtonForm",buttonForm);
        WFCacheData.mapButton.clear();
        return mapping.findForward(FORWARD_ButtonEdit);
    }
    
    
    public ActionForward deleteButton(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        return mapping.findForward(FORWARD_DelToList);
    }
    
    

}
