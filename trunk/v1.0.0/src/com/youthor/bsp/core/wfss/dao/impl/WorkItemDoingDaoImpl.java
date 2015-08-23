package com.youthor.bsp.core.wfss.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.PageHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.wfss.common.Constants;
import com.youthor.bsp.core.wfss.dao.IWorkItemDoingDao;
import com.youthor.bsp.core.wfss.model.ActivityInstance;
import com.youthor.bsp.core.wfss.model.WorkItemDoen;
import com.youthor.bsp.core.wfss.model.WorkItemDoing;

public class WorkItemDoingDaoImpl extends BaseDAOHibernate implements IWorkItemDoingDao{

    protected Class getModelClass() {
        // TODO Auto-generated method stub
        return WorkItemDoing.class;
    }
    
    protected Class getActivityInstanceModelClass() {
        // TODO Auto-generated method stub
        return ActivityInstance.class;
    }

    public List listWorkItemDoing(Page page, String orgId) {
        String hql="from "+getModelClass().getName()+" as c , "+com.youthor.bsp.core.wfss.model.Process.class.getName()+" as p where c.processId = p.processId  and c.ownerId=? ";
        List para=new ArrayList();
        para.add(orgId);
        Object queryObject = (Object)page.getQueryObject();
        if (!StringHelper.doWithNull(queryObject).equals("")) {
            String  appFormId = (String)queryObject;
            if(appFormId!=null&&!appFormId.equals("")) {
                hql = hql+" and c.appFormId=?";
                para.add(appFormId);
            }
        }
        hql = hql+" order by c.createDate";
        List list = PageHelper.executeQuery(page,this.getSession(),hql,para).list();
        List returnValue = new ArrayList();
        if (list!=null && list.size()>0) {
            for(int i=0;i<list.size();i++) {
                WorkItemDoing workItemDoing = (WorkItemDoing)((Object[])list.get(i))[0];
                returnValue.add(workItemDoing);
            }
        }
        return  returnValue;
    }

    public WorkItemDoing getWorkItemDoingById(String workItemId) {
        // TODO Auto-generated method stub
        return (WorkItemDoing)this.doFindObjectById(workItemId);
    }

    public WorkItemDoing getWorkItemDoingByOrgId(String orgId) {
        String hql="from "+getModelClass().getName()+" as c where c.ownerId=? order by c.createDate";
        List para=new ArrayList();
        para.add(orgId);
        List list=super.doFindObjectListByParam(hql,para);
        if(list!=null&&list.size()>0)
        {
            return (WorkItemDoing)list.get(0);
        }
        return  null;
    }

    public int getWorkItemDoIngNumByActivityInstanceIdWithOutSelf(String activityInstanceId,String workItemId) {
        String hql="select count(*) from "+getModelClass().getName()+ " as wi where wi.workItemId!='"+workItemId+"' and  wi.activityInstanceId in " +
                "(select ai.activityInstanceId from " +getActivityInstanceModelClass().getName()+" as ai " +
                        "where ai.parentActivityInstId in (select ai1.parentActivityInstId from "+getActivityInstanceModelClass().getName()+" as ai1 where ai1.activityInstanceId='"+activityInstanceId+"'))";
        return this.getRowsByHQL(hql);
    }

    
    public void addWorkItemDoing(WorkItemDoing workItemDoingNew) {
        this.doCreateObject(workItemDoingNew);
        
    }

    
    public void deleteWorkItemDoing(WorkItemDoing workItemDoing) {
        this.doDeleteObject(workItemDoing);
        
    }

    
    public void updateWorkItemDoing(WorkItemDoing workItemDoing) {
        this.doUpdateObject(workItemDoing);
        
    }


    public WorkItemDoing getWorkItemDoingByActInsId(String activityInstanceId) {
        String hql="from "+getModelClass().getName()+" as c where c.activityInstanceId=? ";
        List para=new ArrayList();
        para.add(activityInstanceId);
        List list=super.doFindObjectListByParam(hql,para);
        if(list!=null&&list.size()>0)
        {
            return (WorkItemDoing)list.get(0);
        }
        return  null;
    }

    
    public WorkItemDoing getWorkItemDoingProcessInst(String processInstId,
            String appId, String appFormId, String ownerId) {
        String hql="from "+getModelClass().getName()+" as c where " +
        "c.processInstanceId='"+processInstId+"' and c.appId='"+appId+"' and c.ownerId='"+ownerId+"' and  c.appFormId='"+appFormId+"'";
        List list = super.doFind(hql);
        if (list!=null && list.size()>0) {
            return (WorkItemDoing)list.get(0);
        }
        return  null;
    }

}
