package com.youthor.bsp.view.wfss.common.criterion;



import javax.servlet.http.HttpServletRequest;

public interface IRouteFliter {
    /**
     * -1 表示不能选 0可选可不选 1 表示必选
     */
    int execute(HttpServletRequest request);

}
