package com.youthor.bsp.view.urss.dict;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.App;
import com.youthor.bsp.view.abdf.common.criterion.IDictDynamic;
import com.youthor.bsp.core.abdf.common.AbdfCache;
import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.view.urss.helper.WebHelper;

public class AppDict implements IDictDynamic{

    public List execute(HttpServletRequest request) {
        
        List rightApp=(List)request.getAttribute("returnList");
        if(rightApp!=null) return rightApp;
        IUrssServiceFacade urssServiceFacade=(IUrssServiceFacade)SpringHelper.getBean("urssServiceFacade");
        List appList=new ArrayList();
        appList.add(AbdfCache.app);
        if(appList==null&&appList.size()==0) return new ArrayList();
        List returnList=new ArrayList();
        
        for(int i=0;i<appList.size();i++)
        {
            App app=(App)appList.get(i);
            Item item=new Item();
            item.setKey(app.getAppId());
            item.setValue(app.getAppName());
            returnList.add(item);
        }
        request.setAttribute("rightApp",appList);
        request.setAttribute("returnList",returnList);
        
        return returnList;
    }

}
