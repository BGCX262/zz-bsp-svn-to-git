package com.youthor.bsp.view.urss.dict;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.ComUser;
import com.youthor.bsp.view.abdf.common.criterion.IDictDynamic;
import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.view.urss.helper.WebHelper;

public class AppAdmin implements IDictDynamic{
public List execute(HttpServletRequest request) {
        
        IUrssServiceFacade urssServiceFacade=(IUrssServiceFacade)SpringHelper.getBean("urssServiceFacade");
        List appUserList=null;
        //如果是公司用户
        if(WebHelper.isComAdmin(request.getSession()))
        {
            appUserList=urssServiceFacade.getAppAdminByComId(WebHelper.getCurrComId(request.getSession()));
        }
        if(appUserList==null&&appUserList.size()==0) return new ArrayList();
        List returnList=new ArrayList();
        
        for(int i=0;i<appUserList.size();i++)
        {
            ComUser comUser=(ComUser)appUserList.get(i);
            Item item=new Item();
            item.setKey(comUser.getComUserId());
            item.setValue(comUser.getComUserName());
            returnList.add(item);
        }
        return returnList;
    }
}
