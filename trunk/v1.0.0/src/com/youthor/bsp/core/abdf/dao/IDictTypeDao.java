package com.youthor.bsp.core.abdf.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.abdf.model.DictType;

public interface IDictTypeDao {

    DictType getDictTypeById(String dictTypeId);

    List getAllDictType();

    boolean addDictType(DictType dictType);

    boolean updateDictType(DictType dictType);

    boolean deleteDictTypeById(String dictTypeId);

    List getPageDictType();

    List getDictTypeByModuleName(String moduleName);

    boolean deleteDictTypeByIds(String[] ids);

    DictType getDictTyeByComIdCode(String gsId, String dictTypeCode);

}
