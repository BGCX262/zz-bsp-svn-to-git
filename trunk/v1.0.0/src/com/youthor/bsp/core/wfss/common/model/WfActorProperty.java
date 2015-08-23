package com.youthor.bsp.core.wfss.common.model;

import java.util.ArrayList;
import java.util.List;

import com.youthor.bsp.core.wfss.model.Route;

public class WfActorProperty {
    private Route route;//当前路由
    private String overTime;//超时设置
    private List ownerOrgs=new ArrayList(); //处理者设置
    public String getOverTime() {
        return overTime;
    }
    public void setOverTime(String overTime) {
        this.overTime = overTime;
    }
    public List getOwnerOrgs() {
        return ownerOrgs;
    }
    public void setOwnerOrgs(List ownerOrgs) {
        this.ownerOrgs = ownerOrgs;
    }
    public Route getRoute() {
        return route;
    }
    public void setRoute(Route route) {
        this.route = route;
    }
    
    

}
