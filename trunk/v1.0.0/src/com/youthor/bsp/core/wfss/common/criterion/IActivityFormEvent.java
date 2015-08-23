package com.youthor.bsp.core.wfss.common.criterion;

import java.util.List;
import java.util.Map;

import org.hibernate.Session;



public interface IActivityFormEvent {
    /**
     * 。
     * 
     * @return
     */
    Map execute(Map map,String preAppId,Session session,List ownerOrgs);
}
