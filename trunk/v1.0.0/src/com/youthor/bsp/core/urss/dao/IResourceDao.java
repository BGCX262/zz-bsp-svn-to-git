package com.youthor.bsp.core.urss.dao;

import java.util.List;

import com.youthor.bsp.core.urss.model.Resource;

public interface IResourceDao {
    public String  addResource(Resource resource);
    public String  updateResource(Resource resource);
    public boolean deleteResourceByIds(String [] ids);
    public List getResourcesByFunId(String id);
    public Resource getResourceId(String id);
    public List getCoopResourceByOrgId(String orgId);
    public List getCoopResourceByOrgIdAppId(String orgId, String appId);
    public List getCurrPageButtons(String appId, String funCode, String orgId);
    public boolean isHavePowerOfResource(String appId,String orgId, String funCode, String resourceCode);
    public List getCoopResourceByOrgIdCoopId(String orgId, String coopAreaId);
	public Resource getResourcesByCoopAreaId(String coopAread);
    
}
