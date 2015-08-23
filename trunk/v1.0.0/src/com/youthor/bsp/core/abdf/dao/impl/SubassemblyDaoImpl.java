package com.youthor.bsp.core.abdf.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.dao.ISubassemblyDao;
import com.youthor.bsp.core.abdf.model.Subassembly;
import com.youthor.bsp.core.abdf.model.SubassemblyField;

public class SubassemblyDaoImpl extends BaseDAOHibernate implements ISubassemblyDao{

    protected Class getModelClass() {
        // TODO Auto-generated method stub
        return Subassembly.class;
    }

    public List getAllSubassembly() {
        String hql="from "+this.getModelClass().getName()+" as s ";
        return super.doFind(hql);
    }

    public Subassembly getSubassemblyById(String subassemblyId) {
        // TODO Auto-generated method stub
        return (Subassembly)super.doFindObjectById(subassemblyId);
    }

    public String addSubassembly(Subassembly subassembly) {
        super.doCreateObject(subassembly);
        Session session=super.getSession();
        List subassemblyFieldList=subassembly.getSubassemblyFieldList();
        for(int i=0;i<subassemblyFieldList.size();i++)
        {
            SubassemblyField subassemblyField=(SubassemblyField)subassemblyFieldList.get(i);
            subassemblyField.setSubassemblyId(subassembly.getSubassemblyId());
            session.save(subassemblyField);
        }
        return subassembly.getSubassemblyId();
    }

    public void updateSubassembly(Subassembly subassembly) {
        super.doUpdateObject(subassembly);
        
    }

}
