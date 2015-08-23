/**
 * 
 */
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
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.urss.dao.ICoopAreaDao;
import com.youthor.bsp.core.urss.model.App;
import com.youthor.bsp.core.urss.model.CoopArea;
import com.youthor.bsp.core.urss.model.Function;
import com.youthor.bsp.core.urss.model.Resource;


public class CoopAreaDaoImpl extends BaseDAOHibernate implements ICoopAreaDao{

    protected Class getModelClass() {
        return CoopArea.class;
    }

    public String addCoopArea(CoopArea coopArea) {
        super.doCreateObject(coopArea);
        return coopArea.getCoopAreaId();
    }

    public String updateCoopArea(CoopArea coopArea) {
        super.doUpdateObject(coopArea);
        return coopArea.getCoopAreaId();
    }

  

    public CoopArea getCoopAreaById(String id) {
        if(id==null||id.trim().equals("")) return null;
        CoopArea coopArea=(CoopArea)super.doFindObjectById(id);
        return coopArea;
    }

    

    public List getAllCoopArea() {
        String hql="from "+getModelClass().getName()+" as r  order by r.orderShow";
 
        return super.doFind(hql);
    }



    public List getCoopAreaByAllCoopAreaId(String coopAreaIds) {
        String [] allCoopAreaIdArr=StringHelper.split(coopAreaIds,",");
        String sqlWhere =StringHelper.arrToSqlString(allCoopAreaIdArr);
        String hql="from "+this.getModelClass().getName() +" as  ca where (ca.coopAreaId in("+sqlWhere+") and ca.isDynamic='N') or ca.isDynamic='Y' order by ca.orderShow";
        List list=this.doFind(hql);
        return list;
    }

 

    
    public CoopArea getCoopAreaByCode(String code) {
        String hql="from "+getModelClass().getName()+" as r where r.coopAreaCode=? ";
        List para=new ArrayList();
        para.add(code);
        List listCodes = super.doFindObjectListByParam(hql,para);
        if (listCodes!=null && listCodes.size()>0) {
            return (CoopArea)listCodes.get(0);
        }
        return null;
    }

	@Override
	public void deleteCoopAreaById(String id) {
		CoopArea coopArea = this.getCoopAreaById(id);
		this.doDeleteObject(coopArea);
		
	}

    
}
