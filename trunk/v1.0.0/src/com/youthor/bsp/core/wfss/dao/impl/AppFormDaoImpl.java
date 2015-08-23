package com.youthor.bsp.core.wfss.dao.impl;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.PageHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.wfss.dao.IAppFormDao;
import com.youthor.bsp.core.wfss.model.AppForm;

public class AppFormDaoImpl  extends BaseDAOHibernate implements  IAppFormDao {

    protected Class getModelClass() {
        return AppForm.class;
    }

    public List queryPageAppFormByComId(Page page,String comId) {
        String hql="from "+getModelClass().getName()+" as c where c.comId=?";
        List para=new ArrayList();
        para.add(comId);
        return  PageHelper.executeQuery(page,this.getSession(),hql,para).list();
    }

    public List getAppFormByAppId(String appId) {
        String hql="from "+getModelClass().getName()+" as c where c.appId=?";
        List para=new ArrayList();
        para.add(appId);
        return super.doFindObjectListByParam(hql,para);
    }
    
    public String addAppForm(AppForm appForm) {
        super.doCreateObject(appForm);
        return appForm.getAppFormId();
    }

    public String updateAppForm(AppForm appForm) {
        super.doUpdateObject(appForm);
        return appForm.getAppFormId();
    }

    public boolean deleteAppFormByIds(String [] ids) {
        if(ids==null||ids.length==0) return true;
        Connection c=this.getSession().connection();
        Statement s=null;
        String sqlWhere =StringHelper.arrToSqlString(ids);
        try
        {
            String deleteSQL="delete WFSS_APP_FORM  where app_form_id in("+sqlWhere+")";
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

    public AppForm getAppFormById(String id) {
        // TODO Auto-generated method stub
        return (AppForm)super.doFindObjectById(id);
    }

    @Override
    public AppForm getAppFormByCodeEditionId(String appFormCode,
            String editionId) {
        String hql="from "+getModelClass().getName()+" as c where c.appFormCode=? and c.editionId=?";
        List para=new ArrayList();
        para.add(appFormCode);
        para.add(editionId);
        List l = this.doFindObjectListByParam(hql,para);
        if(l!=null && l.size()>0) {
            return (AppForm)l.get(0);
        }
        return null;
    }

	@Override
	public List getAppFormByAppIdEditionId(String appId, String editionId) {
        String hql="from "+getModelClass().getName()+" as c where c.appId=? and c.editionId=?";
        List para=new ArrayList();
        para.add(appId);
        para.add(editionId);
        return super.doFindObjectListByParam(hql,para);
	}

}
