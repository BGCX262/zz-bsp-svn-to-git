package com.youthor.bsp.view.wfss.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine;
import com.youthor.bsp.core.wfss.model.Activity;
import com.youthor.bsp.core.wfss.model.Process;
import com.youthor.bsp.core.wfss.model.WorkItemDoen;
import com.youthor.bsp.core.wfss.model.WorkItemDoing;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.helper.AttachFactoryHelper;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;
import com.youthor.bsp.view.wfss.web.form.ProcessAttachForm;

public class ProcessAttachAction extends BaseStrutsAction{
    private static final String FORWARD_ProcessAttachEdit = "processAttachEdit";
    private static final String FORWARD_ProcessAttachSuccess = "processAttachSuccess";
    
    private IWfssServiceFacade wfssServiceFacade;
    private IAbdfServiceFacade abdfServiceFacade;


    public void setWfssServiceFacade(IWfssServiceFacade wfssServiceFacade) {
        this.wfssServiceFacade = wfssServiceFacade;
    }
    public void setAbdfServiceFacade(IAbdfServiceFacade abdfServiceFacade) {
        this.abdfServiceFacade = abdfServiceFacade;
    }
    public ActionForward initProcessAttach(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String workItemId = request.getParameter("workItemId");
        WorkItemDoing workItemDoing= wfssServiceFacade.getWorkItemDoingById(workItemId);
        String appId = "";
        String activityId = "";
        if(workItemDoing == null) {
            WorkItemDoen workItemDoen= wfssServiceFacade.getWorkItemDoenById(workItemId);
            activityId = workItemDoen.getActivityId();
            appId = workItemDoen.getAppId();
        }
        else {
            activityId = workItemDoing.getActivityId();
            appId = workItemDoing.getAppId();
        }
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        Activity activity=wfCacheEngine.getActivityById(activityId);
        request.setAttribute("CURR_ACTIVITY",activity);
        request.setAttribute("appid",appId);
        request.setAttribute("workItemId",workItemId);
        return mapping.findForward(FORWARD_ProcessAttachEdit);    
        
    }
    
    public ActionForward saveProcessAttach(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        ProcessAttachForm processAttachForm = (ProcessAttachForm)form;
        String workItemId = processAttachForm.getWorkItemId();
        WorkItemDoing workItemDoing= wfssServiceFacade.getWorkItemDoingById(workItemId);
        String appId = "";
        String activityId = "";
        String processInstanceId="";
        if(workItemDoing == null) {
            WorkItemDoen workItemDoen= wfssServiceFacade.getWorkItemDoenById(workItemId);
            activityId = workItemDoen.getActivityId();
            appId = workItemDoen.getAppId();
            processInstanceId=workItemDoen.getParentActivityInstId();
            workItemDoing = new WorkItemDoing();
            workItemDoing = (WorkItemDoing)this.modelToModel(workItemDoen, WorkItemDoing.class.getName());
        }
        else {
            
            appId = workItemDoing.getAppId();
            
            
        }
        
        Org sysOrg =WebHelper.getOrg(request.getSession());
        List attahFormList=processAttachForm.getAttahFormList();
        List flowAttachTypeList = processAttachForm.getfFlowAttachTypeList();
         for(int i=0;i<attahFormList.size();i++)
          {
                FormFile formFile=(FormFile)attahFormList.get(i);
                String flowAttachType = "";
                if (attahFormList.size() == flowAttachTypeList.size()) {
                    flowAttachType = (String)flowAttachTypeList.get(i);
                }
                    
                AttachFactoryHelper.updateFile(formFile,appId,"process",sysOrg,workItemDoing,flowAttachType);
          }
        return mapping.findForward(FORWARD_ProcessAttachSuccess);    
    }
    
    public ActionForward deleteProcessAttach(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String attachId = request.getParameter("attachId");
        abdfServiceFacade.deleteAttachInfo(abdfServiceFacade.getAttachInfoById(attachId));
        return null;    
    }
    
    public ActionForward downloadProcessAttach(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        String attachId = request.getParameter("attachId");
        
        return null;    
    }

}
