package com.youthor.bsp.core.wfss.common.criterion;

import java.util.Map;

import org.hibernate.Session;



public interface IProcessEndEvent {
    void execute(Session session,Map map);
}
