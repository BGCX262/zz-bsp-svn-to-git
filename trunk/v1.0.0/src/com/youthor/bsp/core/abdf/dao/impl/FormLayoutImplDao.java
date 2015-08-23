package com.youthor.bsp.core.abdf.dao.impl;

import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.dao.IFormLayoutDao;
import com.youthor.bsp.core.abdf.model.FormLayout;

public class FormLayoutImplDao extends BaseDAOHibernate implements  IFormLayoutDao{

    protected Class getModelClass() {
        // TODO Auto-generated method stub
        return FormLayout.class;
    }

    public String addFormLayout(FormLayout formLayout) {
        super.doCreateObject(formLayout);
        return formLayout.getFormLayoutId();
    }

    public String updateFormLayout(FormLayout formLayout) {
        super.doUpdateObject(formLayout);
        return formLayout.getFormLayoutId();
    }

    public FormLayout getFormLayoutById(String id) {
        // TODO Auto-generated method stub
        return (FormLayout)super.doFindObjectById(id);
    }

    public void deleteFormLayout(FormLayout formLayout) {
        super.doDeleteObject(formLayout);
        
    }

    public List getFormLayoutListByParentId(String parentId) {
        String hql="from "+getModelClass().getName()+" as f where f.parentId='"+parentId+"' order by f.orderIndex";
        return super.doFind(hql);
    }

}
