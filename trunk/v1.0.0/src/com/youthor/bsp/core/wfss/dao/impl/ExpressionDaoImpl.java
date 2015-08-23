package com.youthor.bsp.core.wfss.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.common.page.PageHelper;
import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.wfss.dao.IExpressionDao;
import com.youthor.bsp.core.wfss.model.Expression;

public class ExpressionDaoImpl extends BaseDAOHibernate implements IExpressionDao{

    protected Class getModelClass() {
        return Expression.class;
    }

    public String addExpression(Expression expression) {
        super.doCreateObject(expression);
        return expression.getExpId();
    }

    public boolean updateExpression(Expression expression) {
        super.doUpdateObject(expression);
        return true;
    }

    public Expression getExpressionById(String expId) {
        
        return (Expression)this.doFindObjectById(expId);
    }

    public boolean deleteExpressionByIds(String[] ids) {
        // TODO Auto-generated method stub
        return false;
    }

    public List listExpressionComId(Page page, String comId,String expType) {
        String hql="from "+getModelClass().getName()+" as c where c.comId=? and c.expType=?";
        List para=new ArrayList();
        para.add(comId);
        para.add(expType);
        return  PageHelper.executeQuery(page,this.getSession(),hql,para).list();
    }

    public List listExpressionComAppIds(Page page, String comId, String[] appIds,String expType) {
        String where =StringHelper.arrToSqlString(appIds);
        String hql="from "+getModelClass().getName()+" as c where c.comId=? and c.appId in("+where+") and c.expType=?";
        List para=new ArrayList();
        para.add(comId);
        para.add(expType);
        return  PageHelper.executeQuery(page,this.getSession(),hql,para).list();
    }

}
