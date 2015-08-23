package com.youthor.bsp.core.urss.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.GUIDHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;

import com.youthor.bsp.core.urss.dao.IOrgDao;
import com.youthor.bsp.core.urss.model.Org;

public class OrgDaoImpl extends BaseDAOHibernate implements IOrgDao{
    protected Class getModelClass() {
        return Org.class;
    }

    public List getOrgListByParent(String orgParentId) {
        String hql="from Org as org where org.parentId='"+orgParentId+"' order by org.orderIndex";
        return super.doFind(hql);
    }

    public String updateOrg(Org orgTreePo) {
        String returnValue=orgTreePo.getOrgId();
        super.doUpdateObject(orgTreePo);
        return returnValue;
    }

    public String addOrg(Org orgTreePo) {
        String returnValue="";
        if(orgTreePo.getOrgId()==null||orgTreePo.getOrgId().equals(""))
          returnValue=GUIDHelper.genRandomGUID();
        else
            returnValue=orgTreePo.getOrgId();
        //先保存组织架构中的数据
        //组装sql语句
        Connection conn=super.getSession().connection();
        String updateMain="insert into URSS_ORG_TREE(QUERY_CODE,org_Id,org_Name,parent_Id,ORG_TYPE_CODE,order_index,all_parent_name,all_parent_id,ALL_PARENT_CODE,user_id) values('"+orgTreePo.getQueryCode()+"'," +
                "'"+returnValue+"','"+orgTreePo.getOrgName()+"','"+StringHelper.doWithNull(orgTreePo.getParentId())+"','"+orgTreePo.getOrgTypeCode()+"'," +
                        ""+orgTreePo.getOrderIndex()+",'"+StringHelper.doWithNull(orgTreePo.getAllParentName())+"'" +
                ",'"+StringHelper.doWithNull(orgTreePo.getAllParentId())+"','"+StringHelper.doWithNull(orgTreePo.getAllParentCode())+"','"+StringHelper.doWithNull(orgTreePo.getUserId())+"')";
        Statement st=null;
        try{
            conn.setAutoCommit(false);
            st=conn.createStatement();
            st.addBatch(updateMain);
            st.executeBatch();
            conn.commit();
        }
        catch(Exception ex)
        {
            try {
                conn.rollback();
            } catch (SQLException e) {
                
                e.printStackTrace();
            }
            ex.printStackTrace();
        }
        finally
        {
            try{
            if(st!=null)
                st.close();
            
            }
            catch(Exception ex)
            {
                
            }
        }
        return returnValue;
    }

    public Org getTreeRootOrg(String currComId) {
        String hql="from Org as org where (org.parentId is null or org.parentId='')";
        Org orgTreePo =(Org)super.doFind(hql).get(0);
        
        return orgTreePo;
    }
    
    
    

    public boolean isAddComToOrgTree(String currComId) {
        String hql="select count(*) from "+this.getModelClass().getName()+" as a where a.orgId='"+currComId+"'";
        int i=this.getRowsByHQL(hql);
        if(i>=1) return true;
        return false;
    }

    public Org getOrgById(String orgId) {
        
        Org orgTreePo =(Org)super.doFindObjectById(orgId);
        
        return orgTreePo;
    }


	public int getHasOrgNum(String orgTypeCode, String comId) {
		List para = new ArrayList();
		String hql = "select count(*) as num from "+getModelClass().getName() +" where orgTypeCode=? and comId=? ";
		para.add(orgTypeCode);
		para.add(comId);
		List l = this.doFindObjectListByParam(hql, para);
		

	     int returnValue=0;
	    if (l != null && !l.isEmpty()) {
	        returnValue = ((Integer) l.get(0)).intValue();
	    }
	    return returnValue;
	}

}
