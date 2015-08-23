package com.youthor.bsp.core.urss.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.PageHelper;
import com.youthor.bsp.core.urss.dao.IResourceDao;
import com.youthor.bsp.core.urss.model.App;
import com.youthor.bsp.core.urss.model.CoopArea;
import com.youthor.bsp.core.urss.model.Function;
import com.youthor.bsp.core.urss.model.Resource;
import com.youthor.bsp.core.urss.model.Right;
import com.youthor.bsp.core.urss.model.RoleOrg;

public class ResourceDaoImpl extends BaseDAOHibernate implements IResourceDao{

    protected Class getModelClass() {
        return Resource.class;
    }
    
    protected Class getAppModelClass() {
        return App.class;
    }
    
    protected Class getRightModelClass() {
        return Right.class;
    }
    
    protected Class getRoleOrgModelClass() {
        return RoleOrg.class;
    }
    
    protected Class getCoopAreaModelClass() {
        return CoopArea.class;
    }

    public String addResource(Resource resource) {
        super.doCreateObject(resource);
        return resource.getResourceId();
    }

    public String updateResource(Resource resource) {
        super.doUpdateObject(resource);
        return resource.getResourceId();
    }

    public boolean deleteResourceByIds(String[] ids) {
        //这里关没有删除分配的权限数据。
        //考虑到系统在实施分配权限时时不能删除资源的。
        //删除资源只能在测试环境上进行
        // 删除资源，如果删除权限不是那么简单,  因为考虑到联带分配的资源
        //所以在系统实施时，必须要对权限表中数据全部删除，然后重新为角色分配权限
        if(ids==null||ids.length==0) return true;
        Connection c=this.getSession().connection();
        Statement s=null;
        String sqlWhere =StringHelper.arrToSqlString(ids);
        try
        {
            s=c.createStatement();
            String deleteSQL="";
            for(int i=0;i<ids.length;i++)
            {
                deleteSQL="delete urss_right  where resource_id in (select t.resource_id from URSS_RESOURCE t  where t.ALL_PARENT_RES_ID  like '%"+ids[i]+"%')";
                System.out.println("deleteSQL=="+deleteSQL);
                s.addBatch(deleteSQL);    
                
                deleteSQL="delete URSS_RESOURCE  where ALL_PARENT_RES_ID  like '%"+ids[i]+"%'";
                System.out.println("deleteSQL=="+deleteSQL);
                s.addBatch(deleteSQL);    
                
                
            }
            deleteSQL="delete URSS_RESOURCE  where resource_id in("+sqlWhere+")";
            System.out.println("deleteSQL=="+deleteSQL);
            s.addBatch(deleteSQL);    
            
            deleteSQL="delete urss_right  where resource_id in ("+sqlWhere+")";
            System.out.println("deleteSQL=="+deleteSQL);
            s.addBatch(deleteSQL);
            s.executeBatch();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            try
            {
              s.close();
            }
            catch(Exception ex)
            {
                ex.printStackTrace();
            }
        }
        return true;
    }

    public List getResourcesByFunId(String id) {
        String hql="from "+this.getModelClass().getName()+" as r where r.funModuleId=? order by r.orderIndex";
        List para=new ArrayList();
        para.add(id);
        return super.doFindObjectListByParam(hql,para);
    }

    public Resource getResourceId(String id) {
        return (Resource)super.doFindObjectById(id);
    }

    public List getCoopResourceByOrgId(String orgId) {
        
        List resourceList=new ArrayList();
        
            String hql="from "+this.getModelClass().getName()+" as uc,"+this.getAppModelClass().getName()+" as ua," +
                    ""+this.getCoopAreaModelClass().getName()+" as uca where uca.coopAreaId=uc.coopAreaId and uc.appId=ua.appId and " +
            "uc.resourceId in (select ur.resourceId from "+this.getRightModelClass().getName()+" as ur where ((ur.memberId=? and memberType='YG')" +
            " or (ur.memberId in (select uro.roleId from "+getRoleOrgModelClass().getName()+" as uro where uro.orgId=?) and ur.memberType='JS' ))) and uc.coopAreaId is not null order by uc.orderIndexCoop";
            List para=new ArrayList();
            para.add(orgId);
            para.add(orgId);
         List temp=super.doFindObjectListByParam(hql,para);
         if(temp!=null&&temp.size()>0)
         {
             for(int i=0;i<temp.size();i++)
             {
                 Object [] o=(Object [])temp.get(i);
                
                 Resource resource=(Resource)o[0];
                 App app=(App)o[1];
                 CoopArea coopArea=(CoopArea)o[2];
                 resource.setCoopArea(coopArea);
                 resource.setApp(app);
                 resourceList.add(resource);
             }
         }
        return resourceList;
    }

 

    public List getCoopResourceByOrgIdAppId(String orgId, String appId) {
        List resourceList=new ArrayList();
        
        String hql="from "+this.getModelClass().getName()+" as uc,"+this.getAppModelClass().getName()+" as ua," +
                ""+this.getCoopAreaModelClass().getName()+" as uca where uca.coopAreaId=uc.coopAreaId and uc.appId=ua.appId and " +
        "uc.resourceId in (select ur.resourceId from "+this.getRightModelClass().getName()+" as ur where ((ur.memberId=? and memberType='YG')" +
        " or (ur.memberId in (select uro.roleId from "+getRoleOrgModelClass().getName()+" as uro where uro.orgId=?) and ur.memberType='JS' ))) and uc.coopAreaId is not null and uc.appId=? order by uc.orderIndexCoop";
        List para=new ArrayList();
        para.add(orgId);
        para.add(orgId);
        para.add(appId);
        
     List temp=super.doFindObjectListByParam(hql,para);
     if(temp!=null&&temp.size()>0)
     {
         for(int i=0;i<temp.size();i++)
         {
             Object [] o=(Object [])temp.get(i);
            
             Resource resource=(Resource)o[0];
             App app=(App)o[1];
             CoopArea coopArea=(CoopArea)o[2];
             resource.setCoopArea(coopArea);
             resource.setApp(app);
             resourceList.add(resource);
         }
     }
    return resourceList;
    }
    
    
    public List getCoopResourceByOrgIdCoopId(String orgId, String coopId) {
        List resourceList=new ArrayList();
        
        String hql="from "+this.getModelClass().getName()+" as uc " +
                "where " +
        "uc.resourceId in (select ur.resourceId from "+this.getRightModelClass().getName()+" as ur where ((ur.memberId=? and memberType='YG')" +
        " or (ur.memberId in (select uro.roleId from "+getRoleOrgModelClass().getName()+" as uro where uro.orgId=?) and ur.memberType='JS' ))) and uc.coopAreaId is not null and uc.coopAreaId = ? order by uc.orderIndexCoop";
        List para=new ArrayList();
        para.add(orgId);
        para.add(orgId);
        para.add(coopId);
        
      return super.doFindObjectListByParam(hql,para);
     
    }

    public List getCurrPageButtons(String appId, String funId, String orgId) {
        List resourceList=new ArrayList();
        
        String hql="from "+this.getModelClass().getName()+" as uc where uc.isButton='Y' and " +
        "uc.resourceId in (select ur.resourceId from "+this.getRightModelClass().getName()+" as ur  where ur.funModuleId=? and ur.appId=? and ((ur.memberId=? and memberType='YG')" +
        " or (ur.memberId in (select uro.roleId from "+getRoleOrgModelClass().getName()+" as uro where uro.orgId=?) and ur.memberType='JS' )))  order by uc.orderIndex";
        List para=new ArrayList();
        para.add(funId);
        para.add(appId);
        para.add(orgId);
        para.add(orgId);
         List temp=super.doFindObjectListByParam(hql,para);
         if(temp!=null&&temp.size()>0)
         {
               return temp;
         }
        return resourceList;
    }

    
    public boolean isHavePowerOfResource(String appId,String orgId, String funId, String resourceCode) {
         List resourceList=new ArrayList();
            
            String hql="from "+this.getModelClass().getName()+" as uc where  " +
            "uc.resourceId in (select ur.resourceId from "+this.getRightModelClass().getName()+" as ur  where ur.funModuleId=? and ur.appId=? and ((ur.memberId=? and memberType='YG')" +
            " or (ur.memberId in (select uro.roleId from "+getRoleOrgModelClass().getName()+" as uro where uro.orgId=?) and ur.memberType='JS' )))  order by uc.orderIndex";
            List para=new ArrayList();
            para.add(funId);
            para.add(appId);
            para.add(orgId);
            para.add(orgId);
             List temp=super.doFindObjectListByParam(hql,para);
             if(temp!=null&&temp.size()>0)
             {
                 for(int i=0;i<temp.size();i++){
                     
                 Resource resource =(Resource)temp.get(i);
                 if(resource.getResourceCode()!=null && resource.getResourceCode().equals(resourceCode)) {
                     return true;
                 }
             }
            
        }
        return false;
    }

	@Override
	public Resource getResourcesByCoopAreaId(String coopAreaId) {
		String hql="from "+this.getModelClass().getName()+" as r where r.coopAreaId=? ";
        List para=new ArrayList();
        para.add(coopAreaId);
        List l =super.doFindObjectListByParam(hql,para);
        if(l!=null && l.size()>0) {
        	return (Resource)l.get(0);
        }
        return null;
	}

}
