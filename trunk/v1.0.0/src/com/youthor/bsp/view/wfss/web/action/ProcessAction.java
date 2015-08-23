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
import com.youthor.bsp.core.urss.model.App;
import com.youthor.bsp.core.wfss.common.cache.mapcache.WFCacheData;
import com.youthor.bsp.core.wfss.model.Process;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;
import com.youthor.bsp.view.wfss.web.form.ProcessForm;


public class ProcessAction extends BaseStrutsAction {

    private static final String FORWARD_ProcessList = "processList";

    private static final String FORWARD_ProcessEdit = "processEdit";

    private static final String FORWARD_DelToList = "delToList";

    private static final String ActionFormClass =ProcessForm.class.getName();

    private static final String modelClass = Process.class.getName();

    private IWfssServiceFacade wfssServiceFacade;

    

    public void setWfssServiceFacade(IWfssServiceFacade wfssServiceFacade) {
        this.wfssServiceFacade = wfssServiceFacade;
    }

    

    public ActionForward queryPageProcess(ActionMapping mapping,
            ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        String appId=WebHelper.getAppId();
        List pageList =  wfssServiceFacade.getProcessByAppId(appId);
        App app=WebHelper.getApp();
        request.setAttribute("app", app);
        request.setAttribute("pageList", pageList);
        return mapping.findForward(FORWARD_ProcessList);
    }

    public ActionForward initProcess(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        App app=WebHelper.getApp();
        ProcessForm processFrom = (ProcessForm) form;
        processFrom.setIsUsed("N");
        processFrom.setAppId(app.getAppId());
        request.setAttribute("app", app);
        return mapping.findForward(FORWARD_ProcessEdit);
    }

    public ActionForward saveProcess(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ProcessForm processFrom = (ProcessForm) form;
        Process process = (Process) this.formToModel(processFrom, modelClass);

        if (StringHelper.doWithNull(process.getProcessId()).equals("")) {
            wfssServiceFacade.addProcess(process);
            processFrom.setProcessId(process.getProcessId());
            request.setAttribute("reloadTree", "true");
        } else {
            String processNameOld=request.getParameter("processNameOld");
            if(processNameOld==null) processNameOld="";
            if(!processNameOld.equals(process.getProcessName()))
            {
                request.setAttribute("reloadTree", "true");
            }
            wfssServiceFacade.updateProcess(process);
        }
        App app=WebHelper.getApp();
        request.setAttribute("app", app);
        request.setAttribute("editionId", process.getEditionId());
        WFCacheData.mapProcessId.clear();
        WFCacheData.mapProcessAlias.clear();
    
        
        return mapping.findForward(FORWARD_ProcessEdit);
    }

    public ActionForward showProcess(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ProcessForm processForm = (ProcessForm) form;
        Process process = wfssServiceFacade.getProcessById(processForm
                .getProcessId());
        processForm = (ProcessForm) this.modelToForm(process, ActionFormClass);
        request.setAttribute("ProcessForm", processForm);
        
        request.setAttribute("appId", processForm.getAppId());
        request.setAttribute("editionId", process.getEditionId());
        App app=WebHelper.getApp();
        request.setAttribute("app", app);
        
        return mapping.findForward(FORWARD_ProcessEdit);
    }

    public ActionForward deleteProcess(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String[] ids = request.getParameterValues("itemIdCheckBox");
        wfssServiceFacade.deleteProcessByIds(ids);
        request.setAttribute("reloadTree", "true");
        App app=WebHelper.getApp();
        request.setAttribute("app", app);
        return mapping.findForward(FORWARD_DelToList);
    }

}
