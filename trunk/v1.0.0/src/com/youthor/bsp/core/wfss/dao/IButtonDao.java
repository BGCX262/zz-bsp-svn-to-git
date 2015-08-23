package com.youthor.bsp.core.wfss.dao;

import java.util.List;

import com.youthor.bsp.core.wfss.model.Button;

public interface IButtonDao {

    List getAllButton();

    String updateButton(Button button);

    String addButton(Button button);

    Button getButtonById(String buttonId);

}
