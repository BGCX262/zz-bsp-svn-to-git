package com.youthor.gxunion.wfext;

import java.util.Map;

import org.hibernate.Session;

import com.youthor.bsp.core.wfss.common.criterion.IActivityFormEvent;
import com.youthor.bsp.core.wfss.common.criterion.ICancellationEvent;
import com.youthor.bsp.core.wfss.common.criterion.IReDoEvent;
import com.youthor.bsp.core.wfss.model.WorkItemDoen;
import com.youthor.gxunion.core.model.BaseStation;

public class CancelEventTest implements ICancellationEvent{

    public boolean execute(Session session, String appId) {
        System.out.println("appId==="+appId);
        return true;
        
    }


    
    
}
