package com.youthor.gxunion.wfext;

import java.util.List;
import java.util.Map;

import org.hibernate.Session;

import com.youthor.bsp.core.wfss.common.criterion.IActivityFormEvent;
import com.youthor.gxunion.core.model.BaseStation;

public class InitBaseFormEvent implements IActivityFormEvent{

    public Map execute(Map map,String preAppId,Session session,List ownerOrgs) {
        // TODO Auto-generated method stub
        BaseStation baseStation =new BaseStation();
        baseStation.setCode("code");
        baseStation.setName("name");
        baseStation.setEastLongitude(0f);
        baseStation.setEastLongitude2(0f);
        session.save(baseStation);
        map.put("NEW_PROCESS_FORM_ID", baseStation.getId());
        map.put("NEW_PROCESS_FORM_TITLE", "新的表单标题生成了");
        return map;
    }

}
