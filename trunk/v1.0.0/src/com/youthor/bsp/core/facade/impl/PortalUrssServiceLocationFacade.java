package com.youthor.bsp.core.facade.impl;

import java.util.List;

import com.youthor.bsp.core.facade.IPortalUrssServiceFacade;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.App;
import com.youthor.bsp.core.urss.model.ComUser;
import com.youthor.bsp.core.urss.model.User;

public class PortalUrssServiceLocationFacade implements IPortalUrssServiceFacade{

    private IUrssServiceFacade urssServiceFacade;
    public List getUserMenuByAppIdOrgId(String appId, String orgId) {
        return urssServiceFacade.getUserMenuByAppIdOrgId(appId,orgId);
    }

    public List getOrgsByUserLogonName(String userLogonName) {
        return null;
    }

    public List getCoopAreaByOrgId(String orgId) {
        return urssServiceFacade.getCoopAreaByOrgId(orgId);
    }

    public List getCoopAreaByAppIdOrgId(String appId, String orgId) {
        return null;
    }

    public List getAppsByOrgId(String orgId) {
        return urssServiceFacade.getAppsByOrgId(orgId);
    }

    public List getOrgsByUserId(String userId) {
        return null;
    }

    public User getUserByLogonId(String logonId) {
        return urssServiceFacade.getUserByLogonId(logonId);
    }

    public IUrssServiceFacade getUrssServiceFacade() {
        return urssServiceFacade;
    }

    public void setUrssServiceFacade(IUrssServiceFacade urssServiceFacade) {
        this.urssServiceFacade = urssServiceFacade;
    }

    public App getAppById(String appId) {
        return urssServiceFacade.getAppById(appId);
    }

    public ComUser getComUserByLogonId(String logonId) {
        return urssServiceFacade.getComUserByLogonId(logonId);
    }

    public List getAllAppByComId(String comId) {
        return urssServiceFacade.getAllAppByComId(comId);
    }

    public List getAllAppByComUserId(String comId, String comUserId) {
        return urssServiceFacade.getAppByUserId(comId,comUserId);
    }

    public App getAppByCode(String comId,String appCode) {
        return urssServiceFacade.getAppByCode(comId,appCode);
    }

    public List getCoopAreaByOrgIdAppId(String orgId, String appId) {
        return urssServiceFacade.getCoopAreaByOrgIdAppId(orgId,appId);
    }

    public List getCurrPageButtons(String appId, String funCode, String orgId) {
        return urssServiceFacade.getCurrPageButtons(appId,funCode,orgId);
    }

    public User userLogon(String username, String passwordMd5) {
        return urssServiceFacade.userLogon(username,passwordMd5);
    }

    public boolean isHavePowerOfResource(String appId,String orgId, String funCode, String resourceCode) {
        return urssServiceFacade.isHavePowerOfResource(appId,orgId,funCode,resourceCode);
    }


    public List getAllCoopArea() {
        return urssServiceFacade.getAllCoopArea();
    }


    public List getCoopResourceCoop(String orgId, String coopAreaId) {
        return urssServiceFacade.getCoopResourceCoop(orgId, coopAreaId);
    }


    public boolean hasPowerByUrl(String appId,String orgId, String href) {
        return urssServiceFacade.hasPowerByUrl(appId,orgId,href);
    }
}
