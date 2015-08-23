/**
 * 
 */
package com.youthor.bsp.core.abdf.dao;

import java.util.List;


import com.youthor.bsp.core.abdf.model.DictTree;






public interface IDictTreeDao {

    DictTree getDictTreeById(String treeId);
    boolean deleteDictTreeByIds(String[] dictTreeIds);
    List getSubDictTreeByParentId(String parentId);
    String addDictTree(DictTree dictTree);
    void updateDictTree(DictTree dictTree);
    List getTopDictTreeByType(String treeType);
    DictTree getDictTreeRoot(String treeType);
    List getAllSubDictTreeByParentId(String treeId);
    List getAllDictTreeByType(String treeType);


    


}
