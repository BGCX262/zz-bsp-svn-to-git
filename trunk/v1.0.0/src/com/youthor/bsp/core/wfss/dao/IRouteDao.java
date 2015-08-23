/**
 * 
 */
package com.youthor.bsp.core.wfss.dao;

import java.util.List;

import com.youthor.bsp.core.wfss.model.Route;


public interface IRouteDao {
    public List getRouteByProcessId(String processId);
    public String addRoute(Route route);
    public String updateRoute(Route route);
    public boolean deleteRouteByIds(String [] ids);
    public Route getRouteById(String id);
    public List getRouteByActivityId(String activityId);    
}
