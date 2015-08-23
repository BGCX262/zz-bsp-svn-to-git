package com.youthor.bsp.view.abdf.common.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.model.Attachment;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.helper.AttachFactoryHelper;

public class AttachAction extends BaseStrutsAction{
    
    private IAbdfServiceFacade abdfServiceFacade;

    public void setAbdfServiceFacade(IAbdfServiceFacade abdfServiceFacade) {
        this.abdfServiceFacade = abdfServiceFacade;
    }
    
    public ActionForward downloadFile(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        String attachId = request.getParameter("attachId");
        Attachment attachInfo = abdfServiceFacade.getAttachInfoById(attachId);
    
        AttachFactoryHelper.downloadFile(attachInfo, response);
        
        return null;
        
    }
}
