package com.youthor.gxunion.wfext;

import java.util.List;
import java.util.Map;

import org.hibernate.Session;

import com.youthor.bsp.core.demo.model.SimpleProcessDemo1;
import com.youthor.bsp.core.wfss.common.criterion.IActivityFormEvent;

public class InitBranchForm1 implements IActivityFormEvent{

    @Override
    public Map execute(Map map, String preAppId, Session session,List ownerOrgs) {
        SimpleProcessDemo1 simpleProcessDemo1 = new SimpleProcessDemo1();
        simpleProcessDemo1.setSimpleId(preAppId);
        simpleProcessDemo1.setName("分支环节测试1");
        session.save(simpleProcessDemo1);
        map.put("NEW_PROCESS_FORM_ID", simpleProcessDemo1.getId());
        map.put("NEW_PROCESS_FORM_TITLE", simpleProcessDemo1.getName());
        return map;
    }

}
