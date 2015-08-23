package com.youthor.bsp.view.wfss.common.plugin;

import java.util.List;

import javax.servlet.ServletException;

import org.apache.struts.action.ActionServlet;
import org.apache.struts.action.PlugIn;
import org.apache.struts.config.ModuleConfig;

import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.core.wfss.common.cache.mapcache.WFCacheData;
import com.youthor.bsp.core.wfss.model.Agent;
import com.youthor.bsp.view.wfss.common.criterion.WfExtFactory;

public class InitFlowDataPlugIn implements PlugIn{
public String getCacheType() {
        return cacheType;
    }

    public void setCacheType(String cacheType) {
        this.cacheType = cacheType;
    }

public void destroy() {
        
    }

    private String cacheType ;

    public void init(ActionServlet servlet, ModuleConfig arg1) throws ServletException {
        try {
            WfExtFactory.setWfExtCache(servlet.getServletContext(), cacheType);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        //得到代理人
        IWfssServiceFacade wfssServiceFacade =(IWfssServiceFacade)SpringHelper.getBean("wfssServiceFacade");
        List list = wfssServiceFacade.getAllAgent();
        if(list!=null && list.size()>0) {
            for(int i=0;i<list.size();i++) {
                Agent agent = (Agent)list.get(i);
                WFCacheData.mapAgent.put(agent.getOrgId(), agent);
            }
        }
        
    }


}
