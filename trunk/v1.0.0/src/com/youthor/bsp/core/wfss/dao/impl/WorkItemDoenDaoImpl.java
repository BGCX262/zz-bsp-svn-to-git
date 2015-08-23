package com.youthor.bsp.core.wfss.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.PageHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.wfss.dao.IWorkItemDoenDao;
import com.youthor.bsp.core.wfss.model.WorkItemDoen;

public class WorkItemDoenDaoImpl extends BaseDAOHibernate implements IWorkItemDoenDao{

    protected Class getModelClass() {
        // TODO Auto-generated method stub
        return WorkItemDoen.class;
    }

    public List listWorkItemDoen(Page page, String orgId) {
        String hql="from "+getModelClass().getName()+" as c where c.ownerId=? ";
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
        hql = hql+" order by c.completeDate";
       
        return  PageHelper.executeQuery(page,this.getSession(),hql,para).list();
    }

    public WorkItemDoen getWorkItemDoenById(String workItemId) {
        // TODO Auto-generated method stub
        return (WorkItemDoen)this.doFindObjectById(workItemId);
    }

    
    public void deleteWorkItemDoen(WorkItemDoen workItemDoen) {
        this.doDeleteObject(workItemDoen);
        
    }


    public void createWorkItemDoen(WorkItemDoen workItemDoen) {
        this.doCreateObject(workItemDoen);
        
    }

    
    public WorkItemDoen getWorkItemDoenProcessInst(String processInstId,
            String appId, String appFormId,String ownerId) {
        String hql="from "+getModelClass().getName()+" as c where " +
                "c.processInstanceId='"+processInstId+"' and c.appId='"+appId+"' and c.ownerId='"+ownerId+"' and  c.appFormId='"+appFormId+"'";
        List list = super.doFind(hql);
        if (list!=null && list.size()>0) {
            return (WorkItemDoen)list.get(0);
        }
        return  null;
    }

}
