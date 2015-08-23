package com.youthor.bsp.core.wfss.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.wfss.model.Expression;

public interface IExpressionDao {

    String addExpression(Expression expression);

    boolean updateExpression(Expression expression);

    Expression getExpressionById(String expId);

    boolean deleteExpressionByIds(String[] ids);

    List listExpressionComId(Page page, String comId,String expType);

    List listExpressionComAppIds(Page page, String comId, String[] appIds,String expType);

}
