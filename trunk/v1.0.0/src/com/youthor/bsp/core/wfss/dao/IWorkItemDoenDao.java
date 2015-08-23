package com.youthor.bsp.core.wfss.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.wfss.model.WorkItemDoen;

public interface IWorkItemDoenDao {

    List listWorkItemDoen(Page page, String orgId);
    WorkItemDoen getWorkItemDoenById(String workItemId);
    void deleteWorkItemDoen(WorkItemDoen workItemDoen);
    void createWorkItemDoen(WorkItemDoen workItemDoen);
    WorkItemDoen getWorkItemDoenProcessInst(String processInstId,
            String appId, String appFormId,String owner);

}
