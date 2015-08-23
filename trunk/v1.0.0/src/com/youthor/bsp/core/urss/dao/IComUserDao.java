package com.youthor.bsp.core.urss.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.urss.model.ComUser;

public interface IComUserDao {
    public ComUser getComUserById(String comUserId);
    public String addComUser (ComUser comUser);
    public String updateComUser (ComUser comUser);
    public boolean deleteComUserByIds(String ids);
    public List listPageComUser(Page page,String comId);
    public ComUser listPageComUser(String username, String pwd);
    public List getAppAdminByComId(String currComId);
    public ComUser getComUserByLogonId(String logonId);

}
