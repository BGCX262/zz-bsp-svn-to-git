package com.youthor.bsp.core.wfss.common.criterion;

import java.util.Map;

import org.hibernate.Session;

import com.youthor.bsp.core.wfss.model.WorkItemDoen;

public interface IReDoEvent {
    void execute(Session session,WorkItemDoen workItemDoen);
}
