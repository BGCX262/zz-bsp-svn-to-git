package com.youthor.bsp.core.facade;

import java.util.List;

import com.youthor.bsp.core.urss.model.App;
import com.youthor.bsp.core.urss.model.ComUser;
import com.youthor.bsp.core.urss.model.User;

public interface IPortalUrssServiceFacade {
    /**
     * 根据应用的id和用户的id得到用户在此应用上有权限的菜单
     * @param appId  应用id
     * @param orgId  组织的id，这里的组织指人员的id
     * @return  返回list,list中包含类为Function
     */
    List getUserMenuByAppIdOrgId(String appId,String orgId);
    List getOrgsByUserId(String userId);
    List getCoopAreaByOrgId(String orgId);
    List getCoopAreaByAppIdOrgId(String appId,String orgId);
    List getAppsByOrgId(String orgId);
    /**
     * 根据用户id得到用户信息对象
     * @param logonId
     * @return
     */
    User getUserByLogonId(String logonId);
    App getAppById(String appId);
    
    ComUser  getComUserByLogonId(String logonId); 
    List getAllAppByComId(String comId);
    List getAllAppByComUserId(String comId,String comUserId);
    App getAppByCode(String comId,String appCode);
    List getCoopAreaByOrgIdAppId(String orgId, String appId);
    List getCurrPageButtons(String appId, String funCode, String orgId);
    public boolean isHavePowerOfResource(String appId,String orgId, String funCode, String resourceCode);
    /**
     * 用户登陆
     * @param username
     * @param string
     * @return
     */
    User userLogon(String username, String passwordMd5);
    /**
     * 根据公司id得到公司定义的协同功能
     * @param comId
     * @return
     */
    List getAllCoopArea();
    List getCoopResourceCoop(String orgId, String coopAreaId);
    boolean hasPowerByUrl(String appId,String orgId, String href);

    
}
