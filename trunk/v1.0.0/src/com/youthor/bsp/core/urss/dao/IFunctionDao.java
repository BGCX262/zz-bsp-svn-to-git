package com.youthor.bsp.core.urss.dao;

import java.util.List;

import com.youthor.bsp.core.urss.model.Function;

public interface IFunctionDao {

    List getTopFunctionByAppId(String appid);

    boolean deleteFunctionByIds(String[] functionIds);

    Function getFunctionById(String funModuleId);

    List getSubFunctionByParentId(String funModuleId);

    void updateFunction(Function function);

    void addFunction(Function function);

    List getAllFunctionByAppId(String appId);

    List getUserMenuByAppIdOrgId(String appId, String orgId);

    List getUserMenuDetailByAllFunId(String allFunId);

    List getAllSubFunctionByParentId(String parentId);

    Function getFunctionByAppIdFunCode(String appId, String funCode);

}
