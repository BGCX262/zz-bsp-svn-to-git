package com.youthor.bsp.core.abdf.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;



import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.PageHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.abdf.dao.IDictTypeDao;
import com.youthor.bsp.core.abdf.model.Dict;
import com.youthor.bsp.core.abdf.model.DictType;

public class DictTypeDaoImpl extends BaseDAOHibernate implements  IDictTypeDao{

    public DictType getDictTypeById(String dictTypeId) {
        if(dictTypeId==null||dictTypeId.trim().equals("")) return null;
        DictType dictType=(DictType)super.doFindObjectById(dictTypeId);
        String hql="from "+this.getSubModelClass().getName()+" as sub where sub.dictTypeId='"+dictTypeId+"' order by sub.orderIndex";
        List dictList=super.doFind(hql);
        dictType.setDictList(dictList);
        return dictType;
    }

    public List getAllDictType() {
        List allDictType=super.doListAllObject();
        if(allDictType==null) 
        {
            return new ArrayList();
        }
//        for(int i=0;i<allDictType.size();i++)
//        {
//            DictType dictType=(DictType)allDictType.get(i);
//            String hql="from "+this.getSubModelClass().getName()+" as sub where sub.dictTypeId='"+dictType.getDictTypeId()+"' order by sub.orderIndex";
//            List dictList=super.doFind(hql);
//            dictType.setDictList(dictList);
//        }
        return allDictType;
    }

    public boolean addDictType(DictType dictType) {
        if(dictType==null||!dictType.getDictTypeId().equals("")) return false;
        super.doCreateObject(dictType);
        List dictList=dictType.getDictList();
        if(dictList==null) return true;
        for(int i=0;i<dictList.size();i++)
        {
            Dict dict=(Dict)dictList.get(i);
            if(dict.getDictId()!=null&&!dict.getDictId().equals(""))
                super.doUpdateObject(dictType);
            else
                super.doCreateObject(dictType);
        }
        return true;
    }

    public boolean updateDictType(DictType dictType) {
        if(dictType==null||dictType.getDictTypeId().equals("")) return false;
        super.doUpdateObject(dictType);
        List dictList=dictType.getDictList();
        if(dictList==null) return true;
        for(int i=0;i<dictList.size();i++)
        {
            Dict dict=(Dict)dictList.get(i);
            if(dict.getDictId()!=null&&!dict.getDictId().equals(""))
                super.doUpdateObject(dictType);
            else
                super.doCreateObject(dictType);
        }
        return true;
    }

    public boolean deleteDictTypeById(String dictTypeId) {
        // TODO Auto-generated method stub
        return false;
    }

    protected Class getModelClass() {
        // TODO Auto-generated method stub
        return DictType.class;
    }
    
    private Class getSubModelClass() {
        // TODO Auto-generated method stub
        return Dict.class;
    }

    public List getPageDictType() {
         String hql = "from "+getModelClass().getName()+" a ";
        return null;
    }

    public List getDictTypeByModuleName(String moduleName) {
        String hql="from "+getModelClass().getName()+" a where a.moduleName=?";
        List query=new ArrayList();
        query.add(moduleName);
        return super.doFindObjectListByParam(hql,query);
    }

    public boolean deleteDictTypeByIds(String[] ids) {
        if(ids==null||ids.length==0) return true;
        Connection c=this.getSession().connection();
        Statement s=null;
        String sqlWhere =StringHelper.arrToSqlString(ids);
        try
        {
            String deleteSQL="delete ABDF_DICT where dict_type_id in("+sqlWhere+")";
            s=c.createStatement();
            s.addBatch(deleteSQL);
            deleteSQL="delete ABDF_DICT_TYPE where dict_type_id in("+sqlWhere+")";
            s.addBatch(deleteSQL);
            s.executeBatch();
        }
        catch(Exception ex)
        {
            
        }
        finally
        {
            try
            {
              s.close();
            }
            catch(Exception ex)
            {
                
            }
        }
        return false;
    }

    public DictType getDictTyeByComIdCode(String gsId, String dictTypeCode) {
        String hql="from "+getModelClass().getName()+" as c where c.comId=? and c.dictTypeCode=? ";
        List para=new ArrayList();
        para.add(gsId);
        para.add(dictTypeCode);
        List list=super.doFindObjectListByParam(hql,para);
        if(list!=null && !list.isEmpty())
        {
            return (DictType)list.get(0);
        }
        return  null;
    }

    
}
