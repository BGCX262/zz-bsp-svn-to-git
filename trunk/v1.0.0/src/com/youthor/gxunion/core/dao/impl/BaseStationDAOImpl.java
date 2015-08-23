package com.youthor.gxunion.core.dao.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.PageHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.demo.dao.ISimpleProcessDemoDAO;
import com.youthor.bsp.core.demo.model.SimpleProcessDemo;
import com.youthor.gxunion.common.util.Constants;
import com.youthor.gxunion.core.dao.IBaseStationDAO;
import com.youthor.gxunion.core.model.BaseStation;


public class BaseStationDAOImpl extends BaseDAOHibernate implements  IBaseStationDAO{

    protected Class getModelClass() {
        return BaseStation.class;
    }

    public List getAllValidBaseStation(){
        String hsql = "from " + getModelClass().getName() + " as b where 1=1 and b.status ='" + 
            Constants.GLOBAL_STATUS_VALID + "' order by b.id desc";
        return doFind(hsql);    
    }
    
    public BaseStation getBaseStationById(String id){
        return (BaseStation)doFindObjectById(id);
    }
    
    public BaseStation updateBaseStation(BaseStation model){
        doUpdateObject(model);
        return getBaseStationById(model.getId());
    }
    
    public BaseStation addBaseStation(BaseStation model){
        doCreateObject(model);
        return model;
    }
    
    public List getValidBaseStation(Page page,BaseStation model){
        StringBuilder sbHsql = new StringBuilder("from " + getModelClass().getName() + " as b where b.status ='" + 
            Constants.GLOBAL_STATUS_VALID + "'");
        wrapHSql(sbHsql,model);
        
        return PageHelper.executeQuery(page,getSession(),sbHsql.toString()).list();
    }
    
    protected void wrapHSql(StringBuilder sbHsql,BaseStation model){
        if(model != null){
            if(StringHelper.isHasContent(model.getCode())){
                sbHsql.append(" and b.code ='" + model.getCode() + "'");
            }
            if(StringHelper.isHasContent(model.getName())){
                sbHsql.append(" and b.name like '%" + model.getName() + "%'");
            }
            
            if(model.getNorthLatitude() > 0){
                sbHsql.append(" and b.northLatitude >=" + model.getNorthLatitude());
            }
            if(model.getNorthLatitude2() > 0){
                sbHsql.append(" and b.northLatitude <=" + model.getNorthLatitude2());
            }
            if(model.getEastLongitude() > 0){
                sbHsql.append(" and b.eastLongitude >=" + model.getEastLongitude());
            }
            if(model.getEastLongitude2() > 0){
                sbHsql.append(" and b.eastLongitude <=" + model.getEastLongitude2());
            }
            
            if(StringHelper.isHasContent(model.getCreateOrgId())){
                sbHsql.append(" and b.createOrgId ='" + model.getCreateOrgId() + "'");
            }
            if(StringHelper.isHasContent(model.getCreateOrgName())){
                sbHsql.append(" and b.createOrgName ='" + model.getCreateOrgName() + "'");
            }
            if(model.getCreateTime() != null){
                String beginDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(model.getCreateTime());
                sbHsql.append(" and b.createTime >=to_date('" +beginDate + "','yyyy-MM-dd HH24:mi:ss')");
            }
            if(model.getCreateTime2() != null){
                String endDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(model.getCreateTime2());
                sbHsql.append(" and b.createTime <=to_date('" +endDate + "','yyyy-MM-dd HH24:mi:ss')");
            }
        }
    }
    
}
