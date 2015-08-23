package com.youthor.bsp.core.urss.dao.impl;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.urss.dao.IFunctionDao;
import com.youthor.bsp.core.urss.model.App;
import com.youthor.bsp.core.urss.model.Function;
import com.youthor.bsp.core.urss.model.Function;

public class FunctionDaoImpl extends BaseDAOHibernate implements IFunctionDao{

    protected Class getModelClass() {
        // TODO Auto-generated method stub
        return Function.class;
    }
    
    protected Class getAppModelClass() {
        // TODO Auto-generated method stub
        return App.class;
    }
    
    public List getAllFunctionByAppId(String appId) {
        String hql="from "+getModelClass().getName()+" as r where r.appId=? order by r.orderIndex";
        List para=new ArrayList();
        para.add(appId);
        return super.doFindObjectListByParam(hql,para);
    }

    public Function getFunctionById(String functionId) {
        return (Function)super.doFindObjectById(functionId);
    }

    public void addFunction(Function function) {
        super.doCreateObject(function);
    }

    public void updateFunction(Function function) {
        super.doUpdateObject(function);
    }

    public boolean deleteFunctionByIds(String[] ids) {
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
                
                
                List subList=this.getAllSubFunctionByParentId(ids[i]);
                if(subList!=null&&!subList.isEmpty())
                {
                    for(int j=0;j<subList.size();j++)
                    {
                        Function function =(Function)subList.get(j);
                         //删除权限
                         deleteSQL="delete urss_right  where FUN_MODULE_ID='"+function.getFunModuleId()+"'";
                         
                         s.addBatch(deleteSQL);
                        
                        //删除所有资源
                         deleteSQL="delete urss_resource  where FUN_MODULE_ID ='"+function.getFunModuleId()+"'";
                         
                         s.addBatch(deleteSQL);
                    }
                }
                deleteSQL="delete URSS_FUNCTION  where ALL_PARENT_ID  like '%"+ids[i]+"%'";
                
                s.addBatch(deleteSQL);    
            }
            
             deleteSQL="delete urss_right  where FUN_MODULE_ID in("+sqlWhere+")";
             
             s.addBatch(deleteSQL);
            
            //删除所有资源
             deleteSQL="delete urss_resource  where FUN_MODULE_ID in("+sqlWhere+")";
             
             s.addBatch(deleteSQL);
             
             
             deleteSQL="delete URSS_FUNCTION  where FUN_MODULE_ID in("+sqlWhere+")";
             System.out.println("deleteSQL==="+deleteSQL);
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

    public List getSubFunctionByParentId(String parentId) {
        String hql="from "+getModelClass().getName()+" as r where r.parentId=? order by r.orderIndex ";
        List para=new ArrayList();
        para.add(parentId);
        return super.doFindObjectListByParam(hql,para);
    }

    public List getTopFunctionByAppId(String appId) {
        String hql="from "+getModelClass().getName()+" as r where r.appId=?  and (r.parentId is null or r.parentId='') order by r.orderIndex";
        List para=new ArrayList();
        para.add(appId);
        return super.doFindObjectListByParam(hql,para);
    }

    public List getUserMenuByAppIdOrgId(String appId, String orgId) {
        
        Connection c=this.getSession().connection();
        PreparedStatement ps=null;
        List menuList=new ArrayList();
        try
        {
            String sql="select * from URSS_FUNCTION uf where (uf.fun_Module_Id in( " +
                    "select ur.fun_Module_Id from URSS_RIGHT ur,URSS_RESOURCE us where ur.resource_Id=us.resource_Id and us.is_Menu_Display='Y' and ur.app_Id=?" +
                    "and ((ur.member_Id=? and ur.member_Type='YG') or " +
                    "(ur.member_Id in (select uro.role_Id from URSS_ROLE_ORG uro where uro.org_Id=?) and ur.member_Type='JS'))) and uf.is_Menu='Y')" +
                    " or (uf.is_Public='Y' and uf.app_Id=? and uf.is_Menu='Y' ) ";
            
            ps=c.prepareStatement(sql);
            ps.setString(1,appId);
            ps.setString(2,orgId);
            ps.setString(3,orgId);
            ps.setString(4,appId);
            ResultSet rs=ps.executeQuery();
        
            while(rs.next())
            {
                Function function=new Function();
                function.setAllParentId(rs.getString("all_Parent_Id"));
                function.setFunModuleId(rs.getString("fun_Module_Id"));
                menuList.add(function);
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            try
            {
              ps.close();
            }
            catch(Exception ex)
            {
                ex.printStackTrace();
            }
        }
        return menuList;
    }

    public List getUserMenuDetailByAllFunId(String allFunId) {
        String [] allFunIdArr=StringHelper.split(allFunId,",");
        String sqlWhere =StringHelper.arrToSqlString(allFunIdArr);
        String hql="from "+this.getModelClass().getName() +" as f,"+getAppModelClass().getName()+" as " +
                "a where f.appId=a.appId and f.funModuleId in("+sqlWhere+") order by f.orderIndex";
        List list=this.doFind(hql);
        List returnList=new ArrayList();
        if(list!=null&&list.size()>0)
        {
            for(int i=0;i<list.size();i++)
            {
                Object [] o=(Object[])list.get(i);
                Function function=(Function)o[0];
                App app=(App)o[1];
                function.setApp(app);
                
                returnList.add(function);
            }
        }
        return returnList;
    }

    public List getAllSubFunctionByParentId(String parentId) {
        String hql="from "+getModelClass().getName()+" as r where r.allParentId like '%"+parentId+"%'";
        return super.doFind(hql);
    }

    public Function getFunctionByAppIdFunCode(String appId, String funCode) {
        String hql="from "+getModelClass().getName()+" as r where r.appId=? and r.funCode=?";
        List para=new ArrayList();
        para.add(appId);
        para.add(funCode);
    
        List list= super.doFindObjectListByParam(hql,para);
        if(list!=null&&list.size()>0)
        {
            return (Function)list.get(0);
        }
        return null;
    }
}
