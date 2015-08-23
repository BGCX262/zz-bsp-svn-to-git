/**
 * 
 */
package com.youthor.bsp.core.abdf.dao.impl;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;


import com.youthor.bsp.core.abdf.dao.IDictTreeDao;
import com.youthor.bsp.core.abdf.model.DictTree;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;

public class DictTreeDaoImpl extends BaseDAOHibernate implements IDictTreeDao{

    protected Class getModelClass() {
        // TODO Auto-generated method stub
        return DictTree.class;
    }

    public String addDictTree(DictTree controlTree) {
        super.doCreateObject(controlTree);
        return controlTree.getTreeId();
    }

    public void updateDictTree(DictTree controlTree) {
        super.doUpdateObject(controlTree);
        
    }

    public boolean deleteDictTreeByIds(String[] ids) {
        if(ids==null||ids.length==0) return true;
        Connection c=this.getSession().connection();
        Statement s=null;
        String sqlWhere =StringHelper.arrToSqlString(ids);
        try
        {
            String deleteSQL="";
            s=c.createStatement();
            for(int i=0;i<ids.length;i++)
            {
                deleteSQL="delete ABDF_DICT_TREE  where all_parent_id like '%"+ids[i]+"%'";
                s.addBatch(deleteSQL);
            }
            deleteSQL="delete ABDF_DICT_TREE  where tree_id in("+sqlWhere+")";
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

    public DictTree getDictTreeById(String id) {
        if(id==null||id.trim().equals("")) return null;
        DictTree app=(DictTree)super.doFindObjectById(id);
        return app;
    }


    

    public List getSubDictTreeByParentId(String parentId) {
        String hql="from "+getModelClass().getName()+" as r where r.parentId=? order by r.orderShow";
        List para=new ArrayList();
        para.add(parentId);
        return super.doFindObjectListByParam(hql,para);
    }

    public List getDictTreeByAllDictTreeId(String treeIds) {
        String [] allDictTreeIdArr=StringHelper.split(treeIds,",");
        String sqlWhere =StringHelper.arrToSqlString(allDictTreeIdArr);
        String hql="from "+this.getModelClass().getName() +" as  ca where ca.treeId in("+sqlWhere+")  order by ca.orderShow";
        List list=this.doFind(hql);
        return list;
    }

    public List getAllSubDictTreeByParentId(String parentId) {
        String hql="from "+getModelClass().getName()+" as r where r.allParentId like '%"+parentId+"%'";
        return super.doFind(hql);
    }

    public List getTopDictTreeByType(String treeType) {
        String hql="from "+getModelClass().getName()+" as r where (r.parentId is null or r.parentId='') and r.treeType=? order by r.orderShow";
        List para=new ArrayList();
        para.add(treeType);
        return super.doFindObjectListByParam(hql,para);
    }

    public DictTree getDictTreeRoot(String treeType) {
        String hql="from "+getModelClass().getName()+" as r where r.parentId='root' and r.treeType=?";
        List para=new ArrayList();
        para.add(treeType);
        List list=super.doFindObjectListByParam(hql,para);
        if(list!=null&&list.size()>0)
        {
            return (DictTree)list.get(0);
        }
        return null;
    }

    public List getAllDictTreeByType(String treeType) {
        String hql="from "+getModelClass().getName()+" as r where  r.treeType=? order by r.orderShow";
        List para=new ArrayList();
        para.add(treeType);
        return super.doFindObjectListByParam(hql,para);
    }

    

    

    
}
