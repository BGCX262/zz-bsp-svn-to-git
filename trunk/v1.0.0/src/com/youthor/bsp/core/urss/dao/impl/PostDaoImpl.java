/**
 * 
 */
package com.youthor.bsp.core.urss.dao.impl;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.PageHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.urss.dao.IPostDao;
import com.youthor.bsp.core.urss.model.Post;

/**
 * @author 胡友成  2007-11-17
 *
 */
public class PostDaoImpl  extends BaseDAOHibernate implements IPostDao{

    protected Class getModelClass() {
        return Post.class;
    }

    public List queryPagePostByComId(Page page,String comId) {
        String hql="from "+getModelClass().getName()+" as c where c.comId=?";
        List para=new ArrayList();
        para.add(comId);
        return  PageHelper.executeQuery(page,this.getSession(),hql,para).list();
    }

    public String addPost(Post post) {
        super.doCreateObject(post);
        return post.getPostId();
    }

    public String updatePost(Post post) {
        super.doUpdateObject(post);
        return post.getPostId();
    }

    public boolean deletePostByIds(String [] ids) {
        if(ids==null||ids.length==0) return true;
        Connection c=this.getSession().connection();
        Statement s=null;
        String sqlWhere =StringHelper.arrToSqlString(ids);
        try
        {
            String deleteSQL="delete URSS_Post  where post_id in("+sqlWhere+")";
            s=c.createStatement();
            s.execute(deleteSQL);
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

    public Post getPostById(String id) {
        // TODO Auto-generated method stub
        return (Post)super.doFindObjectById(id);
    }

    public List getPostByComId(String comId) {
        String hql="from "+getModelClass().getName()+" as c where c.comId=?";
        List para=new ArrayList();
        para.add(comId);
        return  this.doFindObjectListByParam(hql,para);
    }
}