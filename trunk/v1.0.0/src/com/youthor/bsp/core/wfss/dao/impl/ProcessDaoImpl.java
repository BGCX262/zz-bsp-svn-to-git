package com.youthor.bsp.core.wfss.dao.impl;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.PageHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.wfss.dao.IProcessDao;
import com.youthor.bsp.core.wfss.model.Process;

public class ProcessDaoImpl  extends BaseDAOHibernate implements  IProcessDao{

    protected Class getModelClass() {
        return Process.class;
    }

    public List queryPageProcessByComId(Page page,String comId) {
        String hql="from "+getModelClass().getName()+" as c";
        List para=new ArrayList();
        return  PageHelper.executeQuery(page,this.getSession(),hql,para).list();
    }

    public List getProcessByAppId(String appId) {
        String hql="from "+getModelClass().getName()+" as c where c.appId=?";
        List para=new ArrayList();
        para.add(appId);
        return super.doFindObjectListByParam(hql,para);
    }
    
    public String addProcess(Process process) {
        super.doCreateObject(process);
        return process.getProcessId();
    }

    public String updateProcess(Process process) {
        super.doUpdateObject(process);
        return process.getProcessId();
    }

    public boolean deleteProcessByIds(String [] ids) {
        if(ids==null||ids.length==0) return true;
        Connection c=this.getSession().connection();
        Statement s=null;
        String sqlWhere =StringHelper.arrToSqlString(ids);
        try
        {
            String deleteSQL="delete WFSS_PROCESS  where process_id in("+sqlWhere+")";
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

    public Process getProcessById(String id) {
        // TODO Auto-generated method stub
        System.out.println("id==="+id);
        return (Process)super.doFindObjectById(id);
    }

    public List getAllProcessByComId(String comId) {
        List AllProcess=super.doListAllObject();
        if(AllProcess==null) 
        {
            return new ArrayList();
        }
        return AllProcess;
    }

    public Process getProcessByAlias(String processAlias,String isUsed) {
        String hql="from "+getModelClass().getName()+" as c where c.processAlias=? and c.isUsed = '"+isUsed+"'";
        List para=new ArrayList();
        para.add(processAlias);
        List list=super.doFindObjectListByParam(hql,para);
        if(list==null||list.isEmpty()) return null;
        return (Process)list.get(0); 
    }

	@Override
	public List getProcessByAppIdCode(String alias, String appId) {
		String hql="from "+getModelClass().getName()+" as c where c.processAlias=? and c.appId =?";
        List para=new ArrayList();
        para.add(alias);
        para.add(appId);
        List list=super.doFindObjectListByParam(hql,para);
        return list;
	}

}
