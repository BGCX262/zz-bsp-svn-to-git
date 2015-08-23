package com.youthor.bsp.core.abdf.dao.impl;

import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.dao.ISystemConfDao;
import com.youthor.bsp.core.abdf.model.SystemConf;

/**
 * 
 * @author jason
 *
 */
public class SystemConfDaoImpl extends BaseDAOHibernate implements  ISystemConfDao{

    protected Class getModelClass() {
        return SystemConf.class;
    }

    public List getAllSystemConf(){
        return doListAllObject();
    }
    
    public String updateSystemConf(SystemConf model){
        super.doUpdateObject(model);
        return model.getKey();
    }
    
    public SystemConf getSystemConfById(String id){
        return (SystemConf)doFindObjectById(id);
    }
}
