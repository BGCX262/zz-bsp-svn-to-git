package com.youthor.bsp.core.wfss.common.model;

import com.youthor.bsp.core.wfss.model.Route;

public class RouteHelper {
    private Route route;
    private int selectLevel;//-1 表示不能选 0可选可不选 1 表示必选
    public Route getRoute() {
        return route;
    }
    public void setRoute(Route route) {
        this.route = route;
    }
    public int getSelectLevel() {
        return selectLevel;
    }
    public void setSelectLevel(int selectLevel) {
        this.selectLevel = selectLevel;
    }
    
    

}
