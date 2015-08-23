package com.youthor.bsp.core.facade.impl;

import java.util.ArrayList;
import java.util.List;

import com.youthor.bsp.core.abdf.common.helper.QueryCodeHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.common.Constants;
import com.youthor.bsp.core.urss.dao.IAppDao;
import com.youthor.bsp.core.urss.dao.IComUserDao;
import com.youthor.bsp.core.urss.dao.ICoopAreaDao;
import com.youthor.bsp.core.urss.dao.IDeskDao;
import com.youthor.bsp.core.urss.dao.IFunctionDao;
import com.youthor.bsp.core.urss.dao.IOrgDao;
import com.youthor.bsp.core.urss.dao.IOrgTypeDao;
import com.youthor.bsp.core.urss.dao.IPostAssignDao;
import com.youthor.bsp.core.urss.dao.IPostDao;
import com.youthor.bsp.core.urss.dao.IRegCompanyDao;
import com.youthor.bsp.core.urss.dao.IResourceDao;
import com.youthor.bsp.core.urss.dao.IRightDao;
import com.youthor.bsp.core.urss.dao.IRoleDao;
import com.youthor.bsp.core.urss.dao.IUserDao;
import com.youthor.bsp.core.urss.model.App;
import com.youthor.bsp.core.urss.model.AppCom;
import com.youthor.bsp.core.urss.model.ComUser;
import com.youthor.bsp.core.urss.model.CoopArea;
import com.youthor.bsp.core.urss.model.Desk;
import com.youthor.bsp.core.urss.model.Function;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.core.urss.model.OrgType;
import com.youthor.bsp.core.urss.model.Post;
import com.youthor.bsp.core.urss.model.PostAssign;
import com.youthor.bsp.core.urss.model.RegCompany;
import com.youthor.bsp.core.urss.model.Resource;
import com.youthor.bsp.core.urss.model.Role;
import com.youthor.bsp.core.urss.model.RoleOrg;
import com.youthor.bsp.core.urss.model.User;


public class UrssServiceImplFacade implements IUrssServiceFacade{
     private IRegCompanyDao regCompanyDao;
     private IAppDao appDao;
     private IComUserDao comUserDao;
     private IDeskDao deskDao;
     private IRoleDao roleDao;
     private IFunctionDao functionDao;
     private IResourceDao resourceDao;
     private ICoopAreaDao coopAreaDao;
     private IOrgDao orgDao;
     private IUserDao userDao;
     private IPostDao postDao;
     private IOrgTypeDao orgTypeDao;
     private IRightDao rightDao;
     private IPostAssignDao postAssignDao;

    public void setUserDao(IUserDao userDao) {
        this.userDao = userDao;
    }

    public void setOrgDao(IOrgDao orgDao) {
        this.orgDao = orgDao;
    }

    public void setComUserDao(IComUserDao comUserDao) {
        this.comUserDao = comUserDao;
    }

    public List queryPageRegCompany(Page page,RegCompany regCompany) {

        return regCompanyDao.queryPageRegCompany(page,regCompany);
    }

    public String addRegCompany(RegCompany regCompany) {
        return regCompanyDao.addRegCompany(regCompany);
    }

    public String updateRegCompany(RegCompany regCompany) {
        // TODO Auto-generated method stub
        return regCompanyDao.updateRegCompany(regCompany);
    }

    public boolean deleteRegCompanyByIds(String [] ids) {
        // TODO Auto-generated method stub
        return regCompanyDao.deleteRegCompanyByIds(ids);
    }

    public IRegCompanyDao getRegCompanyDao() {
        return regCompanyDao;
    }

    public void setCoopAreaDao(ICoopAreaDao coopAreaDao) {
        this.coopAreaDao = coopAreaDao;
    }

    public void setRegCompanyDao(IRegCompanyDao regCompanyDao) {
        this.regCompanyDao = regCompanyDao;
    }

    public RegCompany getRegCompanyById(String id) {
        // TODO Auto-generated method stub
        return regCompanyDao.getRegCompanyById(id);
    }

    public void setAppDao(IAppDao appDao) {
        this.appDao = appDao;
    }
    public List getAllApp() {
        // TODO Auto-generated method stub
        return appDao.getAllApp();
    }

    public List getAllAppByComId(String comId) {
        // TODO Auto-generated method stub
        return appDao.getAllAppByComId(comId);
    }



    public App getAppById(String appId) {
        // TODO Auto-generated method stub
        return appDao.getAppById(appId);
    }

    public boolean deleteAppByIds(String[] appId) {
        // TODO Auto-generated method stub
        return appDao.deleteAppByIds(appId);

    }

    public void addApp(App app) {
        // TODO Auto-generated method stub
        appDao.addApp(app);
    }

    public boolean updateApp(App app) {
        // TODO Auto-generated method stub
        return appDao.updateApp(app);

    }

    public ComUser getComUserById(String comUserId) {
        // TODO Auto-generated method stub
        return comUserDao.getComUserById(comUserId);
    }

    public String addComUser(ComUser comUser) {
        // TODO Auto-generated method stub
        if(!orgDao.isAddComToOrgTree(comUser.getComId()))
        {
            Org org=new Org();
            org.setUserId("N");
            org.setOrgName(comUser.getRegComName());
            org.setQueryCode(QueryCodeHelper.getQueryCode(comUser.getRegComName()));
            org.setOrgTypeCode(Constants.GLOBAL_ORG_GS);
            org.setOrgId(comUser.getComId());
            orgDao.addOrg(org);
        }
        return comUserDao.addComUser(comUser);
    }

    public String updateComUser(ComUser comUser) {
        // TODO Auto-generated method stub
        return comUserDao.updateComUser(comUser);
    }

    public boolean deleteComUserByIds(String ids) {
        // TODO Auto-generated method stub
        return comUserDao.deleteComUserByIds(ids);
    }

    public List listPageComUser(Page page, String comId) {
        // TODO Auto-generated method stub
        return comUserDao.listPageComUser(page,comId);
    }

    public ComUser getComUserLogon(String username, String pwd) {
        // TODO Auto-generated method stub
        return comUserDao.listPageComUser(username,pwd);
    }

    public List queryPageDeskByComId(Page page, String comId) {
        // TODO Auto-generated method stub
        return deskDao.queryPageDeskByComId(page,comId);
    }

    public String addDesk(Desk desk) {
        // TODO Auto-generated method stub
        return deskDao.addDesk(desk);
    }

    public String updateDesk(Desk desk) {
        // TODO Auto-generated method stub
        return deskDao.updateDesk(desk);
    }

    public boolean deleteDeskByIds(String[] ids) {
        // TODO Auto-generated method stub
        return deskDao.deleteDeskByIds(ids);
    }

    public Desk getDeskById(String id) {
        // TODO Auto-generated method stub
        return deskDao.getDeskById(id);
    }

    public void setDeskDao(IDeskDao deskDao) {
        this.deskDao = deskDao;
    }

    public List getAppAdminByComId(String currComId) {
        // TODO Auto-generated method stub
        return comUserDao.getAppAdminByComId(currComId);
    }

    public List getAppByUserId(String comId, String comUserId) {
        // TODO Auto-generated method stub
        return appDao.getAppByUserId(comId,comUserId);
    }

    public List queryPageDeskByUserId(Page page, String comId, String userId) {
        // TODO Auto-generated method stub
        return deskDao.queryPageDeskByUserId(page,comId,userId);
    }


    public List getRoleByAppIdAndComId(String appId, String comId) {
        // TODO Auto-generated method stub
        return roleDao.getRoleByAppIdAndComId(appId,comId);
    }

    public Role getRoleById(String roleId) {
        // TODO Auto-generated method stub
        return roleDao.getRoleById(roleId);
    }

    public String addRole(Role role) {
        // TODO Auto-generated method stub
        return roleDao.addRole(role);
    }

    public String updateRole(Role role) {
        // TODO Auto-generated method stub
        return roleDao.updateRole(role);
    }

    public void deleteRoleById(String id) {

       Role role = roleDao.getRoleById(id);
       roleDao.updateRole(role);
    }



    public void setRoleDao(IRoleDao roleDao) {
        this.roleDao = roleDao;
    }

    public void setFunctionDao(IFunctionDao functionDao) {
        this.functionDao = functionDao;
    }

    public List getTopFunctionByAppId(String appid) {
        // TODO Auto-generated method stub
        return functionDao.getTopFunctionByAppId(appid);
    }

    public boolean deleteFunctionByIds(String[] functionIds) {
        // TODO Auto-generated method stub
        return functionDao.deleteFunctionByIds(functionIds);
    }

    public Function getFunctionById(String funModuleId) {
        // TODO Auto-generated method stub
        return functionDao.getFunctionById(funModuleId);
    }

    public List getSubFunctionByParentId(String funModuleId) {
        // TODO Auto-generated method stub
        return functionDao.getSubFunctionByParentId(funModuleId);
    }

    public void updateFunction(Function function) {
        functionDao.updateFunction(function);

    }

    public void addFunction(Function function) {
        functionDao.addFunction(function);

    }

    public List getAllFunctionByAppId(String appId) {
        // TODO Auto-generated method stub
        return functionDao.getAllFunctionByAppId(appId);
    }

    public String addResource(Resource resource) {
        // TODO Auto-generated method stub
        return resourceDao.addResource(resource);
    }

    public String updateResource(Resource resource) {
        // TODO Auto-generated method stub
        return resourceDao.updateResource(resource);
    }

    public boolean deleteResourceByIds(String[] ids) {
        // TODO Auto-generated method stub
        return resourceDao.deleteResourceByIds(ids);
    }

    public List getResourcesByFunId(String id) {
        // TODO Auto-generated method stub
        return resourceDao.getResourcesByFunId(id);
    }

    public void setResourceDao(IResourceDao resourceDao) {
        this.resourceDao = resourceDao;
    }

    public Resource getResourceId(String id) {
        // TODO Auto-generated method stub
        return resourceDao.getResourceId(id);
    }




    public String addCoopArea(CoopArea coopArea) {
        // TODO Auto-generated method stub
        return coopAreaDao.addCoopArea(coopArea);
    }
    public List getOrgListByParent(String orgParentId) {
        // TODO Auto-generated method stub
        return orgDao.getOrgListByParent(orgParentId);
    }

    public String updateCoopArea(CoopArea coopArea) {
        // TODO Auto-generated method stub
        return coopAreaDao.updateCoopArea(coopArea);
    }

    public void deleteCoopAreaByIds(String[] ids) {
        // TODO Auto-generated method stub

         if(ids!=null && ids.length>0) {
        	 for(int i=0;i<ids.length;i++) {
        		 Resource resource = resourceDao.getResourcesByCoopAreaId(ids[i]);
        		 if(resource!=null) {
	        		 resource.setCoopAreaId("");
	        		 resource.setCoopItemName("");
	        		 resourceDao.updateResource(resource);
        		 }
        		 coopAreaDao.deleteCoopAreaById(ids[i]);
        	 }
         }

    }

    public CoopArea getCoopAreaById(String id) {
        // TODO Auto-generated method stub
        return coopAreaDao.getCoopAreaById(id);
    }

    public List getAllCoopArea() {
        // TODO Auto-generated method stub
        return coopAreaDao.getAllCoopArea();
    }



    public String updateOrg(Org orgTreePo) {
        // TODO Auto-generated method stub
        return orgDao.updateOrg(orgTreePo);
    }

    public String addOrg(Org orgTreePo) {
        // TODO Auto-generated method stub
        return orgDao.addOrg(orgTreePo);
    }

    public Org getTreeRootOrg(String currComId) {
        // TODO Auto-generated method stub
        return orgDao.getTreeRootOrg(currComId);
    }

    public List getCanAddUserComs() {
        // TODO Auto-generated method stub
        return regCompanyDao.getCanAddUserComs();
    }



    public Org getOrgById(String orgId) {
        // TODO Auto-generated method stub
        return orgDao.getOrgById(orgId);
    }

    public List listPageUnUserByOrgId(Page page, String orgId) {
        // TODO Auto-generated method stub
        return userDao.listPageUnUserByOrgId(page,orgId);
    }

    public List listPageUserByOrgId(Page page, String orgId) {
        // TODO Auto-generated method stub
        return userDao.listPageUserByOrgId(page,orgId);
    }

    public User getUserByUserId(String userId) {
        // TODO Auto-generated method stub
        return userDao.getUserByUserId(userId);
    }

    public String addUser(User user, String[] orgIds) {
        String userId=userDao.addUser(user);
        if(orgIds!=null&&orgIds.length>0)
        {
            for(int i=0;i<orgIds.length;i++)
            {
                Org org=orgDao.getOrgById(orgIds[i]);
                if (!StringHelper.doWithNull(org.getUserId()).equals("N")) {
                    userDao.deleteUserById(org.getUserId());
                }
                org.setUserId(userId);
                orgDao.updateOrg(org);
            }
        }
        return userId;
    }

    public String updateUser(User user, String[] orgIds) {
        String userId=userDao.updateUser(user);
        if(orgIds!=null&&orgIds.length>0)
        {
            for(int i=0;i<orgIds.length;i++)
            {
                Org org=orgDao.getOrgById(orgIds[i]);
                if (!StringHelper.doWithNull(org.getUserId()).equals("N") &&
                        !StringHelper.doWithNull(org.getUserId()).equals(userId)) {
                    userDao.deleteUserById(org.getUserId());
                }
                org.setUserId(userId);
                orgDao.updateOrg(org);
            }
        }
        return userId;
    }

    public String updateUser(User user){
        return userDao.updateUser(user);
    }

    public List queryPagePostByComId(Page page, String comId) {
        // TODO Auto-generated method stub
        return postDao.queryPagePostByComId(page,comId);
    }

    public String addPost(Post post) {
        // TODO Auto-generated method stub
        return postDao.addPost(post);
    }

    public String updatePost(Post post) {
        // TODO Auto-generated method stub
        return postDao.updatePost(post);
    }

    public boolean deletePostByIds(String[] ids) {
        // TODO Auto-generated method stub
        return postDao.deletePostByIds(ids);
    }

    public Post getPostById(String id) {
        // TODO Auto-generated method stub
        return postDao.getPostById(id);
    }

    public ICoopAreaDao getCoopAreaDao() {
        return coopAreaDao;
    }

    public void setPostDao(IPostDao postDao) {
        this.postDao = postDao;
    }



    public List getOrgTypeByComId(String comId) {
        // TODO Auto-generated method stub
        return orgTypeDao.getOrgTypeByComId(comId);
    }

    public String addOrgType(OrgType orgType) {
        // TODO Auto-generated method stub
        return orgTypeDao.addOrgType(orgType);
    }

    public String updateOrgType(OrgType orgType) {
        // TODO Auto-generated method stub
        return orgTypeDao.updateOrgType(orgType);
    }



    public OrgType getOrgTypeById(String id) {
        // TODO Auto-generated method stub
        return orgTypeDao.getOrgTypeById(id);
    }

    public void setOrgTypeDao(IOrgTypeDao orgTypeDao) {
        this.orgTypeDao = orgTypeDao;
    }

    public List listRoleOrgByRoleId(Page page, String roleId) {
        // TODO Auto-generated method stub
        return roleDao.listRoleOrgByRoleId(page,roleId);
    }

    public void addRoleOrg(List roleOrgList) {
        if(roleOrgList==null||roleOrgList.size()==0) return;
        List allRoleOrgList=roleDao.getAllRoleOrgByrRoleId(((RoleOrg)roleOrgList.get(0)).getRoleId());
        for(int i=0;i<roleOrgList.size();i++)
        {
            RoleOrg roleOrg=(RoleOrg)roleOrgList.get(i);
            boolean isAdd=true;
            for(int j=0;j<allRoleOrgList.size();j++)
            {
                RoleOrg roleOrgTemp=(RoleOrg)allRoleOrgList.get(j);
                if(roleOrgTemp.getOrgId().equals(roleOrg.getOrgId()))
                {
                     isAdd=false;
                }
            }
            if(isAdd) {
               if(roleOrg.getSystemIn()==null || roleOrg.getSystemIn().trim().equals("")) {
                   roleOrg.setSystemIn("N");
               }
            	 roleDao.addRoleOrg(roleOrg);
            }

        }

    }

    public List getAllRoleOrgByrRoleId(String roleId) {
        // TODO Auto-generated method stub
        return roleDao.getAllRoleOrgByrRoleId(roleId);
    }

    public boolean deleteRoleOrg(String[] roleOrgs) {
        // TODO Auto-generated method stub
        return roleDao.deleteRoleOrg(roleOrgs);
    }

    public List getNoAddToRoleOrg(String roleId, String orgName, String orgQueryCode, String parentId) {
        // TODO Auto-generated method stub
        return roleDao.getNoAddToRoleOrg(roleId,orgName,orgQueryCode,parentId);
    }

    public List getAddToRoleOrg(String roleId, String orgName, String orgQueryCode, String parentId) {
        return roleDao.getAddToRoleOrg(roleId,orgName,orgQueryCode,parentId);
    }

    public void setRoleRightDao(IRightDao rightDao) {
        this.rightDao = rightDao;
    }

    public List getFunctionWithResourceByAppId(String appId) {
        // TODO Auto-generated method stub
        return rightDao.getFunctionWithResourceByAppId(appId);
    }

    public boolean saveRoleRight(String appId, String roleId, List rightList) {
        // TODO Auto-generated method stub
        return rightDao.saveRoleRight(appId,roleId,rightList);
    }

    public List getRightByAppIdRoleId(String appId, String roleId) {
        // TODO Auto-generated method stub
        return rightDao.getRightByAppIdRoleId(appId,roleId);
    }

    public List getRoleByAppIdOrgId(String appId,String orgId) {
        // TODO Auto-generated method stub
        return roleDao.getRoleByAppIdOrgId(appId,orgId);
    }

    public List getUserRescoureByAppIdOrgIdRoleIds(String appId, String orgId, String[] roles) {
        // TODO Auto-generated method stub
        return rightDao.getUserRescoureByAppIdOrgIdRoleIds(appId,orgId, roles);
    }

    public void setRightDao(IRightDao rightDao) {
        this.rightDao = rightDao;
    }

    public boolean saveUserRight(String appId, String orgId, List rightList) {
        // TODO Auto-generated method stub
        return rightDao.saveUserRight(appId,orgId,rightList);
    }

    public List getPostByComId(String comId) {
        // TODO Auto-generated method stub
        return postDao.getPostByComId(comId);
    }

    public void savePostAssign(String orgId, String allPostId) {
        String [] allPostIdOrder=StringHelper.split(allPostId,",");
        if(allPostIdOrder!=null||allPostIdOrder.length>0)
        {
            for(int i=0;i<allPostIdOrder.length;i++)
            {
                String [] itemOrder=StringHelper.split(allPostIdOrder[i],"#");
                PostAssign postAssign=postAssignDao.getPostAssign(orgId,itemOrder[0]);
                if(postAssign==null)
                {
                    postAssign=new PostAssign();
                    postAssign.setOrgId(orgId);
                    postAssign.setPostId(itemOrder[0]);
                    postAssign.setOrderIndex(Float.parseFloat(itemOrder[1]));
                    postAssignDao.addPostAssign(postAssign);
                }
                else
                {
                    postAssign.setOrderIndex(Float.parseFloat(itemOrder[1]));
                    postAssignDao.updatePostAssign(postAssign);
                }
            }
        }

    }

    public void setPostAssignDao(IPostAssignDao postAssignDao) {
        this.postAssignDao = postAssignDao;
    }

    public List getPostAssignsByOrgId(String orgId) {
        return postAssignDao.getPostAssignsByOrgId(orgId);
    }

    public void deletePostAssignByIds(String[] assignIds) {
        postAssignDao.deletePostAssignByIds(assignIds);

    }

    public PostAssign getpostAssignWithOrgsById(String assignId) {
        return postAssignDao.getpostAssignWithOrgsById(assignId);
    }

    public User userLogon(String userName, String password) {
        // TODO Auto-generated method stub
        return userDao.userLogon(userName,password);
    }

    public User getUserByLogonId(String logonId) {
        return userDao.getUserByLogonId(logonId);
    }

    public ComUser getComUserByLogonId(String logonId) {
        return comUserDao.getComUserByLogonId(logonId);
    }

    public List getAppsByOrgId(String orgId) {
        return appDao.getAppsByOrgId(orgId);
    }

    public List getUserMenuByAppIdOrgId(String appId, String orgId) {
        List memuList=functionDao.getUserMenuByAppIdOrgId(appId,orgId);
        StringBuffer sb=new StringBuffer();
        if(memuList!=null&&memuList.size()>0)
        {
            for(int i=0;i<memuList.size();i++)
            {
                Function function=(Function)memuList.get(i);
                String funId=function.getFunModuleId();
                if(sb.toString().indexOf(funId)<0)
                {
                    sb.append(funId+",");
                }
                String allParentIds=function.getAllParentId();
                if(allParentIds!=null&&!allParentIds.equals(""))
                {
                    String [] allParentIdArr=StringHelper.split(allParentIds,":");
                    for(int j=0;j<allParentIdArr.length;j++)
                    {
                        if(sb.toString().indexOf(allParentIdArr[j])<0)
                        {
                            sb.append(allParentIdArr[j]+",");
                        }
                    }
                }
            }
        }
        String allFunId=sb.toString();
        if(!allFunId.equals(""))
        {
            allFunId=allFunId.substring(0,allFunId.length()-1);
            memuList=functionDao.getUserMenuDetailByAllFunId(allFunId);
            return memuList;
        }

        return null;
    }

    public List getCoopAreaByOrgId(String orgId) {
        List resourceAreaList=resourceDao.getCoopResourceByOrgId(orgId);
        List coopAreaList=new ArrayList();
        StringBuffer sb=new StringBuffer();
        if(resourceAreaList!=null&&resourceAreaList.size()>0)
        {
            for(int i=0;i<resourceAreaList.size();i++)
            {
                Resource resource=(Resource)resourceAreaList.get(i);
                CoopArea coopArea=resource.getCoopArea();
                String coopAreaId=coopArea.getCoopAreaId();
                if(sb.toString().indexOf(coopAreaId)<0)
                {
                    sb.append(coopAreaId+",");
                }
            }
        }
        String coopAreaId=sb.toString();
        if(!coopAreaId.equals(""))
        {
            coopAreaId=coopAreaId.substring(0,coopAreaId.length()-1);
            coopAreaList=coopAreaDao.getCoopAreaByAllCoopAreaId(coopAreaId);
            for(int i=0;i<coopAreaList.size();i++)
            {
                CoopArea coopArea=(CoopArea)coopAreaList.get(i);
                for(int j=0;j<resourceAreaList.size();j++)
                {
                    Resource resource=(Resource)resourceAreaList.get(j);
                    if(resource.getCoopAreaId().equals(coopArea.getCoopAreaId()))
                        coopArea.getResourceList().add(resource);
                }
            }
        }
        return coopAreaList;
    }



    public void updateMoveFunction(Function source) {
        functionDao.updateFunction(source);
        List listSub=functionDao.getAllSubFunctionByParentId(source.getFunModuleId());
        if(listSub!=null&&listSub.size()>0)
        {
            for(int i=0;i<listSub.size();i++)
            {
                Function  function=(Function)listSub.get(i);
                String subAllParentIds=function.getAllParentId();
                String subAllParentNames=function.getAllParentName();
                String [] subAllParentIdsArr=StringHelper.split(subAllParentIds,":");
                String [] subAllParentNamesArr=StringHelper.split(subAllParentNames,":");
                int j=0;
                for(int n=0;n<subAllParentIdsArr.length;n++)
                {
                    if(source.getFunModuleId().equals(subAllParentIdsArr[n]))
                    {
                        j=n;
                        break;
                    }
                }
                StringBuffer sbId=new StringBuffer();
                StringBuffer sbName=new StringBuffer();
                for(int n=j;n<subAllParentIdsArr.length;n++)
                {
                    sbId.append(subAllParentIdsArr[n]+":");
                    sbName.append(subAllParentNamesArr[n]+":");
                }
                String sbIdStr=sbId.toString().substring(0,sbId.toString().length()-1);
                String sbNameStr=sbName.toString().substring(0,sbName.toString().length()-1);
                if(!StringHelper.doWithNull(source.getAllParentId()).equals(""))
                {
                    function.setAllParentId(source.getAllParentId()+":"+sbIdStr);
                }
                else
                {
                    function.setAllParentId(sbIdStr);
                }

                if(!StringHelper.doWithNull(source.getAllParentName()).equals(""))
                {
                    function.setAllParentName(source.getAllParentName()+":"+sbNameStr);
                }
                else
                {
                    function.setAllParentName(sbNameStr);
                }
                functionDao.updateFunction(function);
            }
        }

    }

    public App getAppByCode(String comId,String appCode) {
        return appDao.getAppByCode(comId,appCode);
    }

    public List getCoopAreaByOrgIdAppId(String orgId, String appId) {
        List resourceAreaList=resourceDao.getCoopResourceByOrgIdAppId(orgId,appId);
        List coopAreaList=new ArrayList();
        StringBuffer sb=new StringBuffer();
        if(resourceAreaList!=null&&resourceAreaList.size()>0)
        {
            for(int i=0;i<resourceAreaList.size();i++)
            {
                Resource resource=(Resource)resourceAreaList.get(i);
                CoopArea coopArea=resource.getCoopArea();
                String coopAreaId=coopArea.getCoopAreaId();
                if(sb.toString().indexOf(coopAreaId)<0)
                {
                    sb.append(coopAreaId+",");
                }
            }
        }
        String coopAreaId=sb.toString();
        if(!coopAreaId.equals(""))
        {
            coopAreaId=coopAreaId.substring(0,coopAreaId.length()-1);
            coopAreaList=coopAreaDao.getCoopAreaByAllCoopAreaId(coopAreaId);
            for(int i=0;i<coopAreaList.size();i++)
            {
                CoopArea coopArea=(CoopArea)coopAreaList.get(i);
                for(int j=0;j<resourceAreaList.size();j++)
                {
                    Resource resource=(Resource)resourceAreaList.get(j);
                    if(resource.getCoopAreaId().equals(coopArea.getCoopAreaId()))
                        coopArea.getResourceList().add(resource);
                }
            }
        }
        return coopAreaList;
    }

    public List getCurrPageButtons(String appId, String funCode, String orgId) {
        Function function=functionDao.getFunctionByAppIdFunCode(appId,funCode);
        if(function==null) return new ArrayList();
        return resourceDao.getCurrPageButtons(appId,function.getFunModuleId(),orgId);
    }

    public Function getFunctionByAppIdFunCode(String appId, String funCode) {
        Function function=functionDao.getFunctionByAppIdFunCode(appId,funCode);
        return function;
    }


    public List getAllAppWithApply(String comId) {
        return appDao.getAllAppWithApply(comId);
    }




    public List getComApplyAppWithPage(Page page) {
        return appDao.getComApplyAppWithPage(page);
    }

    public String addComApp(AppCom appCom) {
        return appDao.addComApp(appCom);
    }

    public void deleteComApp(AppCom appCom) {
        appDao.deleteComApp(appCom);

    }


    public AppCom getAppComByIds(String comId, String appId) {
        return appDao.getAppComByIds(comId,appId);
    }

    public void deleteUserById(String userId) {
        userDao.deleteUserById(userId);

    }


    public boolean isHavePowerOfResource(String appId, String orgId,
            String funCode, String resourceCode) {
        Function function=functionDao.getFunctionByAppIdFunCode(appId,funCode);
        if (function == null) return false;
        return resourceDao.isHavePowerOfResource(appId,orgId,funCode,resourceCode);
    }


    public CoopArea getCoopAreaByCode(String code) {
        return coopAreaDao.getCoopAreaByCode(code);
    }
    public List getCoopResourceCoop(String orgId, String coopAreaId) {
        List resourceAreaList=resourceDao.getCoopResourceByOrgIdCoopId(orgId,coopAreaId);
        return resourceAreaList;
    }


    public boolean hasPowerByUrl(String appId,String orgId, String href) {
        return rightDao.hasPowerByUrl(appId,orgId,href);
    }

	@Override
	public int getHasOrgNum(String orgTypeCode, String comId) {

		return orgDao.getHasOrgNum(orgTypeCode,comId);
	}

	@Override
	public void deleteOrgType(OrgType orgType) {
		orgTypeDao.deleteOrgType(orgType);

	}
}
