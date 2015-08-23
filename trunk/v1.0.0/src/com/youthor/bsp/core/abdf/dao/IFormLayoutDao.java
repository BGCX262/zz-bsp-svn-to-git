package com.youthor.bsp.core.abdf.dao;

import java.util.List;

import com.youthor.bsp.core.abdf.model.FormLayout;

public interface IFormLayoutDao {

    String addFormLayout(FormLayout formLayout);

    String updateFormLayout(FormLayout formLayout);

    FormLayout getFormLayoutById(String id);

    void deleteFormLayout(FormLayout formLayout);

    List getFormLayoutListByParentId(String parentId);

}
