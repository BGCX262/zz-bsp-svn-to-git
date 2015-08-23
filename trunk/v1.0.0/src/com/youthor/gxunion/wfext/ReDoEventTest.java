package com.youthor.gxunion.wfext;

import java.util.Map;

import org.hibernate.Session;

import com.youthor.bsp.core.wfss.common.criterion.IActivityFormEvent;
import com.youthor.bsp.core.wfss.common.criterion.IReDoEvent;
import com.youthor.bsp.core.wfss.model.WorkItemDoen;
import com.youthor.gxunion.core.model.BaseStation;

public class ReDoEventTest implements IReDoEvent{


    public void execute(Session session, WorkItemDoen workItemDoen) {
        System.out.println("workItemDoen=="+workItemDoen.getTitle());
        System.out.println("i am here");
    }

    
}
