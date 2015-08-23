package com.youthor.bsp.core.abdf.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.abdf.model.DictTreeType;

public interface ITreeComponentDao {

    List listTopNodeObjectByType(Page page, DictTreeType dictTreeType);

    List getAllNodeDataByDictTreeType(DictTreeType dictTreeType);
    
    String addTreeObject(Object modelObject);

    String updateTreeObject(Object modelObject);

    Object treeDaogetTreeNodeById(String modelClass, String id);

    List getSubTreeNodesByParentId(String modelClass, String id);

    List getAllSubTreeNodesByParentId(String modelClass, String id);

    void deleteTreeNodeObject(DictTreeType dictTreeType, String id);


}
