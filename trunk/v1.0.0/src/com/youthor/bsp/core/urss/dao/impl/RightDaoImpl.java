package com.youthor.bsp.core.urss.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.GUIDHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.urss.dao.IAppDao;
import com.youthor.bsp.core.urss.dao.IRightDao;
import com.youthor.bsp.core.urss.model.Function;
import com.youthor.bsp.core.urss.model.Resource;
import com.youthor.bsp.core.urss.model.Right;
import com.youthor.bsp.core.urss.model.RoleOrg;

public class RightDaoImpl extends BaseDAOHibernate implements IRightDao{

    protected Class getModelClass() {
        
        return Function.class;
    }
    
   protected Class getRightModelClass() {
        
        return Right.class;
    }
    
    protected Class getSubModelClass() {
        
        return Resource.class;
    }
    
    
    public List getFunctionWithResourceByAppId(String appId) {
        String hql="from "+getModelClass().getName()+" as f,"+getSubModelClass().getName()+" as r where f.funModuleId=r.funModuleId and f.appId='"+appId+"'";
        List funList=this.doFind(hql);
        List returnList=new ArrayList();
        if(funList==null||funList.isEmpty()) return returnList;
        for(int i=0;i<funList.size();i++)
        {
            Object [] o=(Object [])funList.get(i);
            Function function=(Function)o[0];
            Resource resource=(Resource)o[1];
            if(returnList.isEmpty())
            {
                function.getResourceList().add(resource);
                returnList.add(function);
                
            }
            else
            {
                boolean add=false;
                for(int j=0;j<returnList.size();j++)
                {
                    Function functionTemp=(Function)returnList.get(j);
                    if(functionTemp.getFunModuleId().equals(function.getFunModuleId()))
                    {
                        add=true;
                        functionTemp.getResourceList().add(resource);
                    }
                }
                if(!add)
                {
                    function.getResourceList().add(resource);
                    returnList.add(function);
                }
            }
        }
        return returnList;
    }

    public boolean saveRoleRight(String appId, String roleId, List rightList) {
        
        //先保存组织架构中的数据
        //组装sql语句
        Connection conn=super.getSession().connection();
        Statement st=null;
        String sql="";
        try{
            conn.setAutoCommit(false);
            st=conn.createStatement();
            
            sql="delete from URSS_RIGHT where member_Id='"+roleId+"' and app_id='"+appId+"' and member_Type='JS'";
            st.addBatch(sql);
            for(int i=0;i<rightList.size();i++)
            {
                
                Right right=(Right)rightList.get(i);
                if(right.getResourceId()==null||right.getResourceId().equals(""))
                    continue;
                sql="insert into URSS_RIGHT(right_Id,resource_Id,fun_Module_Id,app_Id,member_Id,member_Type,org_Ids,org_Names,org_Types,org_Flag) values(" +
                    "'"+GUIDHelper.genRandomGUID()+"','"+right.getResourceId()+"','"+right.getFunModuleId()+"','"+appId+"'," +
                    "'"+roleId+"','JS','"+StringHelper.doWithNull(right.getOrgIds())+"','"+StringHelper.doWithNull(right.getOrgNames())+"','"+StringHelper.doWithNull(right.getOrgTypes())+"','"+StringHelper.doWithNull(right.getOrgFlag())+"')";
                st.addBatch(sql);
                
            }
            st.executeBatch();
            conn.commit();
        }
        catch(Exception ex)
        {
            try {
                conn.rollback();
            } catch (SQLException e) {
                
                e.printStackTrace();
            }
            ex.printStackTrace();
        }
        finally
        {
            try{
            if(st!=null)
                st.close();
            
            }
            catch(Exception ex)
            {
                
            }
        }
        return true;
    }
    
    public List getRightByAppIdRoleId(String appId, String roleId)
    {
        String hql="from "+getRightModelClass().getName()+" as r where r.appId=? and r.memberId=? and r.memberType='JS'";
        List para=new ArrayList();
        para.add(appId);
        para.add(roleId);
        return this.doFindObjectListByParam(hql,para);
    }

    public List getUserRescoureByAppIdOrgIdRoleIds(String appId, String orgId, String[] roles) {
        String hql="from "+getRightModelClass().getName()+" as r where r.appId=? and (r.memberId=? and r.memberType='YG')";
        if(roles!=null&&roles.length>0)
        {
            String rolesStr=StringHelper.arrToSqlString(roles);
            hql=hql+" or (r.memberId in("+rolesStr+") and r.memberType='JS')";
        }
        List para=new ArrayList();
        para.add(appId);
        para.add(orgId);
        return this.doFindObjectListByParam(hql,para);
    }

    public boolean saveUserRight(String appId, String orgId, List rightList) {
//        先保存组织架构中的数据
        //组装sql语句
        Connection conn=super.getSession().connection();
        Statement st=null;
        String sql="";
        try{
            conn.setAutoCommit(false);
            st=conn.createStatement();
            sql="delete URSS_RIGHT where member_Id='"+orgId+"' and app_id='"+appId+"' and member_Type='YG'";
            st.addBatch(sql);
            for(int i=0;i<rightList.size();i++)
            {
                
                Right right=(Right)rightList.get(i);
                if(right.getResourceId()==null||right.getResourceId().equals(""))
                    continue;
                sql="insert into URSS_RIGHT(right_Id,resource_Id,fun_Module_Id,app_Id,member_Id,member_Type,org_Ids,org_Names,org_Types,org_Flag) values(" +
                    "'"+GUIDHelper.genRandomGUID()+"','"+right.getResourceId()+"','"+right.getFunModuleId()+"','"+appId+"'," +
                    "'"+orgId+"','YG','"+StringHelper.doWithNull(right.getOrgIds())+"','"+StringHelper.doWithNull(right.getOrgNames())+"','"+StringHelper.doWithNull(right.getOrgTypes())+"','"+StringHelper.doWithNull(right.getOrgFlag())+"')";
                st.addBatch(sql);
                System.out.println("sql=="+sql);
            }
            st.executeBatch();
            conn.commit();
        }
        catch(Exception ex)
        {
            try {
                conn.rollback();
            } catch (SQLException e) {
                
                e.printStackTrace();
            }
            ex.printStackTrace();
        }
        finally
        {
            try{
            if(st!=null)
                st.close();
            
            }
            catch(Exception ex)
            {
                
            }
        }
        return true;
    }

    
    public boolean hasPowerByUrl(String appId,String orgId, String href) {
        String hql="from "+Resource.class.getName()+" as uc where  " +
        "uc.resourceId in (select ur.resourceId from "+this.getRightModelClass().getName()+" as ur  where  ur.appId=? and ((ur.memberId=? and memberType='YG')" +
        " or (ur.memberId in (select uro.roleId from "+RoleOrg.class.getName()+" as uro where uro.orgId=?) and ur.memberType='JS' )))  and uc.implUrl=?";
        List para=new ArrayList();
        para.add(appId);
        para.add(orgId);
        para.add(orgId);
        para.add(href);
        
         List temp=super.doFindObjectListByParam(hql,para);
         if(temp!=null&&temp.size()>0)
         {
            return true;
         }
         return false;
    }
}
