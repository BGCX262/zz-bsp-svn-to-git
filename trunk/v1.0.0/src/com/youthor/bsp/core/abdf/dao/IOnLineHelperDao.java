package com.youthor.bsp.core.abdf.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.model.OnLineHelper;

public interface IOnLineHelperDao {

    List getAllOnLineHelper();

    List getTopOnLineHelper();

    String addOnLineHelper(OnLineHelper onLineHelper);

    String updateOnLineHelper(OnLineHelper onLineHelper);

    OnLineHelper getOnLineHelperById(String id);

    List getAllSubOnLineHelperByParentId(String onLineHelperId);

    List getSubOnLineHelperByParentId(String onLineHelperId);

    boolean deleteOnLineHelper(OnLineHelper onLineHelper);

    OnLineHelper getOnLineHelperByCode(String onLineHelperCode);

}
