package com.youthor.bsp.view.abdf.web.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.model.SystemConf;
import com.youthor.bsp.core.facade.IAbdfServiceFacade;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;

/**
 * 系统参数配置信息
 * @author jason
 *
 */
public class SystemConfAction extends BaseStrutsAction {
    
    private static final String FORWARD_SYSTEMCONF_EDIT = "systemConfEdit";
    private static final String FORWARD_SYSTEMCONF_SAVE = "systemConfSave";
    private IAbdfServiceFacade abdfServiceFacade;
    
    public ActionForward showSystemConf(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        List list = abdfServiceFacade.getAllSystemConf();
        Map groupMap = new HashMap();
        if(list != null){
            int size = list.size();
            for(int i = 0; i < size; i++){
                SystemConf systemConf =(SystemConf)list.get(i);
                
                if(groupMap.get(systemConf.getGroupName()) == null){
                    List groupList = new ArrayList();
                    groupList.add(systemConf);
                    groupMap.put(systemConf.getGroupName(), groupList);
                }
                else{
                    List groupList = (List)groupMap.get(systemConf.getGroupName());
                    groupList.add(systemConf);
                }
            }
        }
        request.setAttribute("groupMap",groupMap);
        return mapping.findForward(FORWARD_SYSTEMCONF_EDIT);
    }

    public ActionForward saveSystemConf(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        List list = abdfServiceFacade.getAllSystemConf();
        for(int i=0;i<list.size();i++) {
            SystemConf systemConf =(SystemConf)list.get(i);
            String inputType = systemConf.getInputType() == null ? "text" : systemConf.getInputType();
            if (!inputType.equalsIgnoreCase("checkbox")) {
                String value = request.getParameter(systemConf.getKey());
                systemConf.setValue(value);
                abdfServiceFacade.updateSystemConf(systemConf);            
            }
        }
        return mapping.findForward(FORWARD_SYSTEMCONF_SAVE);
    }
    
    public IAbdfServiceFacade getAbdfServiceFacade() {
        return abdfServiceFacade;
    }

    public void setAbdfServiceFacade(IAbdfServiceFacade abdfServiceFacade) {
        this.abdfServiceFacade = abdfServiceFacade;
    }
}
