package com.youthor.gxunion.wfext;

import java.util.List;
import java.util.Map;

import org.hibernate.Session;

import com.youthor.bsp.core.demo.model.SimpleProcessDemo;
import com.youthor.bsp.core.demo.model.SimpleProcessDemo1;
import com.youthor.bsp.core.demo.model.SimpleProcessDemo2;
import com.youthor.bsp.core.wfss.common.criterion.IActivityFormEvent;

public class InitJoinA implements IActivityFormEvent{
      public Map execute(Map map, String preAppId, Session session,List ownerOrgs) {
      //得到当前环节
    String wfss_appFormCode =(String) map.get("wfss_appFormCode");
    //从branch_1分支聚合过来
    String appId = "";
    if(wfss_appFormCode.equalsIgnoreCase("branch_1")) {
      SimpleProcessDemo1  simpleProcessDemo1= (SimpleProcessDemo1)session.load(SimpleProcessDemo1.class, preAppId);
      appId = simpleProcessDemo1.getSimpleId();
    }
    else if (wfss_appFormCode.equalsIgnoreCase("branch_2")){
        SimpleProcessDemo2  simpleProcessDemo2= (SimpleProcessDemo2)session.load(SimpleProcessDemo2.class, preAppId);
        appId = simpleProcessDemo2.getSimpleId();
    }
    SimpleProcessDemo  simpleProcessDemo= (SimpleProcessDemo)session.load(SimpleProcessDemo.class, appId);
    map.put("NEW_PROCESS_FORM_ID",appId);
    map.put("NEW_PROCESS_FORM_TITLE", simpleProcessDemo.getTextDemo());
    // SimpleProcessDemo  = 
    return map;
      }
}
