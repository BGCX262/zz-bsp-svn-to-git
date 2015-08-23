package com.youthor.bsp.core.wfss.model;

import java.io.Serializable;
import java.util.Date;

public class RouteInstance implements Serializable{
    private static final long serialVersionUID = -3822643903726988682L;
    private String routeInstanceId; 
    private String processInstanceId; 
    private String fromActivityinstId; 
    private String toActivityinstId; 
    private String routeId; 
    private String routeName; 
    private Date createDate;
    public Date getCreateDate() {
        return createDate;
    }
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    public String getFromActivityinstId() {
        return fromActivityinstId;
    }
    public void setFromActivityinstId(String fromActivityinstId) {
        this.fromActivityinstId = fromActivityinstId;
    }
    public String getProcessInstanceId() {
        return processInstanceId;
    }
    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
    }
    public String getRouteId() {
        return routeId;
    }
    public void setRouteId(String routeId) {
        this.routeId = routeId;
    }
    public String getRouteInstanceId() {
        return routeInstanceId;
    }
    public void setRouteInstanceId(String routeInstanceId) {
        this.routeInstanceId = routeInstanceId;
    }
    public String getRouteName() {
        return routeName;
    }
    public void setRouteName(String routeName) {
        this.routeName = routeName;
    }
    public String getToActivityinstId() {
        return toActivityinstId;
    }
    public void setToActivityinstId(String toActivityinstId) {
        this.toActivityinstId = toActivityinstId;
    }
    
}
