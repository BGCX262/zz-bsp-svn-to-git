package com.youthor.gxunion.core.dao.impl;

import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.PageHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.gxunion.common.util.Constants;
import com.youthor.gxunion.core.dao.ISimpleMaterialsDAO;
import com.youthor.gxunion.core.model.SimpleMaterials;

public class SimpleMaterialsDAOImpl extends BaseDAOHibernate implements  ISimpleMaterialsDAO{

    protected Class getModelClass() {
        return SimpleMaterials.class;
    }

    public List getAllSimpleValidMaterials(){
        String hsql = "from " + getModelClass().getName() + " as b where 1=1 and b.status ='" + 
            Constants.GLOBAL_STATUS_VALID + "' order by b.id desc";
        return doFind(hsql);    
    }
    
    public SimpleMaterials getSimpleMaterialsById(String id){
        return (SimpleMaterials)doFindObjectById(id);
    }
    
    public SimpleMaterials updateSimpleMaterials(SimpleMaterials model){
        doUpdateObject(model);
        return getSimpleMaterialsById(model.getId());
    }
    
    public SimpleMaterials addSimpleMaterials(SimpleMaterials model){
        doCreateObject(model);
        return model;
    }
    
    public List getValidSimpleMaterials(Page page,SimpleMaterials model){
        StringBuilder sbHsql = new StringBuilder("from " + getModelClass().getName() + " as b where b.status ='" + 
            Constants.GLOBAL_STATUS_VALID + "'");
        wrapHSql(sbHsql,model);
        
        return PageHelper.executeQuery(page,getSession(),sbHsql.toString()).list();
    }
    
    protected void wrapHSql(StringBuilder sbHsql,SimpleMaterials model){
        if(model != null){
            if(StringHelper.isHasContent(model.getCode())){
                sbHsql.append(" and b.code ='" + model.getCode() + "'");
            }
            if(StringHelper.isHasContent(model.getName())){
                sbHsql.append(" and b.name like '%" + model.getName() + "%'");
            }
            if(StringHelper.isHasContent(model.getPrincipalEmail())){
                sbHsql.append(" and b.principalEmail like '%" + model.getPrincipalEmail() + "%'");
            }
            if(model.getInventory() > 0){
                sbHsql.append(" and b.inventory >=" + model.getInventory());
            }
            if(model.getInventory2() > 0){
                sbHsql.append(" and b.inventory <=" + model.getInventory2());
            }
            if(model.getWarningMinValue() > 0){
                sbHsql.append(" and b.warningMinValue >=" + model.getWarningMinValue());
            }
            if(model.getWarningMinValue2() > 0){
                sbHsql.append(" and b.warningMinValue <=" + model.getWarningMinValue2());
            }
        }
    }
}
