package com.youthor.bsp.core.wfss.dao.impl;

import java.util.List;

import com.youthor.bsp.core.abdf.common.base.BaseDAOHibernate;
import com.youthor.bsp.core.wfss.dao.IButtonDao;
import com.youthor.bsp.core.wfss.model.Button;

public class ButtonDaoImpl extends BaseDAOHibernate implements IButtonDao{

    protected Class getModelClass() {
        return Button.class;
    }

    public List getAllButton() {
        String hql="from "+getModelClass().getName()+" as b order by b.orderIndex";
        return super.doFind(hql);
    }

    public String updateButton(Button button) {
        super.doUpdateObject(button);
        return button.getButtonId();
    }

    public String addButton(Button button) {
        super.doCreateObject(button);
        return button.getButtonId();
    }

    public Button getButtonById(String buttonId) {
        Button button=(Button)super.doFindObjectById(buttonId);
        return button;
    }

}
