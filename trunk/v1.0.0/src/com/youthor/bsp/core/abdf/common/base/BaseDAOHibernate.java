package com.youthor.bsp.core.abdf.common.base;


import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.youthor.bsp.core.abdf.common.page.model.Page;

public abstract class BaseDAOHibernate extends HibernateDaoSupport {
  protected Logger logger = Logger.getLogger(getClass()); 

  protected abstract Class getModelClass();
  
  protected void doCreateObject(Object entity){
    this.getHibernateTemplate().save(entity);
  }

  protected void doUpdateObject(Object entity){
    this.getHibernateTemplate().update(entity);
  }
  

  protected void doDeleteObject(Object entity){
    this.getHibernateTemplate().delete(entity);
  }
  

  protected void doDeleteObjects(List entitys){
    this.getHibernateTemplate().deleteAll(entitys);
  }
  

  protected List doListAllObject(){
    
    List list =  this.getHibernateTemplate().find("from " + getModelClass().getName());
     return list;
  }
  
 
  protected Object doFindObjectById(Integer id){
    return this.getHibernateTemplate().get(this.getModelClass(),id);
  }

 
  protected Object doFindObjectById(Long id){
    return this.getHibernateTemplate().get(this.getModelClass(),id);
  }
  
  
  protected Object doFindObjectById(String id){
    return this.getHibernateTemplate().get(this.getModelClass(),id);
  }
  
  
  protected List doFindObjectListByParam(String queryString ,Object obj){
      if(queryString.indexOf("from")<0) return null;
      Query query = this.getSession().createQuery(queryString);
      setParam(query,obj);
      return query.list();
      
  }
  
  private static void setParam(Query query,Object obj){
        if(obj instanceof Map){
            setParamForMap(query,(Map)obj);
        }
       if(obj instanceof List){
            setParamForList(query,(List)obj);
        }
    }
  
  private static void setParamForList(Query query,List list){
        if(list==null)return;
        for(int i=0;i<list.size();i++){
            query.setParameter(i, list.get(i));
        }
    }
  private static void setParamForMap(Query query,Map map){
        if(map==null) return;
        Iterator iterator = map.keySet().iterator();
        while(iterator.hasNext()){
            String key = (String) iterator.next();
            query.setParameter(key, map.get(key));
        }
    }
  
 
 
  protected List doFindObjectListByParam(String queryString ,String paraName ,Object value){
    return this.getHibernateTemplate().findByNamedParam(queryString,paraName,value);
  }
  
  
  protected List doFind(String queryString){
    return this.getHibernateTemplate().find(queryString);
  }
  
  
  protected List doFind(String queryString, Object value){
    return this.getHibernateTemplate().find(queryString,value);
  }
  
 
  protected List doFind(String queryString, Object[] values){
    return this.getHibernateTemplate().find(queryString,values);
  }
  
  
  protected List doFind(final String queryString,final int pageIndex,final int pageSize){
    HibernateTemplate hibernateTemplate = this.getHibernateTemplate();
    return hibernateTemplate.executeFind(new HibernateCallback() { 
            public Object doInHibernate(Session session) 
             { 
              Query query = session 
                    .createQuery(queryString); 
              query.setMaxResults(pageSize); 
              query.setFirstResult((pageIndex - 1) * pageSize); 
              return query.list(); 
            } 
    }); 
  }
  
  protected int getRowsByHQL(String hql) {
     Session session=super.getSession();
     Query query=null;
     List l=null;
     int returnValue=0;
       query = session.createQuery(hql);
    l = query.list();
    if (l != null && !l.isEmpty()) {
        returnValue = ((Integer) l.get(0)).intValue();
    }
    return returnValue;
  }
  
  protected void doDeleteObjectReal(Object entity){
    this.getHibernateTemplate().delete(entity);
  }

 


}