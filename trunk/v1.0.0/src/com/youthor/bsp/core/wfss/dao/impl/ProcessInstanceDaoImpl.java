package com.youthor.bsp.core.wfss.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.PageHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.wfss.common.Constants;
import com.youthor.bsp.core.wfss.common.criterion.ICancellationEvent;
import com.youthor.bsp.core.wfss.common.criterion.IHangEvent;
import com.youthor.bsp.core.wfss.dao.IProcessInstanceDao;
import com.youthor.bsp.core.wfss.model.ActivityInstance;
import com.youthor.bsp.core.wfss.model.Process;
import com.youthor.bsp.core.wfss.model.ProcessInstance;
import com.youthor.bsp.core.wfss.model.WorkItemDoing;
import com.youthor.bsp.view.wfss.common.criterion.WfExtFactory;

public class ProcessInstanceDaoImpl extends BaseDAOHibernate implements  IProcessInstanceDao{

    protected Class getModelClass() {
        return ProcessInstance.class;
    }

    public List listProcessInstByOrgId(Page page, String orgId) {
        String hql="from "+getModelClass().getName()+" as c where c.createId=? order by c.createTime";
        List para=new ArrayList();
        para.add(orgId);
        return  PageHelper.executeQuery(page,this.getSession(),hql,para).list();
    }

    
    public ProcessInstance getProcessInstById(String id) {
        // TODO Auto-generated method stub
        return (ProcessInstance)super.doFindObjectById(id);
    }

    
    public boolean cancelProcessInst(ProcessInstance processInstance,
            Process process) {
        String cancellationEvent = process.getCancellationEvent();
        boolean continueValue = true;
        Session session = this.getSession();
        if (cancellationEvent!=null && !cancellationEvent.equals("")) {
            ICancellationEvent cancellationObj = (ICancellationEvent)WfExtFactory.getFlowEvent(cancellationEvent);
            continueValue = cancellationObj.execute(this.getSession(), processInstance.getAppId());
        }
        if (continueValue) {
            processInstance.setStatus(Constants.WF_CANCEL);
            session.update(processInstance);
            //和到所有流程实例的待办
            String hql = "from "+WorkItemDoing.class.getName()+ " as w where w.processInstanceId='"+processInstance.getProcessInstanceId()+"'";
            Query query = this.getSession().createQuery(hql);
            List list = query.list();
            if (list!=null && list.size()>0) {
                for(int i=0;i<list.size();i++) {
                    WorkItemDoing workItemDoing = (WorkItemDoing)list.get(i);
                    session.delete(workItemDoing);
                }
            }
        }
        return continueValue;
    }

    
    public boolean hangProcessInst(ProcessInstance processInstance,
            Process process) {
        String hangEvent = process.getHangEvent();
        boolean continueValue = true;
        if (hangEvent!=null && !hangEvent.equals("")) {
            IHangEvent hangEventObj = (IHangEvent)WfExtFactory.getFlowEvent(hangEvent);
            continueValue = hangEventObj.execute(this.getSession(), processInstance.getAppId(),Constants.WF_HANG);
        }
        if (continueValue) {
            processInstance.setStatus(Constants.WF_HANG);
            this.getSession().update(processInstance);
        }
        return continueValue;
    }

    
    public boolean cancelHangProcessInst(ProcessInstance processInstance,
            Process process) {
        String hangEvent = process.getHangEvent();
        boolean continueValue = true;
        if (hangEvent!=null && !hangEvent.equals("")) {
            IHangEvent hangEventObj = (IHangEvent)WfExtFactory.getFlowEvent(hangEvent);
            continueValue = hangEventObj.execute(this.getSession(), processInstance.getAppId(),Constants.WF_CANCEL);
        }
        if (continueValue) {
            processInstance.setStatus(Constants.WF_LZ);
            this.getSession().update(processInstance);
        }
        return continueValue;
    }

    
    public List getDBActInsByProInstActId(String processInstanceId,
            String activityId) {
        String hql = "from " + ActivityInstance.class.getName() + " as a where a.processInstanceId = '"+processInstanceId+"' " +
          "and a.toActivityId='"+activityId+"' and a.status!= '"+Constants.WF_YB+"' ";
        System.out.println(hql);
        Query query = this.getSession().createQuery(hql);
        return query.list();
    }

    @Override
    public List getActivityInstByProInsId(String processInstanceId,
            String joinId) {
         joinId =StringHelper.doWithNull(joinId);
         String hql = "";
         if (!joinId.equals("")) {
             hql =  "from " + ActivityInstance.class.getName() + " as a where a.processInstanceId = '"+processInstanceId+"' " +
             "and  a.status!= '"+Constants.WF_YB+"' and a.splitIds like '%"+joinId+"%'";
         }
         else {
            hql =  "from " + ActivityInstance.class.getName() + " as a where a.processInstanceId = '"+processInstanceId+"' and  a.status!= '"+Constants.WF_YB+"'" ;
         }
         
       Query query = this.getSession().createQuery(hql);
       return query.list();
    }

    @Override
    public int getDBCountByProInstActIdJoinId(String processInstanceId,
            String activityId, String joinId) {
    	  joinId =StringHelper.doWithNull(joinId);
          String hql = "";
          if (!joinId.equals("")) {
              hql =  "select count(*) from " + ActivityInstance.class.getName() + " as a where a.processInstanceId = '"+processInstanceId+"' " +
              "and  a.status!= '"+Constants.WF_YB+"' and a.splitIds like '%"+joinId+"%'";
          }
          else {
             hql =  "select count(*) from " + ActivityInstance.class.getName() + " as a where a.processInstanceId = '"+processInstanceId+"' and  a.status!= '"+Constants.WF_YB+"'" ;
          }
          
          return this.getRowsByHQL(hql);
    }

}
