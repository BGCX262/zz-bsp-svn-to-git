package com.youthor.bsp.core.urss.dao.impl;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.PageHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.urss.common.Constants;
import com.youthor.bsp.core.urss.dao.IUserDao;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.core.urss.model.User;

public class UserDaoImpl extends BaseDAOHibernate implements IUserDao{

    protected Class getModelClass() {
        // TODO Auto-generated method stub
        return User.class;
    }
    
    private Class getOrgModelClass() {
        // TODO Auto-generated method stub
        return Org.class;
    }

    public List listPageUnUserByOrgId(Page page, String orgId) {
        String hql="from "+getOrgModelClass().getName()+" as o where o.allParentId like '%"+orgId+"%' and o.orgTypeCode='"+Constants.GLOBAL_ORG_YG+"' " +
                "and (o.userId='N' or o.userId='' or o.userId is null)";
        return  PageHelper.executeQuery(page,this.getSession(),hql).list();
    }

    public List listPageUserByOrgId(Page page, String orgId) {
        String hql="from "+getModelClass().getName()+" as u,"+getOrgModelClass().getName()+" as o where o.userId=u.userId and  o.allParentId like '%"+orgId+"%' and o.orgTypeCode='"+Constants.GLOBAL_ORG_YG+"' " +
        "and (o.userId!='N'  and o.userId is not null)";
        List returnList=new ArrayList();
        List tempList=PageHelper.executeQuery(page,this.getSession(),hql).list();
        if(tempList!=null&&!tempList.isEmpty())
        {
            for(int i=0;i<tempList.size();i++)
            {
               Object [] os=(Object [])tempList.get(i);
               User user=(User)os[0];
               Org org=(Org)os[1];
               org.setUser(user);
               if(returnList.isEmpty())
               {
                   user.getOrgList().add(org);
                   returnList.add(user);
               }
               else
               {
                   boolean isAdd=true;
                   for(int j=0;j<returnList.size();j++)
                   {
                       User userTemp=(User)returnList.get(j);
                       if(userTemp.getUserId().equals(user.getUserId()))
                       {
                           userTemp.getOrgList().add(org);
                           isAdd=false;
                       }
                   }
                   if(isAdd)
                   {
                       user.getOrgList().add(org);
                       returnList.add(user);
                   }
               }
            }
        }
         return  returnList;
    }
    
    public User getUserByOrgId(String orgId) {
        // TODO Auto-generated method stub
        return null;
    }

    public User getUserByUserId(String userId) {
        User user=(User)this.doFindObjectById(userId);
        //根据用户id找到用户的组织信息
        String hql="from "+getOrgModelClass().getName()+" as o where o.userId='"+userId+"' and o.orgTypeCode='"+Constants.GLOBAL_ORG_YG+"'";
        List userOrgList=super.doFind(hql);
        user.setOrgList(userOrgList);
        return user;
    }

    public String addUser(User user) {
        super.doCreateObject(user);
        return user.getUserId();
    }

    public String updateUser(User user) {
        super.doUpdateObject(user);
        return user.getUserId();
    }


    public User userLogon(String userName, String password) {
        String hql="from "+this.getModelClass().getName()+" as u where u.loginId=? and u.pwd=?";
        List para=new ArrayList();
        para.add(userName);
        para.add(password);
        List list=super.doFindObjectListByParam(hql,para);
        User user=null;
        if(list==null||list.isEmpty())
          return null;
        else
            user= (User)list.get(0);
        hql="from "+this.getOrgModelClass().getName()+" as o where o.userId=?";
        para=new ArrayList();
        para.add(user.getUserId());
        list=super.doFindObjectListByParam(hql,para);
        user.setOrgList(list);
        return user;
    }

    public User getUserByLogonId(String logonId) {
        String hql="from "+this.getModelClass().getName()+" as u where u.loginId=?";
        List para=new ArrayList();
        para.add(logonId);
        List list=super.doFindObjectListByParam(hql,para);
        User user=null;
        if(list==null||list.isEmpty())
          return null;
        else
            user= (User)list.get(0);
        hql="from "+this.getOrgModelClass().getName()+" as o where o.userId=?";
        para=new ArrayList();
        para.add(user.getUserId());
        list=super.doFindObjectListByParam(hql,para);
        user.setOrgList(list);
        return user;
    }


    public void deleteUserById(String userId) {
        if(userId==null||userId.length()==0) return ;
        Connection c=this.getSession().connection();
        Statement s=null;
        try
        {
            s=c.createStatement();
            String updateSQL="update urss_org_tree set user_id = 'N' where user_id  ='"+userId+"'";
            s.addBatch(updateSQL);
            String deleteSQL="delete urss_user  where user_id  ='"+userId+"'";
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
        return ;
        
    }



}
