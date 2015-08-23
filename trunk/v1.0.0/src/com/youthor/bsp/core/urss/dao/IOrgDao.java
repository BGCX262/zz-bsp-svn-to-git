package com.youthor.bsp.core.urss.dao;

import java.util.List;

import com.youthor.bsp.core.urss.model.Org;

public interface IOrgDao {

    List getOrgListByParent(String orgParentId);

    String updateOrg(Org orgTreePo);

    String addOrg(Org orgTreePo);

    Org getTreeRootOrg(String currComId);
    
    Org getOrgById(String orgId);
    
    boolean isAddComToOrgTree(String currComId);

	int getHasOrgNum(String orgTypeCode, String comId);
}
