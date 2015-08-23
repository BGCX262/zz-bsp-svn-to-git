package com.youthor.bsp.core.wfss.dao.impl;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.wfss.dao.IAppFormFieldDao;
import com.youthor.bsp.core.wfss.model.AppFormField;

public class AppFormFieldDaoImpl  extends BaseDAOHibernate implements  IAppFormFieldDao {

    protected Class getModelClass() {
        return AppFormField.class;
    }

    public List getAppFormFieldByFormId(String formId) {
        String hql="from "+getModelClass().getName()+" as c where c.appFormId=?";
        List para=new ArrayList();
        para.add(formId);
        return super.doFindObjectListByParam(hql,para);
    }

    public String addAppFormField(AppFormField appFormField) {
        super.doCreateObject(appFormField);
        return appFormField.getFieldId();
    }

    public String updateAppFormField(AppFormField appFormField) {
        super.doUpdateObject(appFormField);
        return appFormField.getFieldId();
    }

    public boolean deleteAppFormFieldByIds(String [] ids) {
        if(ids==null||ids.length==0) return true;
        Connection c=this.getSession().connection();
        Statement s=null;
        String sqlWhere =StringHelper.arrToSqlString(ids);
        try
        {
            String deleteSQL="delete wfss_app_form_field  where field_id in("+sqlWhere+")";
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

    public AppFormField getAppFormFieldById(String id) {
        // TODO Auto-generated method stub
        return (AppFormField)super.doFindObjectById(id);
    }

}
