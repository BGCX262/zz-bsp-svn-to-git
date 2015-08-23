package com.youthor.bsp.view.wfss.web.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.core.wfss.model.Activity;
import com.youthor.bsp.core.wfss.model.Process;
import com.youthor.bsp.core.wfss.model.ProcessEdition;
import com.youthor.bsp.core.wfss.model.Route;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;
import com.youthor.bsp.view.wfss.web.form.ProcessEditionForm;

public class ProcessEditionAction extends BaseStrutsAction {
    private IWfssServiceFacade wfssServiceFacade;
    
    public void setWfssServiceFacade(IWfssServiceFacade wfssServiceFacade) {
        this.wfssServiceFacade = wfssServiceFacade;
    }
    
    private static final String ActionFormClass = ProcessEditionForm.class.getName();
    private static final String modelClass = ProcessEdition.class.getName();
    
    public ActionForward initProcessEdition(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        return mapping.findForward("initProcessEdition");
    }
    
    public ActionForward saveProcessEdition(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession();
        String comId = WebHelper.getTopOrgId(session, "GS");
        ProcessEditionForm processEditionForm = (ProcessEditionForm) form;
        ProcessEdition processEdition = (ProcessEdition) this.formToModel(processEditionForm, modelClass);
       
        String id = processEdition.getId();
        if(id!=null && !id.trim().equals("")) {
           id = wfssServiceFacade.updateProcessEdition(processEdition);
           
        }
        else {
          
           processEdition.setComId(comId);
           processEdition.setDeleteFlag("N");
           id = wfssServiceFacade.addProcessEdition(processEdition);
        }
        response.sendRedirect(request.getContextPath() + "/showProcessEdition_wfss.do?id=" + id);
        return null;
    }
    
    public ActionForward showProcessEdition(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String id = request.getParameter("id");
        List processList = new ArrayList();
        HttpSession session = request.getSession();
        String comId = WebHelper.getTopOrgId(session, "GS");
        ProcessEdition processEdition = wfssServiceFacade.getProcessEditionById(id);
        ProcessEditionForm processEditionForm = (ProcessEditionForm) this.modelToForm(processEdition, ActionFormClass);
        processList = wfssServiceFacade.getProcessByEditionId(id,comId);
        request.setAttribute("ProcessEditionForm", processEditionForm);
        request.setAttribute("processList", processList);
        
        List appFormList = new ArrayList();
        appFormList = wfssServiceFacade.getAppFormByEditionId(id);
        request.setAttribute("appFormList", appFormList);
        
        return mapping.findForward("showProcessEdition");
    }
    
    public ActionForward listProcessEdition(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession();
        String comId = WebHelper.getTopOrgId(session, "GS");
        List list = wfssServiceFacade.getProcessEditionByComId(comId);
        request.setAttribute("listProcessEdition", list);
        return mapping.findForward("listProcessEdition");
    }
    
    
    public ActionForward offerProcessSelect(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String id = request.getParameter("id");
        HttpSession session = request.getSession();
        String comId = WebHelper.getTopOrgId(session, "GS");
        List list = wfssServiceFacade.getProcessEditionByComId(comId);
        List listEdition = wfssServiceFacade.getProcessByEditionId(id,comId);
        List listProcess = wfssServiceFacade.getAllProcessByComId(comId);
        List returnPage = new ArrayList();
        if (list!=null && list.size()>0) {
           for(int i=0;i<list.size();i++) {
             ProcessEdition processEdition = (ProcessEdition)list.get(i);
             if(processEdition.getId().equals(id)) {
               continue;
             }
             else {
                for(int j=0;j<listProcess.size();j++) {
                    com.youthor.bsp.core.wfss.model.Process process = (com.youthor.bsp.core.wfss.model.Process)listProcess.get(j);
                    boolean isAdd = true;
                    for(int n=0;n<listEdition.size();n++) {
                        com.youthor.bsp.core.wfss.model.Process processTemp = (com.youthor.bsp.core.wfss.model.Process)listProcess.get(n);
                        if(processTemp.getProcessAlias().equals(process.getProcessAlias())) {
                            isAdd = false;
                            break;
                        }
                    }
                    if(isAdd) {
                       processEdition.getProcesss().add(process);
                    }
                }
             }
             returnPage.add(processEdition);
           }
        }
        request.setAttribute("list", returnPage);
        return mapping.findForward("offerProcessSelect");
    }

    public ActionForward addProcessToEdition(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
         String id = request.getParameter("id");
         String processId = request.getParameter("processId");
       
         Process process = wfssServiceFacade.getProcessById(processId);
         List listActivity = wfssServiceFacade.getActivityByProcessId(processId);
         Process processNeedSave = (Process)this.modelToModel(process, Process.class.getName());
         processNeedSave.setEditionId(id);
         processNeedSave.setProcessId(null);
         processNeedSave.setIsUsed("N");
       
         if(listActivity != null && listActivity.size()>0) {
            for(int i=0;i<listActivity.size();i++) {
              Activity activity = (Activity)listActivity.get(i);
              Activity activityNeedSave = (Activity)this.modelToModel(activity, Activity.class.getName());
              //activityNeedSave.setActivityId(null);
              List listRoute = wfssServiceFacade.getRouteByActivityId(activity.getActivityId());
              
              if(listRoute!=null && listRoute.size()>0) {
                  for(int j=0;j<listRoute.size();j++) {
                     Route route = (Route)listRoute.get(j);
                     Route routeNeedSave = (Route)this.modelToModel(route, Route.class.getName());
                     routeNeedSave.setRouteId(null);
                     activityNeedSave.getRouteList().add(routeNeedSave);
                    
                  }
              }
              processNeedSave.getActivityList().add(activityNeedSave);
            }
         }
         String processIdSave = wfssServiceFacade.copyProcessToEdition(processNeedSave);
         //对所有路由的下游环节进行处理
       
        response.sendRedirect(request.getContextPath() + "/showProcessEdition_wfss.do?id=" + id);
         //进行流程数据的copy
         return null;
          
    }

}
