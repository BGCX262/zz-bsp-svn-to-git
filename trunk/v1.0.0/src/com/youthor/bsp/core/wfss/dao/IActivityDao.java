/**
 * 
 */
package com.youthor.bsp.core.wfss.dao;

import java.util.List;

import com.youthor.bsp.core.wfss.model.Activity;


public interface IActivityDao {
    public List getActivityByProcessId(String processId);
    public String addActivity(Activity activity);
    public String updateActivity(Activity activity);
    public boolean deleteActivityByIds(String [] ids);
    public Activity getActivityById(String id);
    public Activity getActivityByAlias(String processAlias,String isUsed, String activityAlias);
	public Activity getActivityByProIdAlias(String processId,
			String activityAlias);    
}
