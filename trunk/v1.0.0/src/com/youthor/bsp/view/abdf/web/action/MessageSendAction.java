package com.youthor.bsp.view.abdf.web.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.Constants;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.abdf.model.MessageFolder;
import com.youthor.bsp.core.abdf.model.MessageSend;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;
import com.youthor.bsp.view.abdf.web.form.MessageSendForm;

public class MessageSendAction extends BaseStrutsAction {

    private IAbdfServiceFacade abdfServiceFacade;

    private static final String FORWARD_MESSAGESEND_LIST = "messageSendList";
    private static final String FORWARD_MESSAGESEND_EDIT = "messageSendEdit";
    private static final String FORWARD_DELTOLIST = "delToList";
    private static final String FORWARD_MESSAGESEND_SEND = "messageSendResult";
    
    private static final String actionFormClass = MessageSendForm.class.getName();
    private static final String modelClass = MessageSend.class.getName();

    public ActionForward editMessageSend(ActionMapping mapping,ActionForm form, HttpServletRequest request,HttpServletResponse response) throws Exception {
        MessageSendForm inforForm = (MessageSendForm)form;
        
        if(StringHelper.isHasContent(inforForm.getId())){
            MessageSend ms = abdfServiceFacade.getMessageAcceptById(inforForm.getId());
            inforForm = (MessageSendForm)modelToForm(ms, actionFormClass);
        }
        else{
            inforForm = new MessageSendForm();
        }
        request.setAttribute("formObject", inforForm);
        return mapping.findForward(FORWARD_MESSAGESEND_EDIT);
    }
    
    public ActionForward saveMessageSend(ActionMapping mapping,ActionForm form, HttpServletRequest request,HttpServletResponse response) throws Exception {
        MessageSendForm inforForm = (MessageSendForm)form;
        MessageSend ms = (MessageSend)formToModel(inforForm, modelClass);
        
        MessageFolder mf = null;
        if(StringHelper.isHasContent(inforForm.getFolderId())){
            mf = abdfServiceFacade.getUserMessageFolderById(inforForm.getFolderId());
        }
        else{
            mf = abdfServiceFacade.getSysMessageFolder(WebHelper.getOrgId(request.getSession()), Constants.MESSAGE_FOLDER_TYPE_DRAFT);
        }
        if(mf != null){
            ms.setFolderId(mf.getFolderId());
            ms.setFolderType(mf.getFolderType());
        }
        ms.setIsDelete(Constants.GLOBAL_NO);
        ms.setSendOrgId(WebHelper.getOrgId(request.getSession()));
        ms.setSendOrgName(WebHelper.getOrgName(request.getSession()));
        
        if(StringHelper.isHasContent(inforForm.getId())){
            abdfServiceFacade.udpateMessageSend(ms);
        }
        else{
            ms.setCreateTime(new Date());
            abdfServiceFacade.addMessageSend(ms);
        }
        
        inforForm = (MessageSendForm)modelToForm(ms, actionFormClass);
        request.setAttribute("formObject", inforForm);
        
        return mapping.findForward(FORWARD_MESSAGESEND_EDIT);
    }
    
    public ActionForward deleteMessageSend(ActionMapping mapping,ActionForm form, HttpServletRequest request,HttpServletResponse response) throws Exception {
        String [] ids = request.getParameterValues("itemIdCheckBox");
        if(ids != null && ids.length >0){
            for(int i=0;i<ids.length;i++){
                abdfServiceFacade.deleteMessageSend(ids[i]);
            }
        }        
        return mapping.findForward(FORWARD_DELTOLIST);
    }
    
    public ActionForward getMessageSendList(ActionMapping mapping,ActionForm form, HttpServletRequest request,HttpServletResponse response) throws Exception {
        MessageSendForm inforForm = (MessageSendForm)form;
        Page page=(Page)request.getAttribute(Page.PAGE_INFO);        
        List pageList = abdfServiceFacade.getMessageSendByFolderId(page, inforForm.getFolderId());
        request.setAttribute("pageList", pageList);
        return mapping.findForward(FORWARD_MESSAGESEND_LIST);
    }
    
    public ActionForward sendMessageSend(ActionMapping mapping,ActionForm form, HttpServletRequest request,HttpServletResponse response) throws Exception {
        //如果没有保存过，先保存然后发送
        saveMessageSend(mapping,form,request,response);    
        
        MessageSendForm inforForm2 = (MessageSendForm)request.getAttribute("formObject");
        abdfServiceFacade.addSendMessageSend(inforForm2.getId());
        
        request.setAttribute("targertUrl", "enterUserMessage.do");
        return mapping.findForward(FORWARD_MESSAGESEND_SEND);
    }
    
    public void setAbdfServiceFacade(IAbdfServiceFacade abdfServiceFacade) {
        this.abdfServiceFacade = abdfServiceFacade;
    }
}
