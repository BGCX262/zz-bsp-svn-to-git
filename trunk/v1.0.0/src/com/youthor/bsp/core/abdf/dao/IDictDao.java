package com.youthor.bsp.core.abdf.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.common.page.model.Page;
import com.youthor.bsp.core.abdf.model.Dict;


public interface IDictDao {

    List listDictByDictTypeId(Page page, String dictTypeId);

    String addDict(Dict dict);

    String updateDict(Dict dict);

    Dict getDictById(String dictId);

    List getDictByDictTypeId(String dictTypeId);



}
