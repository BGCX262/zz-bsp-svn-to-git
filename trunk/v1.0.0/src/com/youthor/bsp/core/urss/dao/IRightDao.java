package com.youthor.bsp.core.urss.dao;

import java.util.List;

public interface IRightDao {

    List getFunctionWithResourceByAppId(String appId);

    boolean saveRoleRight(String appId, String roleId, List rightList);

    List getRightByAppIdRoleId(String appId, String roleId);

    List getUserRescoureByAppIdOrgIdRoleIds(String appId, String orgId, String[] roles);

    boolean saveUserRight(String appId, String orgId, List rightList);

    boolean hasPowerByUrl(String appId,String orgId, String href);

}
