package com.youthor.bsp.view.wfss.web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.core.wfss.model.Agent;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;
import com.youthor.bsp.view.wfss.web.form.AgentForm;

public class AgentAction extends BaseStrutsAction{
     private IWfssServiceFacade wfssServiceFacade;
        public void setWfssServiceFacade(IWfssServiceFacade wfssServiceFacade) {
            this.wfssServiceFacade = wfssServiceFacade;
        }
        
    public ActionForward showAgent(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession();
        AgentForm agentForm = (AgentForm)form;
        String orgId = WebHelper.getOrgId(session);
        String orgName = WebHelper.getOrgName(session);
        String currOrgName = WebHelper.getOrgParentName(session);
        agentForm.setOrgId(orgId);
        agentForm.setOrgName(orgName);
        request.setAttribute("currOrgName", currOrgName);
        agentForm.setAgentType("ALL");
        Agent agent = wfssServiceFacade.getAgentByOrgId(orgId);
        if (agent!=null) {
            agentForm = (AgentForm)this.modelToForm(agent, AgentForm.class.getName());
            request.setAttribute("AgentForm", agentForm);
        }
        return mapping.findForward("agentEdit");
    }
    
    public ActionForward saveAgent(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
    	 HttpSession session = request.getSession();
         AgentForm agentForm = (AgentForm)form;
         String orgId = WebHelper.getOrgId(session);
         String orgName = WebHelper.getOrgName(session);
         agentForm.setOrgId(orgId);
         agentForm.setOrgName(orgName);
         Agent agent = wfssServiceFacade.getAgentByOrgId(orgId);
         
         if(agent!=null) {
            agent.setAgentOrgId(agentForm.getAgentOrgId());
            agent.setAgentOrgName(agentForm.getAgentOrgName());
            agent.setFromDate(agentForm.getFromDate());
            agent.setToDate(agentForm.getToDate());
             String id = wfssServiceFacade.updateAgent(agent);
         }
         else {
            agent= (Agent)this.formToModel(agentForm, Agent.class.getName());
            String id = wfssServiceFacade.addAgent(agent);
         }
         response.sendRedirect(request.getContextPath()+"/showAgent_wfss.do");
        return null;
    }
}
