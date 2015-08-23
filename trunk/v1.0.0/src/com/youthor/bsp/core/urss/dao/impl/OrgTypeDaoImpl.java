/**
 * 
 */
package com.youthor.bsp.core.urss.dao.impl;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.PageHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.urss.dao.IOrgTypeDao;
import com.youthor.bsp.core.urss.model.OrgType;


public class OrgTypeDaoImpl extends BaseDAOHibernate implements IOrgTypeDao{

    protected Class getModelClass() {
        return OrgType.class;
    }
    
    public List getOrgTypeByComId(String comId) {
        String hql="from "+getModelClass().getName()+" as a order by a.comId";
        List allOrgTypeByComId=super.doFind(hql);
        if(allOrgTypeByComId==null) 
        {
            return new ArrayList();
        }
        return allOrgTypeByComId;
    }

    public String addOrgType(OrgType orgType) {
        super.doCreateObject(orgType);
        return orgType.getOrgTypeId();
    }

    public String updateOrgType(OrgType orgType) {
        super.doUpdateObject(orgType);
        return orgType.getOrgTypeId();
    }

 

    public OrgType getOrgTypeById(String id) {
        // TODO Auto-generated method stub
        return (OrgType)super.doFindObjectById(id);
    }

	@Override
	public void deleteOrgType(OrgType orgType) {
		this.doDeleteObjectReal(orgType);
		
	}

}
