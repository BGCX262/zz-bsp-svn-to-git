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
import com.youthor.bsp.core.urss.dao.IAppDao;
import com.youthor.bsp.core.urss.model.App;
import com.youthor.bsp.core.urss.model.AppCom;
import com.youthor.bsp.core.urss.model.RegCompany;
import com.youthor.bsp.core.urss.model.Right;
import com.youthor.bsp.core.urss.model.RoleOrg;

public class AppDaoImpl extends BaseDAOHibernate implements IAppDao{

    protected Class getModelClass() {
        return App.class;
    }
    
    protected Class getRightModelClass() {
        return Right.class;
    }
    protected Class getRoleOrgModelClass() {
        return RoleOrg.class;
    }
    
    protected Class getAppComClass() {
        return AppCom.class;
    }
    
    protected Class getRegCompanyClass() {
        return RegCompany.class;
    }
    
    public List getAllApp(){
        String hql="from "+getModelClass().getName()+" as a order by a.orderIndex";
        List allApp=super.doFind(hql);
        if(allApp==null) 
        {
            return new ArrayList();
        }
        return allApp;
    }
    
    public String addApp(App app){
        super.doCreateObject(app);
        return app.getAppId();
    }
    public boolean deleteAppByIds(String[] ids){
        if(ids==null||ids.length==0) return true;
        Connection c=this.getSession().connection();
        Statement s=null;
        String sqlWhere =StringHelper.arrToSqlString(ids);
        try
        {
            
            s=c.createStatement();
            //删除应用下的角色公配的人员
             String deleteSQL="delete URSS_ROLE_ORG  where role_Id in (select t1.role_Id from URSS_ROLE t1 where t1.app_Id in("+sqlWhere+"))";
             s.addBatch(deleteSQL);
            //删除角色
             deleteSQL="delete URSS_ROLE  where app_Id in ("+sqlWhere+")";
             s.addBatch(deleteSQL);
            //删除分配的权限
             deleteSQL="delete URSS_RIGHT  where app_Id in ("+sqlWhere+")";
             s.addBatch(deleteSQL);
            //删除功能下关系的资源 
             deleteSQL="delete URSS_RESOURCE  where fun_Module_Id in (select t1.fun_Module_Id from URSS_FUNCTION t1 where t1.app_Id in ("+sqlWhere+"))";
             s.addBatch(deleteSQL);
             //删除功能
             deleteSQL="delete URSS_FUNCTION  where app_Id in ("+sqlWhere+")";
             s.addBatch(deleteSQL);
             //删除桌面
             deleteSQL="delete URSS_DESK  where app_Id in ("+sqlWhere+")";
             s.addBatch(deleteSQL);
             //删除相关联接
             //删除应本用
             deleteSQL="delete URSS_APP  where app_id in("+sqlWhere+")";
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
    
    public boolean updateApp(App app){
        if(app==null||app.getAppId().equals("")) return false;
        super.doUpdateObject(app);
        
        return true;
        
    }
    
    public App getAppById (String appId)
    {
        if(appId==null||appId.trim().equals("")) return null;
        App app=(App)super.doFindObjectById(appId);
        return app;
    }

    public List getAllAppByComId(String comId) {
        String hql="from "+getModelClass().getName()+" as a where a.comId=? order by a.orderIndex";
        List para=new ArrayList();
        para.add(comId);
        return this.doFindObjectListByParam(hql,para);
    }

    public List getAppByUserId(String comId, String comUserId) {
        String hql="from "+getModelClass().getName()+" as a where a.comId=? and a.appMrg=? order by a.orderIndex";
        List para=new ArrayList();
        para.add(comId);
        para.add(comUserId);
        return this.doFindObjectListByParam(hql,para);
    }
    public List getAppsByOrgId(String orgId) {
        String hql="from "+getModelClass().getName()+" as a where a.appId in(select distinct(p.appId) from "+getRightModelClass().getName()+" as p where (p.memberId='"+orgId+"' and p.memberType='YG') or (p.memberId in(select u.roleId from "+getRoleOrgModelClass().getName()+" as u where u.orgId='"+orgId+"') and p.memberType='JS'))  order by a.orderIndex";
        return super.doFind(hql);
    }

    public App getAppByCode(String comId,String appCode) {
        String hql="from "+getModelClass().getName()+" as a where a.appCode=? and a.comId=?";
        List para=new ArrayList();
        para.add(appCode);
        para.add(comId);
        List list=this.doFindObjectListByParam(hql,para);
        if(list!=null&&!list.isEmpty())
        {
            return (App)list.get(0);
        }
        return null;
    }


    public List getAllAppWithApply(String comId) {
        String hql="from "+getAppComClass().getName()+" as a where   a.comId=?";
        List para=new ArrayList();
        para.add(comId);
        List list=this.doFindObjectListByParam(hql,para);
        return list;

    }


    public List getPendingAppByComId(String comId) {
        String hql="from "+getAppComClass().getName()+" as a where   a.comId=? and a.status='pending'";
        List para=new ArrayList();
        para.add(comId);
        List list=this.doFindObjectListByParam(hql,para);
        return list;
    }


    public void addAppCom(AppCom appCom) {
        super.doCreateObject(appCom);
        
    }


    public void deleteAppCom(AppCom appCom) {
        Session session = super.getSession();
        session.delete(appCom);
        
    }


    public List getComApplyAppWithPage(Page page) {
        String hql="from "+getAppComClass().getName()+" as a,"+getModelClass().getName()+" as c,"+getRegCompanyClass().getName()+" as r where c.appId = a.appId and a.comId = r.comId";
        List para=new ArrayList();
        List pageList = PageHelper.executeQuery(page,this.getSession(),hql,para).list();
        List pareListComApp = new ArrayList();
        if(pageList!=null&&pageList.size()>0){
            for(int i = 0;i<pageList.size();i++) {
                Object [] os= (Object[])pageList.get(i);
                AppCom appCom =  (AppCom)os[0];
                App app =  (App)os[1];
                appCom.setAppName(app.getAppName());
                RegCompany regCompany =  (RegCompany)os[2];
                appCom.setComName(regCompany.getRegComName());
                pareListComApp.add(appCom);
            }
        }
        return pareListComApp ;
    }


    public String addComApp(AppCom appCom) {
        super.doCreateObject(appCom);
        return appCom.getAppComId();
    }


    public void deleteComApp(AppCom appCom) {
        super.doDeleteObject(appCom);
        
    }


    public AppCom getAppComByIds(String comId, String appId) {
        String hql="from "+getAppComClass().getName()+" as a where a.comId=? and a.appId=?";
        List para=new ArrayList();
        para.add(comId);
        para.add(appId);
        List list=this.doFindObjectListByParam(hql,para);
        if(list!=null&&!list.isEmpty())
        {
            return (AppCom)list.get(0);
        }
        return null;
    }

}
