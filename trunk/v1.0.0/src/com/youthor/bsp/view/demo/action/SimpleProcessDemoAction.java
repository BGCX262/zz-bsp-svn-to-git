package com.youthor.bsp.view.demo.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.demo.model.SimpleProcessDemo;
import com.youthor.bsp.core.demo.model.SimpleProcessDemo1;
import com.youthor.bsp.core.demo.model.SimpleProcessDemo2;
import com.youthor.bsp.core.demo.service.ISimpleProcessDemoService;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.demo.form.SimpleProcessDemoForm;
import com.youthor.bsp.view.wfss.common.FlowEngineView;

public class SimpleProcessDemoAction extends BaseStrutsAction {
    private static final String FORWARD_SimpleProcessDemoEdit = "simpleProcessDemoEdit";
      private static final String ActionFormClass =SimpleProcessDemoForm.class.getName();
      private static final String modelClass =SimpleProcessDemo.class.getName();
      private ISimpleProcessDemoService simpleProcessDemoService;
      
      
      
    public void setSimpleProcessDemoService(
            ISimpleProcessDemoService simpleProcessDemoService) {
        this.simpleProcessDemoService = simpleProcessDemoService;
    }

    public ActionForward initSimpleProcessDemo(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
    
        FlowEngineView.setProcessData(request);
        return mapping.findForward(FORWARD_SimpleProcessDemoEdit);
    }
    
    public ActionForward showSimpleProcessDemo(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String id=FlowEngineView.setShowProcessData(request,"simpleId");
        SimpleProcessDemo simpleProcessDemo=simpleProcessDemoService.getSimpleProcessDemoById(id);
        SimpleProcessDemoForm simpleProcessDemoForm=(SimpleProcessDemoForm)this.modelToForm(simpleProcessDemo,ActionFormClass);
        request.setAttribute("SimpleProcessDemoForm",simpleProcessDemoForm);
        return mapping.findForward(FORWARD_SimpleProcessDemoEdit);
    }
    
    
    public ActionForward saveSimpleProcessDemo(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        FlowEngineView.setProcessData(request);
        return mapping.findForward(FORWARD_SimpleProcessDemoEdit);
    }
    
    public ActionForward submitSimpleProcessDemo(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Map map1 = FlowEngineView.setProcessData(request);
        SimpleProcessDemoForm simpleProcessDemoForm=(SimpleProcessDemoForm)form;
        SimpleProcessDemo simpleProcessDemo=(SimpleProcessDemo)this.formToModel(simpleProcessDemoForm,modelClass);
        String simpleId=simpleProcessDemoService.submitSimpleProcessDemo(simpleProcessDemo,map1);
        simpleProcessDemoForm.setSimpleId(simpleId);
        return FlowEngineView.getProcessForward(request,response,map1);
    }
    
    
    
    
    
    public ActionForward showSimpleProcessDemo1(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String id=FlowEngineView.setShowProcessData(request,"id");
        System.out.println("id==="+id);
        SimpleProcessDemo1 simpleProcessDemo1=simpleProcessDemoService.getSimpleProcessDemo1ById(id);
        request.setAttribute("SimpleProcessDemoForm1",simpleProcessDemo1);
        return mapping.findForward("simpleProcessDemoForm1");
    }
    
    
    public ActionForward submitSimpleProcessDemo1(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Map map1 = FlowEngineView.setProcessData(request);
        SimpleProcessDemo1 simpleProcessDemo1 = new SimpleProcessDemo1();
        simpleProcessDemo1.setId(request.getParameter("id"));
        simpleProcessDemo1.setName(request.getParameter("name"));
        simpleProcessDemo1.setSimpleId(request.getParameter("simpleId"));
        String id=simpleProcessDemoService.submitSimpleProcessDemo1(simpleProcessDemo1,map1);
        simpleProcessDemo1.setId(id);
        return FlowEngineView.getProcessForward(request,response,map1);
    }
    
    
    public ActionForward showSimpleProcessDemo2(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String id=FlowEngineView.setShowProcessData(request,"id");
        System.out.println("id==="+id);
        SimpleProcessDemo2 simpleProcessDemo2=simpleProcessDemoService.getSimpleProcessDemo2ById(id);
        request.setAttribute("SimpleProcessDemoForm2",simpleProcessDemo2);
        return mapping.findForward("simpleProcessDemoForm2");
    }
    
    
    public ActionForward submitSimpleProcessDemo2(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Map map1 = FlowEngineView.setProcessData(request);
        SimpleProcessDemo2 simpleProcessDemo2 = new SimpleProcessDemo2();
        simpleProcessDemo2.setId(request.getParameter("id"));
        simpleProcessDemo2.setName(request.getParameter("name"));
        simpleProcessDemo2.setSimpleId(request.getParameter("simpleId"));
        String id=simpleProcessDemoService.submitSimpleProcessDemo2(simpleProcessDemo2,map1);
        simpleProcessDemo2.setId(id);
        return FlowEngineView.getProcessForward(request,response,map1);
    }
    

}
