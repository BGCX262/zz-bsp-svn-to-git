package com.youthor.bsp.core.abdf.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.dao.IOnLineHelperDao;
import com.youthor.bsp.core.abdf.model.OnLineHelper;

public class OnLineHelperDaoImpl extends BaseDAOHibernate implements IOnLineHelperDao{

    protected Class getModelClass() {
        // TODO Auto-generated method stub
        return OnLineHelper.class;
    }

    public List getAllOnLineHelper() {
        String hql="from "+getModelClass().getName()+" as r  order by r.orderShow";
        return super.doFind(hql);
    }

    public List getTopOnLineHelper() {
        String hql="from "+getModelClass().getName()+" as r where (r.parentId is null or r.parentId='')  order by r.orderShow";
        return super.doFind(hql);
    }

    public String addOnLineHelper(OnLineHelper onLineHelper) {
        super.doCreateObject(onLineHelper);
        return onLineHelper.getOnLineHelperId();
    }

    public String updateOnLineHelper(OnLineHelper onLineHelper) {
        super.doUpdateObject(onLineHelper);
        return onLineHelper.getOnLineHelperId();
    }

    public OnLineHelper getOnLineHelperById(String id) {
        
        return (OnLineHelper)super.doFindObjectById(id);
    }

    public List getSubOnLineHelperByParentId(String onLineHelperId) {
        String hql="from "+getModelClass().getName()+" as r where r.parentId=?   order by r.orderShow";
        List para=new ArrayList();
        para.add(onLineHelperId);
        return this.doFindObjectListByParam(hql,para);
    }
    
    public List getAllSubOnLineHelperByParentId(String onLineHelperId) {
        String hql="from "+getModelClass().getName()+" as r where r.allParentId like '%"+onLineHelperId+"%'";
        return super.doFind(hql);
    }

    public boolean deleteOnLineHelper(OnLineHelper onLineHelper) {
        this.doDeleteObjectReal(onLineHelper);
        return true;
    }


    public OnLineHelper getOnLineHelperByCode(String onLineHelperCode) {
        String hql="from "+getModelClass().getName()+" as r where r.onLineHelperCode=?";
        List para=new ArrayList();
        para.add(onLineHelperCode);
        List list = this.doFindObjectListByParam(hql,para);
        if (list!=null && list.size()>0) {
            return (OnLineHelper)list.get(0);
        }
        return null;
    }
    
    

}
