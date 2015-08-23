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
import com.youthor.bsp.core.urss.dao.IDeskDao;
import com.youthor.bsp.core.urss.model.Desk;

/**
 * @author 胡友成  2007-11-3
 *
 */
public class DeskDaoImpl extends BaseDAOHibernate implements IDeskDao{

    protected Class getModelClass() {
        return Desk.class;
    }

    public List queryPageDeskByComId(Page page,String comId) {
        String hql="from "+getModelClass().getName()+" as c where c.comId=? order by c.orderIndex";
        List para=new ArrayList();
        para.add(comId);
        return  PageHelper.executeQuery(page,this.getSession(),hql,para).list();
    }

    public String addDesk(Desk desk) {
        super.doCreateObject(desk);
        return desk.getDeskId();
    }

    public String updateDesk(Desk desk) {
        super.doUpdateObject(desk);
        return desk.getDeskId();
    }

    public boolean deleteDeskByIds(String [] ids) {
        if(ids==null||ids.length==0) return true;
        Connection c=this.getSession().connection();
        Statement s=null;
        String sqlWhere =StringHelper.arrToSqlString(ids);
        try
        {
            String deleteSQL="delete URSS_DESK  where desk_id in("+sqlWhere+")";
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

    public Desk getDeskById(String id) {
        // TODO Auto-generated method stub
        return (Desk)super.doFindObjectById(id);
    }

    public List queryPageDeskByUserId(Page page, String comId, String userId) {
        String hql="from "+getModelClass().getName()+" as c where c.comId=? and c.appId in(select app.appId from App as app where app.appMrg=?) order by c.orderIndex";
        List para=new ArrayList();
        para.add(comId);
        para.add(userId);
        return  PageHelper.executeQuery(page,this.getSession(),hql,para).list();
    }


}
