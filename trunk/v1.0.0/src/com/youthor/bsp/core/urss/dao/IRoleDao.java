package com.youthor.bsp.core.urss.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.urss.model.Role;
import com.youthor.bsp.core.urss.model.RoleOrg;

public interface IRoleDao {
     public List getRoleByAppIdAndComId(String appId,String comId);
     public Role getRoleById(String roleId);
     public String addRole(Role role);
     public String updateRole(Role role);
    
    public List listRoleOrgByRoleId(Page page, String roleId);
    public void addRoleOrg(RoleOrg roleOrg);
    public List getAllRoleOrgByrRoleId(String roleId);
    public boolean deleteRoleOrg(String[] roleOrgs);
    public List getNoAddToRoleOrg(String roleId, String orgName, String orgQueryCode, String parentId);
    public List getAddToRoleOrg(String roleId, String orgName, String orgQueryCode, String parentId);
    public List getRoleByAppIdOrgId(String appId,String orgId);
}
