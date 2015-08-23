package com.youthor.bsp.core.urss.dao.impl;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.urss.dao.IPostAssignDao;
import com.youthor.bsp.core.urss.model.Post;
import com.youthor.bsp.core.urss.model.PostAssign;
import com.youthor.bsp.core.urss.model.PostOrg;

public class PostAssignDaoImpl extends BaseDAOHibernate implements IPostAssignDao{

    protected Class getModelClass() {
        // TODO Auto-generated method stub
        return PostAssign.class;
    }
    
    protected Class getPostModelClass() {
        // TODO Auto-generated method stub
        return Post.class;
    }
    
    protected Class getPostOrgModelClass() {
        // TODO Auto-generated method stub
        return PostOrg.class;
    }

    public PostAssign getPostAssign(String orgId, String postId) {
        String hql="from "+getModelClass().getName()+" as p where p.orgId=? and p.postId=?";
        List para=new ArrayList();
        para.add(orgId);
        para.add(postId);
        List list=super.doFindObjectListByParam(hql,para);
        if(list!=null&&list.size()>0)
        {
            return (PostAssign)list.get(0);
        }
        return null;
    }

    public String addPostAssign(PostAssign postAssign) {
        super.doCreateObject(postAssign);
        return postAssign.getAssignId();
    }

    public String updatePostAssign(PostAssign postAssign) {
        super.doUpdateObject(postAssign);
        return postAssign.getAssignId();
    }

    public List getPostAssignsByOrgId(String orgId) {
        String hql="from "+getModelClass().getName()+" as p,"+getPostModelClass().getName()+" post where post.postId=p.postId and p.orgId=? order by p.orderIndex";
        List para=new ArrayList();
        para.add(orgId);
        List returnList=new ArrayList();
        List list=super.doFindObjectListByParam(hql,para);
        if(list!=null&&list.size()>0)
        {
            for(int i=0;i<list.size();i++)
            {
                Object o[]=(Object[])list.get(i);
                PostAssign postAssign=(PostAssign)o[0];
                Post post=(Post)o[1];
                postAssign.setPostName(post.getPostName());
                returnList.add(postAssign);
            }
        }
        return returnList;
    }

    public boolean deletePostAssignByIds(String[] assignIds) {
        if(assignIds==null||assignIds.length==0) return true;
        Connection c=this.getSession().connection();
        Statement s=null;
        String sqlWhere =StringHelper.arrToSqlString(assignIds);
        try
        {
            s=c.createStatement();
            String deleteSQL="delete URSS_POST_ORG  where assign_id in("+sqlWhere+")";
            s.addBatch(deleteSQL);
            deleteSQL="delete URSS_POST_ASSIGN  where assign_id in("+sqlWhere+")";
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

    public PostAssign getpostAssignWithOrgsById(String assignId) {
        String hql="from "+getModelClass().getName()+" as p,"+getPostModelClass().getName()+" post where post.postId=p.postId and p.assignId=?";
        List para=new ArrayList();
        para.add(assignId);
        List list=super.doFindObjectListByParam(hql,para);
        if(list!=null&&list.size()>0)
        {
            
                Object o[]=(Object[])list.get(0);
                PostAssign postAssign=(PostAssign)o[0];
                Post post=(Post)o[1];
                postAssign.setPostName(post.getPostName());
                hql="from "+this.getPostOrgModelClass().getName()+" as postOrg where postOrg.assignId=? order by postOrg.orderIndex";
                list=super.doFindObjectListByParam(hql,para);
                postAssign.setOrgs(list);
                return postAssign;
            
        }
        return null;
    }

}
