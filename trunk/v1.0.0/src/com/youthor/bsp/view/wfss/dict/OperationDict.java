package com.youthor.bsp.view.wfss.dict;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.core.wfss.model.Button;
import com.youthor.bsp.view.abdf.common.criterion.IDictDynamic;

public class OperationDict implements IDictDynamic{
public List execute(HttpServletRequest request) {
        
        IWfssServiceFacade wfssServiceFacade=(IWfssServiceFacade)SpringHelper.getBean("wfssServiceFacade");
        List list = wfssServiceFacade.getAllButton();
        List returnList=new ArrayList();
        for(int i=0;i<list.size();i++)
        {
            Button button=(Button)list.get(i);
            Item item=new Item();
            item.setKey(button.getButtonStyleId());
            item.setValue(button.getButtonName());
            returnList.add(item);
        }
        return returnList;
   }
}
