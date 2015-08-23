package com.youthor.bsp.core.urss.dao;

import java.util.List;

import com.youthor.bsp.core.urss.model.OrgType;

public interface IOrgTypeDao {
    public List getOrgTypeByComId(String comId);
    public String addOrgType(OrgType orgType);
    public String updateOrgType(OrgType orgType);
    public OrgType getOrgTypeById(String id);
	public void deleteOrgType(OrgType orgType);    
    
}
