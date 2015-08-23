package com.youthor.gxunion.wfext;

import java.util.Map;

import org.hibernate.Session;

import com.youthor.bsp.core.wfss.common.criterion.IActivityFormEvent;
import com.youthor.bsp.core.wfss.common.criterion.ICancellationEvent;
import com.youthor.bsp.core.wfss.common.criterion.IHangEvent;
import com.youthor.bsp.core.wfss.common.criterion.IReDoEvent;
import com.youthor.bsp.core.wfss.model.WorkItemDoen;
import com.youthor.gxunion.core.model.BaseStation;

public class HangEventTest implements IHangEvent{

    public boolean execute(Session session, String appId,String flag) {
        System.out.println("appId==="+appId);
        return true;
        
    }


    
    
}
