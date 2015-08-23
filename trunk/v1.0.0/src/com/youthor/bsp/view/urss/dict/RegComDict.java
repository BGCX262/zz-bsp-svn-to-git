package com.youthor.bsp.view.urss.dict;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.App;
import com.youthor.bsp.core.urss.model.RegCompany;
import com.youthor.bsp.view.abdf.common.criterion.IDictDynamic;
import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.view.urss.helper.WebHelper;

public class RegComDict implements IDictDynamic{

    public List execute(HttpServletRequest request) {
        
        IUrssServiceFacade urssServiceFacade=(IUrssServiceFacade)SpringHelper.getBean("urssServiceFacade");
        List regComList=urssServiceFacade.getCanAddUserComs();
        List returnList=new ArrayList();
        
        for(int i=0;i<regComList.size();i++)
        {
            RegCompany regCompany=(RegCompany)regComList.get(i);
            Item item=new Item();
            item.setKey(regCompany.getComId());
            item.setValue(regCompany.getRegComName());
            returnList.add(item);
        }
        if(returnList.isEmpty())
        {
            Item item=new Item();
            item.setKey("");
            item.setValue("无注册公司可注册公司用户");
            returnList.add(item);
        }
        return returnList;
    }

}
