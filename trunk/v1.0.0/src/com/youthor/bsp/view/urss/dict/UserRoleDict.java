package com.youthor.bsp.view.urss.dict;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.App;
import com.youthor.bsp.core.urss.model.Org;
import com.youthor.bsp.core.urss.model.Role;
import com.youthor.bsp.view.abdf.common.criterion.IDictDynamic;
import com.youthor.bsp.core.abdf.common.AbdfCache;
import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.view.urss.helper.WebHelper;

public class UserRoleDict implements IDictDynamic{

    public List execute(HttpServletRequest request) {
        

        IUrssServiceFacade urssServiceFacade=(IUrssServiceFacade)SpringHelper.getBean("urssServiceFacade");
        List returnList=new ArrayList();
        Org org=(Org)request.getAttribute("org");
        String  appId=(String)request.getAttribute("appId");
         if(appId == null || appId.equals("")) {
                App appG = AbdfCache.app;
                appId = appG.getAppId();
            }
        List userRole =urssServiceFacade.getRoleByAppIdOrgId(appId,org.getOrgId());
        
        for(int i=0;i<userRole.size();i++)
        {
            Role role=(Role)userRole.get(i);
            Item item=new Item();
            item.setKey(role.getRoleId());
            item.setValue(role.getRoleName());
            returnList.add(item);
        }
        return returnList;
    }

}
