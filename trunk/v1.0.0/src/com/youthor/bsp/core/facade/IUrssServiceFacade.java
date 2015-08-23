package com.youthor.bsp.core.facade;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.urss.model.App;
import com.youthor.bsp.core.urss.model.AppCom;
import com.youthor.bsp.core.urss.model.ComUser;
import com.youthor.bsp.core.urss.model.CoopArea;
import com.youthor.bsp.core.urss.model.Desk;
import com.youthor.bsp.core.urss.model.Function;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.core.urss.model.PostAssign;
import com.youthor.bsp.core.urss.model.RegCompany;
import com.youthor.bsp.core.urss.model.Resource;
import com.youthor.bsp.core.urss.model.Role;
import com.youthor.bsp.core.urss.model.User;
import com.youthor.bsp.core.urss.model.Post;
import com.youthor.bsp.core.urss.model.OrgType;

public interface IUrssServiceFacade {
    public List queryPageRegCompany(Page page,RegCompany regCompany);
    public String addRegCompany(RegCompany regCompany);
    public String updateRegCompany(RegCompany regCompany);
    public boolean deleteRegCompanyByIds(String [] ids);
    public RegCompany getRegCompanyById(String id);
    public List getCanAddUserComs();

    
    public List getAllApp();
    public App getAppById (String appId);
    public boolean deleteAppByIds(String[] appId);
    public void addApp(App app);
    public boolean updateApp(App app);
    public List getAllAppByComId(String comId);
    public List getAppByUserId(String comId, String comUserId);
    List getAppsByOrgId(String orgId);
    App getAppByCode(String comId,String appCode);
    
    
    public ComUser getComUserById(String comUserId);
    public String addComUser (ComUser comUser);
    public String updateComUser (ComUser comUser);
    public boolean deleteComUserByIds(String ids);
    public List listPageComUser(Page page,String comId);
    public ComUser getComUserLogon(String username, String pwd);
    public List getAppAdminByComId(String currComId);
    public ComUser getComUserByLogonId(String logonId);
    
    public List queryPageDeskByComId(Page page,String comId);
    public String addDesk(Desk desk);
    public String updateDesk(Desk desk);
    public boolean deleteDeskByIds(String [] ids);
    public Desk getDeskById(String id);
    public List queryPageDeskByUserId(Page page, String comId, String userId);
    
    

     public List getRoleByAppIdAndComId(String appId,String comId);
     public Role getRoleById(String roleId);
     public String addRole(Role role);
     public String updateRole(Role role);
     public void deleteRoleById(String  ids);
     public List listRoleOrgByRoleId(Page page, String roleId);    
     public void addRoleOrg(List roleOrgList);
     public List getAllRoleOrgByrRoleId(String roleId);
     public boolean deleteRoleOrg(String[] roleOrgs);
     public List getRoleByAppIdOrgId(String appId,String orgId);
     
     
     
    public List getTopFunctionByAppId(String appid);
    public boolean deleteFunctionByIds(String[] functionIds);
    public Function getFunctionById(String funModuleId);
    public List getSubFunctionByParentId(String funModuleId);
    public void updateFunction(Function source);
    public void updateMoveFunction(Function source);
    public void addFunction(Function function);
    public List getAllFunctionByAppId(String appId);
    List getUserMenuByAppIdOrgId(String appId,String orgId);
    Function getFunctionByAppIdFunCode(String appId, String funCode);
    
    
    public String  addResource(Resource resource);
    public String  updateResource(Resource resource);
    public boolean deleteResourceByIds(String [] ids);
    public List getResourcesByFunId(String id);
    public Resource getResourceId(String id);
    List getCurrPageButtons(String appId, String funCode, String orgId);
    public boolean isHavePowerOfResource(String appId,String orgId, String funCode, String resourceCode);
    
    
    public List getOrgListByParent(String orgParentId);
    public String updateOrg(Org orgTreePo);
    public String addOrg(Org orgTreePo);
    public Org getTreeRootOrg(String currComId);
    public Org getOrgById(String orgId);
    public int getHasOrgNum(String orgTypeCode, String comId);
    
    
   
    public String addCoopArea(CoopArea coopArea);
    public String updateCoopArea(CoopArea coopArea);
    public void deleteCoopAreaByIds(String [] ids);
    public CoopArea getCoopAreaById(String id);
    public CoopArea getCoopAreaByCode(String code);
    public List getAllCoopArea();
    List getCoopAreaByOrgId(String orgId);
    List getCoopAreaByOrgIdAppId(String orgId, String appId);
    
    
    
    public List listPageUnUserByOrgId(Page page, String comId);
    public List listPageUserByOrgId(Page page, String comId);
    public User getUserByUserId(String userId);
    public String addUser(User user,String [] orgIds);
    public String updateUser(User user,String [] orgIds);
    public String updateUser(User user);
    /**
     * 供外部调用
     * @param userName
     * @param password
     * @return
     */
    public User  userLogon(String userName,String password);
    /**
     * 供外部调用
     * @param logonId
     * @return
     */
     User getUserByLogonId(String logonId);
    
    public List queryPagePostByComId(Page page,String comId);
    public String addPost(Post post);
    public String updatePost(Post post);
    public boolean deletePostByIds(String [] ids);
    public Post getPostById(String id);    
    public List getPostByComId(String comId);
    
    
    public List getOrgTypeByComId(String comId);
    public String addOrgType(OrgType orgType);
    public String updateOrgType(OrgType orgType);
    public OrgType getOrgTypeById(String id);
    public void deleteOrgType(OrgType orgType);
    
    
    
    public List getNoAddToRoleOrg(String roleId, String orgName, String orgQueryCode, String parentId);
    public List getAddToRoleOrg(String roleId, String orgName, String orgQueryCode, String parentId);
    
    
    public List getFunctionWithResourceByAppId(String appId);
    public boolean saveRoleRight(String appId, String roleId, List rightList);
    public List getRightByAppIdRoleId(String appId, String roleId);
    public List getUserRescoureByAppIdOrgIdRoleIds(String appId, String orgId, String[] roles);
    public boolean saveUserRight(String appId, String orgId, List rightList);
    
    
    public void savePostAssign(String orgId, String allPostId);
    public List getPostAssignsByOrgId(String orgId);
    public void deletePostAssignByIds(String[] assignIds);
    public PostAssign getpostAssignWithOrgsById(String assignId);
    public List getAllAppWithApply(String comId);
    public List getComApplyAppWithPage(Page page);
    public String addComApp(AppCom appCom);
    public AppCom getAppComByIds(String comId, String appId);
    public void deleteComApp(AppCom appCom);
    public void deleteUserById(String string);
    public List getCoopResourceCoop(String orgId, String coopAreaId);
    public boolean hasPowerByUrl(String appId,String orgId, String href);
	
	
	


    

    
    
    
    
    
}
