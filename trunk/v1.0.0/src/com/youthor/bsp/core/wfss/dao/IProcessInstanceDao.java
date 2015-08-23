package com.youthor.bsp.core.wfss.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.wfss.model.Process;
import com.youthor.bsp.core.wfss.model.ProcessInstance;

public interface IProcessInstanceDao {

    List listProcessInstByOrgId(Page page, String orgId);

    ProcessInstance getProcessInstById(String id);

    boolean cancelProcessInst(ProcessInstance processInstance, Process process);

    boolean hangProcessInst(ProcessInstance processInstance, Process process);

    boolean cancelHangProcessInst(ProcessInstance processInstance,
            Process process);

    List getDBActInsByProInstActId(String processInstanceId, String activityId);

List getActivityInstByProInsId(String processInstanceId, String joinId);

int getDBCountByProInstActIdJoinId(String processInstanceId,
String activityId, String joinId);

}
