/**
 * 
 */
package com.youthor.bsp.view.wfss.web.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.core.wfss.common.cache.mapcache.WFCacheData;
import com.youthor.bsp.core.wfss.model.Route;
import com.youthor.bsp.core.wfss.model.Activity;
import com.youthor.bsp.view.abdf.common.base.BaseStrutsAction;
import com.youthor.bsp.view.wfss.web.form.RouteForm;

/**
 * @author 胡友成 2007-11-20
 * 
 */
public class RouteAction extends BaseStrutsAction {

    private static final String FORWARD_RouteList = "routeList";

    private static final String FORWARD_RouteEdit = "routeEdit";

    private static final String FORWARD_DelToList = "delToList";

    private static final String ActionFormClass = "com.youthor.bsp.view.wfss.web.form.RouteForm";

    private static final String modelClass = "com.youthor.bsp.core.wfss.model.Route";

    private IWfssServiceFacade wfssServiceFacade;

    public void setWfssServiceFacade(IWfssServiceFacade wfssServiceFacade) {
        this.wfssServiceFacade = wfssServiceFacade;
    }

    public ActionForward initRoute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        RouteForm routeFrom = (RouteForm) form;
        String activityId = request.getParameter("activityId");
        Activity activity = wfssServiceFacade.getActivityById(activityId);
        request.setAttribute("activity", activity);
        routeFrom.setToProcessId(activity.getProcessId());
        request.setAttribute("toProcessId",activity.getProcessId());
        routeFrom.setIsDefaultRoute("N");
        routeFrom.setIsPointToEnd("N");
        routeFrom.setIsRejectRoute("N");
        routeFrom.setToActivityRule("toActivity");
        return mapping.findForward(FORWARD_RouteEdit);
    }

    public ActionForward saveRoute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        RouteForm routeFrom = (RouteForm) form;
        Route route = (Route) this.formToModel(routeFrom, modelClass);

        if (StringHelper.doWithNull(route.getRouteId()).equals("")) {
            wfssServiceFacade.addRoute(route);
            routeFrom.setRouteId(route.getRouteId());
            request.setAttribute("reloadTree", "true");    

        } else {
            wfssServiceFacade.updateRoute(route);
            String routeNameOld=request.getParameter("routeNameOld");
            if(routeNameOld==null) routeNameOld="";
            if(!routeNameOld.equals(route.getRouteName()))
            {
                request.setAttribute("reloadTree", "true");
            }
            String orderIndexOld=request.getParameter("orderIndexOld");
            float orderIndexOldF=Float.parseFloat(orderIndexOld);
            
            if(orderIndexOldF!=route.getOrderIndex())
            {
                request.setAttribute("reloadTree", "true");
            }
            
            
        }
        WFCacheData.mapRouteId.clear();
        WFCacheData.mapRouteActivityId.clear();
        
        Activity activity = wfssServiceFacade.getActivityById(route.getActivityId());
        request.setAttribute("activity", activity);
        request.setAttribute("toProcessId",activity.getProcessId());
        
        return mapping.findForward(FORWARD_RouteEdit);
    }

    public ActionForward showRoute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        RouteForm routeForm = (RouteForm) form;
        Route route = wfssServiceFacade.getRouteById(routeForm
                .getRouteId());
        routeForm = (RouteForm) this.modelToForm(route, ActionFormClass);
        request.setAttribute("RouteForm", routeForm);

        Activity activity = wfssServiceFacade.getActivityById(routeForm.getActivityId());
        request.setAttribute("activity", activity);
        request.setAttribute("toProcessId",activity.getProcessId());
        
        routeForm.setToActivityRule("toActivity");
        
        return mapping.findForward(FORWARD_RouteEdit);
    }

    public ActionForward deleteRoute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String[] ids = request.getParameterValues("itemIdCheckBox");
        wfssServiceFacade.deleteRouteByIds(ids);
        request.setAttribute("reloadTree", "true");
        return mapping.findForward(FORWARD_DelToList);
    }

}
