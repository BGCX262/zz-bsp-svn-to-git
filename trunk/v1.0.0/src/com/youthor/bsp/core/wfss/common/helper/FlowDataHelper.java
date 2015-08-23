package com.youthor.bsp.core.wfss.common.helper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.urss.model.Org;

import com.youthor.bsp.core.wfss.common.Constants;
import com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine;
import com.youthor.bsp.core.wfss.common.model.WfActorProperty;
import com.youthor.bsp.core.wfss.common.model.WfOrg;
import com.youthor.bsp.core.wfss.model.Route;

public class FlowDataHelper {
    public static String getValueByKey(String key,Map map)
    {
        Object o = map.get(key);
        if(o instanceof String) {
            return (String)o;
        }
        String [] values=(String[])o;
        String value=values[0];
        return value;
    }
    
    public static String [] getValuesByKey(String key,Map map)
    {
        String [] values=(String[])map.get(key);
        return values;
    }
    
    public static List getSubmitRuoteInfo(String appId,Map map)
    {
        //路由id][处理人id集合(以,分隔)][处理人名称集合(以,分隔)][处理人类型集合(以,分隔)}
        //路由id][处理人id集合(以,分隔)][处理人名称集合(以,分隔)][处理人类型集合(以,分隔)
        //这里处理人可能是员工/组织/角色/岗位[目前只做了员工处理]
        String routeInfo=FlowDataHelper.getValueByKey("SUBMIT_ROUTE_VALUE",map);
        String [] routeValues=StringHelper.split(routeInfo,"}");
        List submitRouteInfo=new ArrayList();
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
        for(int i=0;i<routeValues.length;i++)
        {
            String [] itemRoutes=StringHelper.split(routeValues[i],"][");
            WfActorProperty wfActorProperty=new WfActorProperty();
            Route route=wfCacheEngine.getRouteById(itemRoutes[0]);
            //处理流程结束---没有选择人员(没有选择人员就是流程结束??)
            wfActorProperty.setRoute(route);
            if(itemRoutes.length==2)
            {
                submitRouteInfo.add(wfActorProperty);
                return submitRouteInfo;
            }
            String orgIds=itemRoutes[1];
            String orgNames=itemRoutes[2];
            String orgTypes=itemRoutes[3];
            String [] orgIdsArr=StringHelper.split(orgIds,",");
            String [] orgNamesArr=StringHelper.split(orgNames,",");
            String [] orgTypesArr=StringHelper.split(orgTypes,",");
            List ownerOrgs=new ArrayList(); //处理者设置
            //注意这里的appId设置只设了一个，对于不是分单的流程是适用的，
            //但是对于分单的流程是不适用的，因为分单后的appid各个分支是不一样的
            //如果是组织/角色/岗位，还要查询出这个下面的所有员工，这里应该还要查询出路由指向的
            //环节是单人处理还是多人处理，如果是单人处理，则只能设置一个人，如果是多人处理，把所有人
            //全部加入????
            for(int j=0;j<orgIdsArr.length;j++)
            {
               
                WfOrg wfOrg=new WfOrg();
                wfOrg.setAppId(appId);
                wfOrg.setOrgId(orgIdsArr[j]);
                wfOrg.setOrgName(orgNamesArr[j]);
                wfOrg.setOrgType(orgTypesArr[j]);
                ownerOrgs.add(wfOrg);
            }
            wfActorProperty.setOwnerOrgs(ownerOrgs);
            submitRouteInfo.add(wfActorProperty);
        }
        return submitRouteInfo;
    }
    
    public static WfOrg orgToWfOrg(Org org)
    {
        WfOrg wfOrg=new WfOrg();
        wfOrg.setOrgId(org.getOrgId());
        wfOrg.setOrgName(org.getOrgName());
        wfOrg.setOrgType(org.getOrgTypeCode());
        return wfOrg;
    }
    
    
    public static String getDesBySubmitStates(String submitStates)
    {
        
        if(submitStates==null) return "";
        
        String returnValue="";
        if(submitStates.equals(Constants.WF_SUBMIT_STATES_TJ))
        {
            returnValue="提交";
        }
        else if(submitStates.equals(Constants.WF_SUBMIT_STATES_TZ))
        {
            returnValue="通知";
        }
        else if(submitStates.equals(Constants.WF_JH))
        {
            returnValue="激活";
        }
        else if(submitStates.equals(Constants.WF_TLZ))
        {
            returnValue="停留在";
        }
        else if(submitStates.equals(Constants.WF_SUBMIT_STATES_JUMP))
        {
            returnValue="JUMP";
        }
        
        return returnValue;
    }
    
    public static String getDesByDisposalStatesWithRed(String disposalStates)
    {
        if(disposalStates==null) return "";
        String returnValue="";
        if(disposalStates.equals(Constants.WF_DB))
        {
            returnValue="&nbsp;&nbsp;<font color='red'>未处理</font>";
        }
        else if(disposalStates.equals(Constants.WF_YB))
        {
            returnValue="&nbsp;&nbsp;处理完成";
        }
        else if(disposalStates.equals(Constants.WF_DDJH))
        {
            returnValue="&nbsp;&nbsp;<font color='red'>等待激活</font>";
        }
        else if(disposalStates.equals(Constants.WF_DDQR))
        {
            returnValue="&nbsp;&nbsp;<font color='red'>等待确认</font>";
        }
        else if(disposalStates.equals(Constants.WF_TRDB))
        {
            returnValue="&nbsp;&nbsp;他人代办";
        }
        else if(disposalStates.equals(Constants.WF_SHDB))
        {
            returnValue="&nbsp;&nbsp;系统收回待办";
        }
        
        return returnValue;
    }
    
    
    
    
    
} 
