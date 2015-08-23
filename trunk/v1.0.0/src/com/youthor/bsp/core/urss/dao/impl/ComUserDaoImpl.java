package com.youthor.bsp.core.urss.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.MD5Helper;
import com.youthor.bsp.core.abdf.common.page.PageHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.urss.dao.IComUserDao;
import com.youthor.bsp.core.urss.model.ComUser;


public class ComUserDaoImpl extends BaseDAOHibernate implements IComUserDao{

    protected Class getModelClass() {
        return ComUser.class;
    }

    public ComUser getComUserById(String comUserId) {
        return (ComUser)super.doFindObjectById(comUserId);
    }

    public String addComUser(ComUser comUser) {
        super.doCreateObject(comUser);
        
        return comUser.getComUserId();
    }

    public String updateComUser(ComUser comUser) {
        super.doUpdateObject(comUser);
        return comUser.getComUserId();
    }

    public boolean deleteComUserByIds(String ids) {
        // TODO Auto-generated method stub
        return false;
    }

    public List listPageComUser(Page page,String comId) {
        String hql="from "+getModelClass().getName()+" as c ";
        if(comId==null||comId.equals(""))
        {
             hql=hql+" where c.userType='-1' or c.userType='0'";
        }
        else
        {
             hql=hql+" where (c.userType='0' or c.userType='1') and c.comId='"+comId+"'";
        }
        return  PageHelper.executeQuery(page,this.getSession(),hql).list();
    }

    public ComUser listPageComUser(String username, String pwd) {
        String hql="from "+getModelClass().getName()+" as c where c.logonId=? and c.pwd=?";
        List par=new ArrayList();
        par.add(username);
        par.add(pwd);
        List returnList=super.doFindObjectListByParam(hql,par);
        if(returnList==null||returnList.isEmpty()) return null;
        return (ComUser)returnList.get(0);
    }

    public List getAppAdminByComId(String currComId) {
        String hql="from "+getModelClass().getName()+" as c ";
         hql=hql+" where  c.userType='1' and c.comId='"+currComId+"'";
        return super.doFind(hql);
    }

    public ComUser getComUserByLogonId(String logonId) {
        String hql="from "+getModelClass().getName()+" as c where c.logonId=? ";
        List par=new ArrayList();
        par.add(logonId);
        List returnList=super.doFindObjectListByParam(hql,par);
        if(returnList==null||returnList.isEmpty()) return null;
        return (ComUser)returnList.get(0);
    }

}
