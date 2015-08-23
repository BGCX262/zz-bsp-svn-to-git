package com.youthor.bsp.core.wfss.dao.impl;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.wfss.dao.IRouteDao;
import com.youthor.bsp.core.wfss.model.Route;

public class RouteDaoImpl  extends BaseDAOHibernate implements  IRouteDao{

    protected Class getModelClass() {
        return Route.class;
    }

    
    public List getRouteByProcessId(String processId) {
        String hql="from "+getModelClass().getName()+" as c where c.processId=?";
        List para=new ArrayList();
        para.add(processId);
        return super.doFindObjectListByParam(hql,para);
    }
    
    public String addRoute(Route route) {
        super.doCreateObject(route);
        return route.getRouteId();
    }

    public String updateRoute(Route route) {
        super.doUpdateObject(route);
        return route.getRouteId();
    }

    public boolean deleteRouteByIds(String [] ids) {
        if(ids==null||ids.length==0) return true;
        Connection c=this.getSession().connection();
        Statement s=null;
        String sqlWhere =StringHelper.arrToSqlString(ids);
        try
        {
            String deleteSQL="delete WFSS_ROUTE  where route_id in("+sqlWhere+")";
            s=c.createStatement();
            s.execute(deleteSQL);
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            try
            {
              s.close();
            }
            catch(Exception ex)
            {
                ex.printStackTrace();
            }
        }
        return true;
    }


    public Route getRouteById(String id) {
        // TODO Auto-generated method stub
        return (Route)super.doFindObjectById(id);
    }


    public List getRouteByActivityId(String activityId) {
        String hql="from "+getModelClass().getName()+" as c where c.activityId=? order by c.orderIndex";
        List para=new ArrayList();
        para.add(activityId);
        return super.doFindObjectListByParam(hql,para);
    }
}
