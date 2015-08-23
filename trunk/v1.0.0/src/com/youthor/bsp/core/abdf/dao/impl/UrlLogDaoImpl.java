package com.youthor.bsp.core.abdf.dao.impl;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.dao.IUrlLogDao;
import com.youthor.bsp.core.abdf.model.UrlLog;

public class UrlLogDaoImpl  extends BaseDAOHibernate implements IUrlLogDao{

    protected Class getModelClass() {
        return UrlLog.class;
    }

    
    public String addUrlLog(UrlLog urlLog) {
        this.doCreateObject(urlLog);
        return urlLog.getId();
    }

}
