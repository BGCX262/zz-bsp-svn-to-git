package com.youthor.gxunion.wfext;

import java.util.List;
import java.util.Map;

import org.hibernate.Session;

import com.youthor.bsp.core.demo.model.SimpleProcessDemo2;
import com.youthor.bsp.core.wfss.common.criterion.IActivityFormEvent;

public class InitBranchForm2 implements IActivityFormEvent{

    @Override
    public Map execute(Map map, String preAppId, Session session,List ownerOrgs) {
        SimpleProcessDemo2 simpleProcessDemo2 = new SimpleProcessDemo2();
        simpleProcessDemo2.setSimpleId(preAppId);
        simpleProcessDemo2.setName("分支环节测试2");
        session.save(simpleProcessDemo2);
        map.put("NEW_PROCESS_FORM_ID", simpleProcessDemo2.getId());
        map.put("NEW_PROCESS_FORM_TITLE", simpleProcessDemo2.getName());
        return map;
    }

}
