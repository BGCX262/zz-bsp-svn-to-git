package com.youthor.bsp.core.abdf.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.dao.IDictTreeTypeDao;
import com.youthor.bsp.core.abdf.model.DictTreeType;
import com.youthor.bsp.core.abdf.model.FormLayout;

public class DictTreeTypeDaoImpl extends BaseDAOHibernate implements   IDictTreeTypeDao{

    protected Class getModelClass() {
        // TODO Auto-generated method stub
        return DictTreeType.class;
    }
    
    protected Class getFormLayoutModelClass() {
        // TODO Auto-generated method stub
        return FormLayout.class;
    }

    public List getAlltDictTypeTree() {
        return super.doListAllObject();
    }

    public String addDictTreeType(DictTreeType dictTreeType) {
        super.doCreateObject(dictTreeType);
        return dictTreeType.getTreeTypeId();
    }

    public String updateDictTreeType(DictTreeType dictTreeType) {
        super.doUpdateObject(dictTreeType);
        return dictTreeType.getTreeTypeId();
    }

    public DictTreeType getDictTreeTypeById(String treeTypeId) {
        return (DictTreeType)super.doFindObjectById(treeTypeId);
    }

    public String addDictTreeTypeLayout(FormLayout dictTreeTypeLayout) {
        Session session=super.getSession();
        session.save(dictTreeTypeLayout);
        return dictTreeTypeLayout.getFormLayoutId();
    }

    public String updateDictTreeTypeLayout(FormLayout dictTreeTypeLayout) {
        Session session=super.getSession();
        session.update(dictTreeTypeLayout);
        return dictTreeTypeLayout.getFormLayoutId();
    }

    public FormLayout getDictTreeTypeLayoutById(String id) {
        Session session=super.getSession();
        FormLayout dictTreeTypeLayout=(FormLayout)session.get(FormLayout.class,id);
        return dictTreeTypeLayout;
    }

    public void deleteDictTreeTypeLayout(FormLayout dictTreeTypeLayout) {
        Session session=super.getSession();
        session.delete(dictTreeTypeLayout);
    }
    public DictTreeType getDictTreeTypeByCode(String treeType) {
        String hql="from "+this.getModelClass().getName()+" as t where t.treeTypeCode=?";
        List para=new ArrayList();
        para.add(treeType);
        List l=super.doFindObjectListByParam(hql,para);
        if(l==null||para.isEmpty())
          return null;
        DictTreeType dictTreeType=(DictTreeType)l.get(0);
         hql="from "+getFormLayoutModelClass().getName()+" as t where t.parentId=? order by t.orderIndex";
         para=new ArrayList();
         para.add(dictTreeType.getTreeTypeId());
         l=super.doFindObjectListByParam(hql,para);
         dictTreeType.setSubPropertyList(l);
         return dictTreeType;
         
    }
    
    

}
