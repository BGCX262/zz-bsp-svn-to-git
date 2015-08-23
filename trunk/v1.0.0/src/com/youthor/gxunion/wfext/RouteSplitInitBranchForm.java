package com.youthor.gxunion.wfext;

import java.util.List;
import java.util.Map;

import org.hibernate.Session;

import com.youthor.bsp.core.demo.model.SimpleProcessDemo1;
import com.youthor.bsp.core.wfss.common.criterion.IActivityFormEvent;
import com.youthor.bsp.core.wfss.common.model.WfOrg;

public class RouteSplitInitBranchForm implements IActivityFormEvent{

    @Override
    public Map execute(Map map, String preAppId, Session session,List ownerOrgs) {
    	 if(ownerOrgs!=null && ownerOrgs.size()>0) {
             for(int n = 0;n<ownerOrgs.size();n++) {
                WfOrg wfOrgTemp=(WfOrg)ownerOrgs.get(n);
                
                SimpleProcessDemo1 simpleProcessDemo1 = new SimpleProcessDemo1();
                simpleProcessDemo1.setSimpleId(preAppId);
                simpleProcessDemo1.setName("路由分单环节测试"+n);
                session.save(simpleProcessDemo1);
                
                wfOrgTemp.setAppId(simpleProcessDemo1.getId());
             }
         }
         
    map.put("NEW_PROCESS_FORM_TITLE", "路由分单环节测试");
            
            return map;
    }

}
