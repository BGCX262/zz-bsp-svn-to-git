package com.youthor.bsp.core.urss.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.urss.model.App;
import com.youthor.bsp.core.urss.model.AppCom;

public interface IAppDao {
    public List getAllApp();
    public App getAppById (String appId);
    public boolean deleteAppByIds(String[] appId);
    public String addApp(App app);
    public boolean updateApp(App app);
    public List getAllAppByComId(String comId);
    public List getAppByUserId(String comId, String comUserId);
    public List getAppsByOrgId(String orgId);
    public App getAppByCode(String comId,String appCode);
    public List getAllAppWithApply(String comId);
    public List getPendingAppByComId(String comId);
    public void deleteAppCom(AppCom appCom);
    public void addAppCom(AppCom appCom);
    public List getComApplyAppWithPage(Page page);
    public String addComApp(AppCom appCom);
    public void deleteComApp(AppCom appCom);
    public AppCom getAppComByIds(String comId, String appId);
    
}
