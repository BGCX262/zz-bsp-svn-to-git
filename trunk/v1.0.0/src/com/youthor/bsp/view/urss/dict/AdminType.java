package com.youthor.bsp.view.urss.dict;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.view.abdf.common.criterion.IDictDynamic;
import com.youthor.bsp.view.urss.helper.WebHelper;

public class AdminType implements IDictDynamic{

    
    public List execute(HttpServletRequest request) {
        List returnValue=new ArrayList();
        if(WebHelper.isSuperAdmin(request.getSession()))
        {
            Item item=new Item();
            item.setKey("-1");
            item.setValue("超级管理员");
            returnValue.add(item);
            
            item=new Item();
            item.setKey("0");
            item.setValue("公司管理员");
            returnValue.add(item);
        }
        else if(WebHelper.isComAdmin(request.getSession()))
        {
            Item item=new Item();
            item.setKey("0");
            item.setValue("公司管理员");
            returnValue.add(item);
            
            item=new Item();
            item.setKey("1");
            item.setValue("应用管理员");
            returnValue.add(item);
        }
        return returnValue;
    }

}
