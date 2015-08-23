package com.youthor.bsp.view.wfss.common.criterion;



import javax.servlet.http.HttpServletRequest;

public interface IActivityStartEvent {
    /**
     * 如果返回null或者""表示此节可以启动，无需等待外部资源。
     * 如果返回非空字符，表示必然等待外部的某种资源才可以启动
     * @param request
     * @return
     */
    String execute(HttpServletRequest request);

}
