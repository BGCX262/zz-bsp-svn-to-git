package com.youthor.bsp.core.abdf.dao.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.dao.ICommonDao;

public class CommonDaoImpl extends BaseDAOHibernate implements ICommonDao{

	
	public Object getObjectByClassAndIdValue(Class clazz, String idValue) {
		Session session = this.getSession();
		Object  o = session.get(clazz, idValue);
		session.evict(o);
		return o;
	}
	protected Class getModelClass() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public int getExistRecordNum(String className, String idProperty,
			String idPropertyValue, Map map) {
		StringBuffer hqlSb =new StringBuffer();
		List para = new ArrayList();
		hqlSb.append("select count(*) as num from "+className +" where 1=1 ");
		if (idPropertyValue!=null && !idPropertyValue.equals("")) {
			hqlSb.append("and "+idProperty+" != ? ");
			para.add(idPropertyValue);
		}
		if (map!=null && !map.isEmpty()) {
			Iterator iterator = map.keySet().iterator();
			while(iterator.hasNext()) {
				String key = (String)iterator.next();
				String value = (String)map.get(key);
				if (value!=null && !value.equals("")) {
					hqlSb.append("and "+key+"=? ");
					para.add(value);
				}
				
			}
		}
		List l = this.doFindObjectListByParam(hqlSb.toString(), para);
		

	     int returnValue=0;
	    if (l != null && !l.isEmpty()) {
	        returnValue = ((Integer) l.get(0)).intValue();
	    }
	    
		return returnValue;
	}
	
	public int getExistRecordNum(String className, Map map) {
		StringBuffer hqlSb =new StringBuffer();
		List para = new ArrayList();
		hqlSb.append("select count(*) as num from "+className +" where 1=1 ");
		
		if (map!=null && !map.isEmpty()) {
			Iterator iterator = map.keySet().iterator();
			while(iterator.hasNext()) {
				String key = (String)iterator.next();
				String value = (String)map.get(key);
				if (value!=null && !value.equals("")) {
					hqlSb.append("and "+key+"=? ");
					para.add(value);
				}
				
			}
		}
		List l = this.doFindObjectListByParam(hqlSb.toString(), para);
		

	     int returnValue=0;
	    if (l != null && !l.isEmpty()) {
	        returnValue = ((Integer) l.get(0)).intValue();
	    }
	    
		return returnValue;
	}

}
