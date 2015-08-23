package com.youthor.bsp.core.abdf.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.model.DictTreeType;
public interface IDictTreeTypeDao {

    List getAlltDictTypeTree();

    String addDictTreeType(DictTreeType dictTreeType);

    String updateDictTreeType(DictTreeType dictTreeType);

    DictTreeType getDictTreeTypeById(String treeTypeId);

    DictTreeType getDictTreeTypeByCode(String treeType);

    

}
