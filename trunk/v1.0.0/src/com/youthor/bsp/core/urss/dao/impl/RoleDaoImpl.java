package com.youthor.bsp.core.urss.dao.impl;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.PageHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.urss.dao.IRoleDao;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.core.urss.model.Role;
import com.youthor.bsp.core.urss.model.RoleOrg;

public class RoleDaoImpl extends BaseDAOHibernate implements IRoleDao{

    protected Class getModelClass() {
        return Role.class;
    }
    
    protected Class getOrgModelClass() {
        return Org.class;
    }
    
    protected Class getRoleOrgModelClass() {
        return RoleOrg.class;
    }



    public Role getRoleById(String roleId) {
        return (Role)super.doFindObjectById(roleId);
    }

    public String addRole(Role role) {
        super.doCreateObject(role);
        return role.getRoleId();
    }

    public String updateRole(Role role) {
        super.doUpdateObject(role);
        return role.getRoleId();
    }



 

    public List getRoleByAppIdAndComId(String appId, String comId) {
        String hql="from "+getModelClass().getName()+" as r where r.appId=? and r.comId=? ";
        List para=new ArrayList();
        para.add(appId);
        para.add(comId);
        return super.doFindObjectListByParam(hql,para);
    }
    
    public List listRoleOrgByRoleId(Page page, String roleId) {
        String hql="from "+this.getRoleOrgModelClass().getName()+" as r,"+this.getOrgModelClass().getName()+" as o where r.orgId=o.orgId and r.roleId=? order by r.createTime";
        List para=new ArrayList();
        para.add(roleId);
        List list=PageHelper.executeQuery(page,this.getSession(),hql,para).list();
        List returnList=new ArrayList();
        if(list!=null&&list.size()>0)
        {
            for(int i=0;i<list.size();i++)
            {
                Object [] os=(Object[])list.get(i);
                RoleOrg roleOrg=(RoleOrg)os[0];
                Org org=(Org)os[1];
                roleOrg.setOrgName(org.getOrgName());
                roleOrg.setAllParentName(org.getAllParentName());
                returnList.add(roleOrg);
            }
        }
        return  returnList;
    }

    public void addRoleOrg(RoleOrg roleOrg) {
        Session session=this.getSession();
        session.save(roleOrg);
        
    }

    public List getAllRoleOrgByrRoleId(String roleId) {
        String hql="from "+this.getRoleOrgModelClass().getName()+" as r,"+this.getOrgModelClass().getName()+" as o where r.orgId=o.orgId and r.roleId='"+roleId+"'  order by r.createTime";
        List list=this.doFind(hql);
        List returnList=new ArrayList();
        if(list!=null&&list.size()>0)
        {
            for(int i=0;i<list.size();i++)
            {
                Object [] os=(Object[])list.get(i);
                RoleOrg roleOrg=(RoleOrg)os[0];
                Org org=(Org)os[1];
                roleOrg.setOrgName(org.getOrgName());
                roleOrg.setAllParentName(org.getAllParentName());
                returnList.add(roleOrg);
            }
        }
        return  returnList;
    }

    public boolean deleteRoleOrg(String[] roleOrgs) {
        if(roleOrgs==null||roleOrgs.length==0) return true;
        Connection c=this.getSession().connection();
        Statement s=null;
        String sqlWhere =StringHelper.arrToSqlString(roleOrgs);
        try
        {
            String deleteSQL="delete URSS_ROLE_ORG  where ROLE_ORG_ID in("+sqlWhere+")";
            System.out.println(deleteSQL);
            s=c.createStatement();
            s.execute(deleteSQL);
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

    public List getNoAddToRoleOrg(String roleId, String orgName, String orgQueryCode, String parentId) {
        String hql="from "+getOrgModelClass().getName()+" as o where o.orgId not in(select ro.orgId from " +
                ""+this.getRoleOrgModelClass().getName()+" as ro where ro.roleId='"+roleId+"') and o.orgTypeCode='YG' and  o.allParentId like '%"+parentId+"%'";
           if(orgName!=null&&!orgName.equals(""))
           {
               hql=hql+" and o.orgName like '%"+orgName+"%'";
           }
           if(orgQueryCode!=null&&!orgQueryCode.equals(""))
           {
               hql=hql+" and o.queryCode like '%"+orgQueryCode+"%'";
           }
        return super.doFind(hql);
    }

    public List getAddToRoleOrg(String roleId, String orgName, String orgQueryCode, String parentId) {
        String hql="from "+this.getRoleOrgModelClass().getName()+" as ro,"+this.getOrgModelClass().getName()+" as o where o.orgId=ro.orgId" +
        " and o.orgTypeCode='YG' and  o.allParentId like '%"+parentId+"%' and ro.roleId='"+roleId+"'";
       if(orgName!=null&&!orgName.equals(""))
       {
           hql=hql+" and o.orgName like '%"+orgName+"%'";
       }
       if(orgQueryCode!=null&&!orgQueryCode.equals(""))
       {
           hql=hql+" and o.queryCode like '%"+orgQueryCode+"%'";
       }
       List returnList=new ArrayList();
       List list=super.doFind(hql);
       if(list!=null&&list.size()>0)
       {
           for(int i=0;i<list.size();i++)
           {
               Object [] o=(Object [])list.get(i);
               RoleOrg roleOrg=(RoleOrg)o[0];
               Org org=(Org)o[1];
               roleOrg.setAllParentName(org.getAllParentName());
               roleOrg.setOrgName(org.getOrgName());
               roleOrg.setOrgId(org.getOrgId());
               roleOrg.setRoleId(roleId);
               returnList.add(roleOrg);
           }
       }
       
      return returnList;
    }

    public List getRoleByAppIdOrgId(String appId,String orgId) {
        String hql="from "+this.getModelClass().getName()+" as r where r.appId='"+appId+"' and r.roleId in " +
                "(select ur.roleId from "+this.getRoleOrgModelClass().getName()+" as ur where ur.orgId='"+orgId+"')";
        return super.doFind(hql);
    }

}
