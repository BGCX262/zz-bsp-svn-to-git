package com.youthor.bsp.core.wfss.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.wfss.model.WorkItemDoing;

public interface IWorkItemDoingDao {

    List listWorkItemDoing(Page page, String orgId);

    WorkItemDoing getWorkItemDoingById(String workItemId);

    WorkItemDoing getWorkItemDoingByOrgId(String orgId);

    int getWorkItemDoIngNumByActivityInstanceIdWithOutSelf(String activityInstanceId,String workItemId);

    void deleteWorkItemDoing(WorkItemDoing workItemDoing);

    void addWorkItemDoing(WorkItemDoing workItemDoingNew);

    void updateWorkItemDoing(WorkItemDoing workItemDoing);

    WorkItemDoing getWorkItemDoingByActInsId(String activityInstanceId);

    WorkItemDoing getWorkItemDoingProcessInst(String processInstId,
            String appId, String appFormId,String owner);

}
