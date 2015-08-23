package com.youthor.gxunion.wfext;

import java.util.List;
import java.util.Map;

import org.hibernate.Session;

import com.youthor.bsp.core.wfss.common.criterion.IActivityFormEvent;
import com.youthor.gxunion.core.model.BaseStation;

public class BackBaseFormEvent implements IActivityFormEvent{

    public Map execute(Map map,String preAppId,Session session,List ownerOrgs) {
        // TODO Auto-generated method stub
    
        map.put("NEW_PROCESS_FORM_ID", "402881e52042f2f0012042fa397a0001");
        map.put("NEW_PROCESS_FORM_TITLE", "我回退了啊");
        return map;
    }

}
