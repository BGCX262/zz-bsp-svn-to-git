package com.youthor.bsp.core.wfss.common.criterion;

import org.hibernate.Session;

public interface IHangEvent {
    boolean execute(Session session,String appId,String flag);
}
