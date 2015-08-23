package com.youthor.bsp.core.urss.dao.impl;

import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.urss.dao.IRegCompanyDao;
import com.youthor.bsp.core.urss.model.RegCompany;
import com.youthor.bsp.core.abdf.common.page.PageHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;

public class RegCompanyDaoImpl extends BaseDAOHibernate implements IRegCompanyDao{

    protected Class getModelClass() {
        return RegCompany.class;
    }

    public List queryPageRegCompany(Page page,RegCompany regCompany) {
        String hql="from "+getModelClass().getName()+" as c";
        return  PageHelper.executeQuery(page,this.getSession(),hql).list();
    }

    public String addRegCompany(RegCompany regCompany) {
        super.doCreateObject(regCompany);
        return regCompany.getComId();
    }

    public String updateRegCompany(RegCompany regCompany) {
        super.doUpdateObject(regCompany);
        return regCompany.getComId();
    }

    public boolean deleteRegCompanyByIds(String [] ids) {
        // TODO Auto-generated method stub
        return false;
    }

    public RegCompany getRegCompanyById(String id) {
        // TODO Auto-generated method stub
        return (RegCompany)super.doFindObjectById(id);
    }

    public List getCanAddUserComs() {
        String hql="from "+getModelClass().getName()+" as r where r.userType in('0','1','2')";
        return super.doFind(hql);
    }
    
    

}
