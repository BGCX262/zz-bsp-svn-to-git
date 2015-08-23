package com.youthor.bsp.core.urss.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.urss.model.User;

public interface IUserDao {
    
    List listPageUnUserByOrgId(Page page,String orgId);
    User getUserByOrgId(String orgId);
    User getUserByUserId(String orgId);
    String addUser(User user);
    String updateUser(User user);
   
    List listPageUserByOrgId(Page page, String orgId);
    User userLogon(String userName, String password);
    User getUserByLogonId(String logonId);
    void deleteUserById(String userId);
}
