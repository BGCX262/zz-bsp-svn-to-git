package com.youthor.bsp.core.wfss.common.cache;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.core.wfss.common.cache.mapcache.WFCacheData;
import com.youthor.bsp.core.wfss.common.criterion.IProcessEndEvent;
import com.youthor.bsp.core.wfss.model.Activity;
import com.youthor.bsp.core.wfss.model.Agent;
import com.youthor.bsp.core.wfss.model.AppForm;
import com.youthor.bsp.core.wfss.model.Button;
import com.youthor.bsp.core.wfss.model.Process;
import com.youthor.bsp.core.wfss.model.Route;


public interface IWFCacheEngine {
    /**
     * 根据流程id从缓存中得到流程对象
     * @param processId
     * @return
     */
    public  Process getProcessById(String processId);
    /**
     * 根据流程别名得从缓存中得到流程对象
     * @param processAlias
     * @return
     */
    public  Process getProcessByAlias(String processAlias,String isUsed);
    /**
     * 根据环节id得到环节对象
     * @param activityId
     * @return
     */
    public  Activity getActivityById(String activityId);
    /**
     * 根据流程别名和环节别名得到环节对象
     * @param processAlias
     * @param activityAlias
     * @return
     */
    public  Activity getActivityByAlias(String processAlias,String isUsed,String activityAlias);
    /**
     * 根据环节id得到此环节下的所以路由
     * @param activityId
     * @return
     */
    public List listRouteByActivityId(String activityId);
    /**
     * 根据路由id得到路由对象
     * @param routeId
     * @return
     */
    public Route getRouteById(String routeId);
    /**
     * 根据应用表单id得到表单对象
     * @param appFormId
     * @return
     */
    public AppForm getAppFormById(String appFormId);
    
    
    /**
     * 根据环节id得到此环节下的所以表单域对象
     * @param activityId
     * @return
     */
    public List listActivitysByProcessId(String processId);
    
    /**
     * 根据流程id得到此流程下的所以环节对象
     * 这个方法最终要修改
     * @param activityId
     * @return
     */
    public List listAppFormFieldByAppFormId(String appFormId);
    
    
    public void printlnProcessIdMap();
    
    public IProcessEndEvent getProcessEndEvent(String fliterExpr);
    
    public List getAllAppForm(String appId);
    public Button getButtonByCode(String code);
	public Agent getAgentById(String orgId);
        

}
