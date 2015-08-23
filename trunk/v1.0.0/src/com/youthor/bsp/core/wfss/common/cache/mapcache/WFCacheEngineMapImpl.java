package com.youthor.bsp.core.wfss.common.cache.mapcache;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.core.wfss.common.cache.CacheEngineAdapter;
import com.youthor.bsp.core.wfss.common.criterion.IProcessEndEvent;
import com.youthor.bsp.core.wfss.model.Activity;
import com.youthor.bsp.core.wfss.model.Agent;
import com.youthor.bsp.core.wfss.model.AppForm;
import com.youthor.bsp.core.wfss.model.Button;
import com.youthor.bsp.core.wfss.model.Process;
import com.youthor.bsp.core.wfss.model.Route;

public class WFCacheEngineMapImpl extends CacheEngineAdapter{

    private IWfssServiceFacade wfssServiceFacade;
    public void setWfssServiceFacade(IWfssServiceFacade wfssServiceFacade) {
        this.wfssServiceFacade = wfssServiceFacade;
    }

    /**
     * 根据流程id从缓存中得到流程对象
     * @param processId
     * @return
     */
    public  Process getProcessById(String processId)
      {
          Process process=(Process)WFCacheData.mapProcessId.get(processId);
          if(process!=null)
              return process;
         process=wfssServiceFacade.getProcessById(processId);
              WFCacheData.mapProcessId.put(process.getProcessId(),process);
              Process processAliasObj=(Process)WFCacheData.mapProcessAlias.get(process.getProcessAlias()+"_"+process.getIsUsed());
              if(processAliasObj==null)
                  WFCacheData.mapProcessAlias.put(process.getProcessAlias()+"_"+process.getIsUsed(),processAliasObj);
             
              return process;
         
      }

    
    
    /**
     * 根据流程别名得从缓存中得到流程对象
     * @param processAlias
     * @return
     */
    public  Process getProcessByAlias(String processAlias,String isUsed)
    {
        Process process=(Process)WFCacheData.mapProcessAlias.get(processAlias);
        if(process!=null)
            return process;
        process=wfssServiceFacade.getProcessByAlias(processAlias,isUsed);
            WFCacheData.mapProcessAlias.put(process.getProcessAlias(),process);
            Process processIdObj=(Process)WFCacheData.mapProcessId.get(process.getProcessId());
            if(processIdObj==null)
                WFCacheData.mapProcessId.put(process.getProcessId(),processIdObj);
            return process;
        
    }
    
    
    /**
     * 根据环节id得到环节对象
     * @param activityId
     * @return
     */
    public Activity getActivityById(String activityId) {
        if(activityId==null||activityId.equals("")) return null;
        Activity activity=(Activity)WFCacheData.mapActivityId.get(activityId);
        if(activity!=null)
            return activity;
            activity=wfssServiceFacade.getActivityById(activityId);
            WFCacheData.mapActivityId.put(activity.getActivityId(),activity);
            Process process=getProcessById(activity.getProcessId());
            if(!StringHelper.doWithNull(process.getProcessAlias()).equals("")&&!StringHelper.doWithNull(activity.getActivityAlias()).equals(""))
            {
              Activity activityAliasObj=(Activity)WFCacheData.mapActivityAlias.get(process.getProcessAlias()+"_"+process.getIsUsed()+"_"+activity.getActivityAlias());
            if(activityAliasObj==null)
                WFCacheData.mapActivityAlias.put(process.getProcessAlias()+"_"+process.getIsUsed()+"_"+activity.getActivityAlias(),activityAliasObj);
            }
            return activity;
        
    }
    
    /**
     * 根据流程别名和环节别名得到环节对象
     * @param processAlias
     * @param activityAlias
     * @return
     */
    public Activity getActivityByAlias(String processAlias,String isUsed, String activityAlias) {
        if(processAlias==null||processAlias.equals("")) return null;
        if(activityAlias==null||activityAlias.equals("")) return null;
        Activity activity=(Activity)WFCacheData.mapActivityAlias.get(processAlias+"_"+isUsed+"_"+activityAlias);
            if(activity!=null)
                return activity;
                activity=wfssServiceFacade.getActivityByAlias(processAlias,isUsed, activityAlias);
                WFCacheData.mapActivityAlias.put(processAlias+"_"+isUsed+"_"+activityAlias,activity);
              Activity activityTemp=getActivityById(activity.getActivityId());
                if(activityTemp==null)
                {
                    WFCacheData.mapActivityId.put(activity.getActivityId(),activity);
                }
                return activity;
            
    }
    /**
     * 根据环节id得到此环节下的所以路由
     * @param activityId
     * @return
     */
    public List listRouteByActivityId(String activityId) {
        List listRoutes=(List)WFCacheData.mapRouteActivityId.get(activityId);
        if(listRoutes!=null) return listRoutes;
        listRoutes=wfssServiceFacade.getRouteByActivityId(activityId);
        for(int i=0;i<listRoutes.size();i++)
        {
            Route route=(Route)listRoutes.get(i);
            WFCacheData.mapRouteActivityId.put(route.getRouteId(),route);
        }
        
        return listRoutes;
    }
    /**
     * 根据路由id得到路由对象
     * @param routeId
     * @return
     */
    public Route getRouteById(String routeId) {
        Route route=(Route)WFCacheData.mapRouteId.get(routeId);
        if(route!=null) return route;
        route=wfssServiceFacade.getRouteById(routeId);
        WFCacheData.mapRouteId.put(route.getRouteId(),route);
        return route;
    }
    /**
     * 根据应用表单id得到表单对象
     * @param appFormId
     * @return
     */
    public AppForm getAppFormById(String appFormId) {
        AppForm appForm=(AppForm)WFCacheData.mapAppFormId.get(appFormId);
        if(appForm!=null) return appForm;
        appForm=wfssServiceFacade.getAppFormById(appFormId);
        WFCacheData.mapAppFormId.put(appForm.getAppFormId(),appForm);
        return appForm;
    }

    /**
     * 根据环节id得到此环节下的所以表单域对象
     * 这个方法最终要修改
     * @param activityId
     * @return
     */
    public List listAppFormFieldByAppFormId(String appFormId){
        List listAppFormField=(List)WFCacheData.mapAppFormFieldAppFormId.get(appFormId);
        if(listAppFormField!=null) return listAppFormField;
        listAppFormField=wfssServiceFacade.getAppFormFieldByFormId(appFormId);
        WFCacheData.mapAppFormFieldAppFormId.put(appFormId,listAppFormField);
        return listAppFormField;
    }

    public IProcessEndEvent getProcessEndEvent(String fliterExpr) {
    
             Map map=WFCacheData.mapWfExt;
             Item item=(Item)map.get(fliterExpr);
             Class classProcessEndEvent=null;
             IProcessEndEvent processEndEvent=null;
            try {
                classProcessEndEvent = WFCacheEngineMapImpl.class.getClassLoader().loadClass(item.getValue());
                processEndEvent = (IProcessEndEvent)classProcessEndEvent.newInstance();
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } 
             return processEndEvent;
        }

    
    public List listActivitysByProcessId(String processId) {
        
        List listActivitys=(List)WFCacheData.mapActivityProcessId.get(processId);
        if(listActivitys!=null) return listActivitys;
        listActivitys=wfssServiceFacade.getActivityByProcessId(processId);
        WFCacheData.mapActivityProcessId.put(processId,listActivitys);
        return listActivitys;
        
        
    }

    
    public List getAllAppForm(String appId) {
        Map map = WFCacheData.mapAppFormId;
        List list = new ArrayList();
        if (map!=null && !map.isEmpty()){
            Iterator iterator = map.keySet().iterator();
            while(iterator.hasNext()) {
                
                AppForm appForm = (AppForm)map.get((String)iterator.next());
                if (appForm.getAppId().equals(appId)) {
                list.add(appForm);
                }
            }
        }
        else {
            list = wfssServiceFacade.getAppFormByAppId(appId);
            if (list!=null&&list.size()>0){
            for(int i=0;i<list.size();i++) {
                AppForm appForm = (AppForm)list.get(i);
                map.put(appForm.getAppFormId(), appForm);
             }
            }
        }
        return list;
    }

    
    public Button getButtonByCode(String code) {
        Map map = WFCacheData.mapButton;
        if (map.isEmpty()) {
            List list = wfssServiceFacade.getAllButton();
            if (list!=null&&list.size()>0){
            for(int i=0;i<list.size();i++) {
                Button button = (Button)list.get(i);
                map.put(button.getButtonStyleId(), button);
             }
            }
        }
        Button button = (Button)map.get(code);
        return button;
    }

	@Override
	public Agent getAgentById(String orgId) {
		
		return (Agent)WFCacheData.mapAgent.get(orgId);
	}

}
