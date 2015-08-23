package com.youthor.bsp.core.abdf.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.page.PageHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.abdf.dao.IDictDao;
import com.youthor.bsp.core.abdf.model.Dict;



public class DictDaoImpl extends BaseDAOHibernate implements  IDictDao{

    protected Class getModelClass() {
        return Dict.class;
    }

    public List listDictByDictTypeId(Page page, String dictTypeId) {
        String hql="from "+getModelClass().getName()+" as c where c.dictTypeId=? order by c.orderIndex";
        List para=new ArrayList();
        para.add(dictTypeId);
        return  PageHelper.executeQuery(page,this.getSession(),hql,para).list();
    }

    public String addDict(Dict dict) {
        super.doCreateObject(dict);
        return dict.getDictId();
    }

    public String updateDict(Dict dict) {
        super.doUpdateObject(dict);
        return dict.getDictId();
    }

    public Dict getDictById(String dictId) {
        Dict dict=(Dict)super.doFindObjectById(dictId);
        return dict;
    }

    public List getDictByDictTypeId(String dictTypeId) {
        String hql="from "+getModelClass().getName()+" as c where c.dictTypeId=? order by c.orderIndex";
        List para=new ArrayList();
        para.add(dictTypeId);
        return super.doFindObjectListByParam(hql,para);
    }

    

    
}
