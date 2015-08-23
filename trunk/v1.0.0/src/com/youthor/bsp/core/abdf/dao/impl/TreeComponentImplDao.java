package com.youthor.bsp.core.abdf.dao.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.Session;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.factory.DAOExtFactory;
import com.youthor.bsp.core.abdf.common.model.Tree;
import com.youthor.bsp.core.abdf.common.page.PageHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.abdf.dao.ITreeComponentDao;
import com.youthor.bsp.core.abdf.ext.IDAOExt;
import com.youthor.bsp.core.abdf.model.DictTreeType;

public class TreeComponentImplDao extends BaseDAOHibernate implements  ITreeComponentDao{
    protected Class getModelClass() {
        // TODO Auto-generated method stub
        return null;
    }

    public List listTopNodeObjectByType(Page page, DictTreeType dictTreeType) {
        String hql=" from "+dictTreeType.getModelClass()+" as t where (t.parentId='' or t.parentId is null) and (t.deleteFlag='N' or  t.deleteFlag is null) order by t.orderIndex";
        return  PageHelper.executeQuery(page,this.getSession(),hql,null).list();
    }

    public List getAllNodeDataByDictTreeType(DictTreeType dictTreeType) {
        String hql=" from "+dictTreeType.getModelClass()+" as t where  (t.deleteFlag='N' or  t.deleteFlag is null) order by t.orderIndex ";
        return  super.doFind(hql);
    }
    public String addTreeObject(Object modelObject) {
        // TODO Auto-generated method stub
         super.doCreateObject(modelObject);
         Tree tree =(Tree)modelObject;
         return  tree.getId();
    }

    public String updateTreeObject(Object modelObject) {
        super.doUpdateObject(modelObject);
        Tree tree =(Tree)modelObject;
         return  tree.getId();
        
    }
    public Object treeDaogetTreeNodeById(String modelClass, String id) {
        String queryString = "from "+ modelClass +" where id = '"+id+"'";
        List list = this.doFind(queryString);
        if(list!= null && !list.isEmpty()) return list.get(0);
        return null;
    }

    public List getSubTreeNodesByParentId(String modelClass, String id) {
        String queryString = "from "+ modelClass +" as t where t.parentId = '"+id+"' and (t.deleteFlag='N' or  t.deleteFlag is null) order by  t.orderIndex";
        List list = this.doFind(queryString);
        
        return list;
    }


    public List getAllSubTreeNodesByParentId(String modelClass, String id) {
        String queryString = "from "+ modelClass +" where allParentId like '%"+id+"%' and (t.deleteFlag='N' or  t.deleteFlag is null) order by  t.orderIndex";
        List list = this.doFind(queryString);
        
        return list;
    }


    public void deleteTreeNodeObject(DictTreeType dictTreeType, String id) {
        Object object = treeDaogetTreeNodeById(dictTreeType.getModelClass(),id);
        Session session = this.getSession();
        if (dictTreeType.getDeleteExt()!= null && !dictTreeType.getDeleteExt().equals("")) {
            IDAOExt idaoExt = DAOExtFactory.getInstance().getDaoExtInstance(dictTreeType.getDeleteExt());
            Map parMap = new HashMap();
            parMap.put("treeNodeId", id);
            idaoExt.execute(session, parMap);
        }
        if (dictTreeType.getDelMode()!=null && dictTreeType.getDelMode().equals("logicDel")) {
            try {
                BeanUtils.setProperty(object, "deleteFlag", "Y");
            } catch (IllegalAccessException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            this.updateTreeObject(object);
        }
        else {
            this.getSession().delete(object);
            
        }
        
    }

}
