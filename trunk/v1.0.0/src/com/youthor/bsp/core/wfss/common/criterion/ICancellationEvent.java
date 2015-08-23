package com.youthor.bsp.core.wfss.common.criterion;

import java.util.Map;

import org.hibernate.Session;

public interface ICancellationEvent {
    boolean execute(Session session,String appId);
}
