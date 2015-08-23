package com.youthor.bsp.core.wfss.dao.impl;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.youthor.bsp.core.wfss.model.Process;
import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.wfss.dao.IActivityDao;
import com.youthor.bsp.core.wfss.model.Activity;

public class ActivityDaoImpl  extends BaseDAOHibernate implements  IActivityDao{

    protected Class getModelClass() {
        return Activity.class;
    }

    protected Class getProcessModelClass() {
        return Process.class;
    }
    
    public List getActivityByProcessId(String processId) {
        String hql="from "+getModelClass().getName()+" as c where c.processId=? order by c.orderIndex";
        List para=new ArrayList();
        para.add(processId);
        return super.doFindObjectListByParam(hql,para);
    }
    
    public String addActivity(Activity activity) {
        super.doCreateObject(activity);
        return activity.getActivityId();
    }

    public String updateActivity(Activity activity) {
        super.doUpdateObject(activity);
        
        return activity.getActivityId();
    }

    public boolean deleteActivityByIds(String [] ids) {
        if(ids==null||ids.length==0) return true;
        Connection c=this.getSession().connection();
        Statement s=null;
        String sqlWhere =StringHelper.arrToSqlString(ids);
        try
        {
            String deleteSQL="delete WFSS_ACTIVITY  where activity_id in("+sqlWhere+")";
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


    public Activity getActivityById(String id) {
        // TODO Auto-generated method stub
        return (Activity)super.doFindObjectById(id);
    }


    public Activity getActivityByAlias(String processAlias,String isUsed ,String activityAlias) {
        String hql="from "+getModelClass().getName()+" as c where c.processId in(select p.processId from "+getProcessModelClass().getName()+" as p where p.processAlias=? and p.isUsed = '"+isUsed+"') " +
                "and c.activityAlias=? ";
        List para=new ArrayList();
        para.add(processAlias);
        para.add(activityAlias);
        List list=super.doFindObjectListByParam(hql,para);
        if(list!=null&&list.size()>0)
            return (Activity)list.get(0);
        return null;
    }

    @Override
    public Activity getActivityByProIdAlias(String processId,
            String activityAlias) {
        String hql="from "+getModelClass().getName()+" as c where c.processId = '"+processId+"' " +
        "and c.activityAlias=? ";
        List para=new ArrayList();
        para.add(activityAlias);
        List list=super.doFindObjectListByParam(hql,para);
        if(list!=null&&list.size()>0)
            return (Activity)list.get(0);
        return null;
    }
}
