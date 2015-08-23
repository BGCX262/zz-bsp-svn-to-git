package com.youthor.bsp.view.abdf.web.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import com.youthor.bsp.core.abdf.common.helper.DateHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.abdf.model.Attachment;
import com.youthor.bsp.core.abdf.model.Information;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.helper.AttachFactoryHelper;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;
import com.youthor.bsp.view.abdf.web.form.InformationForm;

public class InformationAction extends BaseStrutsAction {

    private IAbdfServiceFacade abdfServiceFacade;

    private static final String FORWARD_INFORMATION_LIST = "informationList";
    private static final String FORWARD_INFORMATION_EDIT = "informationEdit";
    private static final String FORWARD_INFORMATION_VIEW = "informationView";
    private static final String FORWARD_DELTOLIST = "delToList";

    private static final String actionFormClass = InformationForm.class.getName();
    private static final String modelClass = Information.class.getName();

    public ActionForward getInformationList(ActionMapping mapping,ActionForm form, HttpServletRequest request,HttpServletResponse response) throws Exception {
        InformationForm inforForm = (InformationForm)form;
        Page page=(Page)request.getAttribute(Page.PAGE_INFO);
        Information infromation = (Information)formToModel(inforForm, modelClass);
        List pageList = abdfServiceFacade.getAllInformations(page, infromation);
        request.setAttribute("pageList", pageList);
        return mapping.findForward(FORWARD_INFORMATION_LIST);
    }

    public ActionForward initInformation(ActionMapping mapping,ActionForm form, HttpServletRequest request,HttpServletResponse response) throws Exception {
        
        return mapping.findForward(FORWARD_INFORMATION_EDIT);
    }

    public ActionForward deleteInformation(ActionMapping mapping,ActionForm form, HttpServletRequest request,HttpServletResponse response) throws Exception {
        String[] inforIds = request.getParameterValues("itemIdCheckBox");
        abdfServiceFacade.deleteInformationByIds(inforIds);
        return mapping.findForward(FORWARD_DELTOLIST);
    }

    public ActionForward deleteAttachInfor(ActionMapping mapping,ActionForm form, HttpServletRequest request,HttpServletResponse response) throws Exception {
        String[] attachIds = request.getParameterValues("itemIdFileCheckBox");
        if (attachIds != null && attachIds.length > 0) {
            String inforId = "";
            for (int i = 0; i < attachIds.length; i++) {
                Attachment attInfo = abdfServiceFacade.getAttachInfoById(attachIds[i]);
                if("".equals(inforId)){
                    inforId = attInfo.getAppId();
                }
                abdfServiceFacade.deleteAttachInfo(attInfo);
            }
            
            Information model = abdfServiceFacade.getInformationById(inforId);
            form = (InformationForm)modelToForm(model, actionFormClass);
            request.setAttribute("InformationForm",form);
            
            List attachListData = abdfServiceFacade.getAttachInfoListByAppId(inforId);
            request.setAttribute("attachListData", attachListData);
        }        
        return mapping.findForward(FORWARD_INFORMATION_EDIT);
    }

    public ActionForward viewInformation(ActionMapping mapping,ActionForm form, HttpServletRequest request,HttpServletResponse response) throws Exception {
        InformationForm inforForm = (InformationForm)form;
        Information model = abdfServiceFacade.getInformationById(inforForm.getInfoId());
        form = (InformationForm)modelToForm(model, actionFormClass);
        
        request.setAttribute("InformationForm",form);
        List attachListData = abdfServiceFacade.getAttachInfoListByAppId(inforForm.getInfoId());
        request.setAttribute("attachListData", attachListData);

        return mapping.findForward(FORWARD_INFORMATION_VIEW);
    }

    public ActionForward editInformation(ActionMapping mapping,ActionForm form, HttpServletRequest request,HttpServletResponse response) throws Exception {
        InformationForm inforForm = (InformationForm)form;
        Information model = abdfServiceFacade.getInformationById(inforForm.getInfoId());
        form = (InformationForm)modelToForm(model, actionFormClass);
        request.setAttribute("InformationForm",form);
        List attachListData = abdfServiceFacade.getAttachInfoListByAppId(inforForm.getInfoId());
        request.setAttribute("attachListData", attachListData);

        return mapping.findForward(FORWARD_INFORMATION_EDIT);
    }
    
    public ActionForward saveInformation(ActionMapping mapping,ActionForm form, HttpServletRequest request,HttpServletResponse response) throws Exception {
        InformationForm inforForm = (InformationForm)form;

        if(StringHelper.isHasContent(inforForm.getInfoId())){
            Org org = WebHelper.getOrg(request.getSession());
            if(org != null){
                inforForm.setCreateOrgId(org.getOrgId());
                inforForm.setCreateOrgName(org.getOrgName());
            }
        }
        inforForm.setCreateTime(new Date());
        if(inforForm.getAbledDate() == null){
            inforForm.setAbledDate(new Date());
        }
        if(inforForm.getDisabledDate() == null){
            inforForm.setAbledDate(DateHelper.converStrToDate("2050-12-31"));
        }
        if(!StringHelper.isHasContent(inforForm.getInfoStatus())){
            inforForm.setInfoStatus("Y");
        }
        if(StringHelper.isHasContent(inforForm.getHtmlContent())){
            System.out.println(inforForm.getHtmlContent());
            inforForm.setHtmlContent(inforForm.getHtmlContent().replaceAll("\n\r", "<br/>"));
            System.out.println("aaaa----->" + inforForm.getHtmlContent());
        }
        
        Information infromation = (Information)formToModel(inforForm, modelClass);
        
        String inforId = "";
        if(StringHelper.isHasContent(inforForm.getInfoId())){
            inforId = abdfServiceFacade.updateInformation(infromation);
        }
        else{
            inforId = abdfServiceFacade.addInformation(infromation);
        }
        
        Org sysOrg = WebHelper.getOrg(request.getSession());
        List attahFormList = inforForm.getAttahFormList();
        for (int i = 0; i < attahFormList.size(); i++) {
            FormFile formFile = (FormFile) attahFormList.get(i);
            AttachFactoryHelper.updateFile(formFile, inforId, "information", sysOrg, null, null);
        }
        List attachListData = abdfServiceFacade.getAttachInfoListByAppId(inforId);
        request.setAttribute("attachListData", attachListData);

        return mapping.findForward(FORWARD_INFORMATION_EDIT);
    }

    public void setAbdfServiceFacade(IAbdfServiceFacade abdfServiceFacade) {
        this.abdfServiceFacade = abdfServiceFacade;
    }
}
