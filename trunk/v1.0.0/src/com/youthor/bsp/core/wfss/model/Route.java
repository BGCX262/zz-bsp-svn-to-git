/**
 * 
 */
package com.youthor.bsp.core.wfss.model;

import java.io.Serializable;


public class Route implements Serializable{
    
    private static final long serialVersionUID = -5082154013481920196L;
    
    private String routeId;
    private String processId; 
    private String activityId;
    private String routeName; 
    private String routeAlias;
    private String toProcessId;
    private String toActivityRule;
    private String toActivityId;
    private String toActivityEvent;
    private String fliterExpr;
    private String isPointToEnd;
    private String isDefaultRoute;
    private String isRejectRoute;
    private String andRoute;
    private String xorRoute;
    private String memo;
    private float orderIndex;
    private String participantExpr;
    private String xorStrategy;
    private float xorStrategyScale;
    private String isButton;
    private String batchFlag;
    public String getBatchFlag() {
        return batchFlag;
    }
    public void setBatchFlag(String batchFlag) {
        this.batchFlag = batchFlag;
    }
    public String getParticipantExpr() {
        return participantExpr;
    }
    public void setParticipantExpr(String participantExpr) {
        this.participantExpr = participantExpr;
    }
    public String getActivityId() {
        return activityId;
    }
    public void setActivityId(String activityId) {
        this.activityId = activityId;
    }
    public String getAndRoute() {
        return andRoute;
    }
    public void setAndRoute(String andRoute) {
        this.andRoute = andRoute;
    }
    public String getFliterExpr() {
        return fliterExpr;
    }
    public void setFliterExpr(String fliterExpr) {
        this.fliterExpr = fliterExpr;
    }
    public String getIsDefaultRoute() {
        return isDefaultRoute;
    }
    public void setIsDefaultRoute(String isDefaultRoute) {
        this.isDefaultRoute = isDefaultRoute;
    }
    public String getIsPointToEnd() {
        return isPointToEnd;
    }
    public void setIsPointToEnd(String isPointToEnd) {
        this.isPointToEnd = isPointToEnd;
    }
    public String getIsRejectRoute() {
        return isRejectRoute;
    }
    public void setIsRejectRoute(String isRejectRoute) {
        this.isRejectRoute = isRejectRoute;
    }
    public String getMemo() {
        return memo;
    }
    public void setMemo(String memo) {
        this.memo = memo;
    }
    public float getOrderIndex() {
        return orderIndex;
    }
    public void setOrderIndex(float orderIndex) {
        this.orderIndex = orderIndex;
    }
    public String getProcessId() {
        return processId;
    }
    public void setProcessId(String processId) {
        this.processId = processId;
    }
    public String getRouteAlias() {
        return routeAlias;
    }
    public void setRouteAlias(String routeAlias) {
        this.routeAlias = routeAlias;
    }
    public String getRouteId() {
        return routeId;
    }
    public void setRouteId(String routeId) {
        this.routeId = routeId;
    }
    public String getRouteName() {
        return routeName;
    }
    public void setRouteName(String routeName) {
        this.routeName = routeName;
    }
    

    public String getToActivityId() {
        return toActivityId;
    }
    public void setToActivityId(String toActivityId) {
        this.toActivityId = toActivityId;
    }
    public String getToActivityRule() {
        return toActivityRule;
    }
    public void setToActivityRule(String toActivityRule) {
        this.toActivityRule = toActivityRule;
    }
    
    public String getToActivityEvent() {
        return toActivityEvent;
    }
    public void setToActivityEvent(String toActivityEvent) {
        this.toActivityEvent = toActivityEvent;
    }
    public String getToProcessId() {
        return toProcessId;
    }
    public void setToProcessId(String toProcessId) {
        this.toProcessId = toProcessId;
    }
    public String getXorRoute() {
        return xorRoute;
    }
    public void setXorRoute(String xorRoute) {
        this.xorRoute = xorRoute;
    }
    public String getXorStrategy() {
        return xorStrategy;
    }
    public void setXorStrategy(String xorStrategy) {
        this.xorStrategy = xorStrategy;
    }
    public float getXorStrategyScale() {
        return xorStrategyScale;
    }
    public void setXorStrategyScale(float xorStrategyScale) {
        this.xorStrategyScale = xorStrategyScale;
    }
    public String getIsButton() {
        return isButton;
    }
    public void setIsButton(String isButton) {
        this.isButton = isButton;
    }
    
    
    
        
}
