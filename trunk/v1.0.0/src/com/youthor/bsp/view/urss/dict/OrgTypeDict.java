package com.youthor.bsp.view.urss.dict;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.OrgType;
import com.youthor.bsp.view.abdf.common.criterion.IDictDynamic;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;

public class OrgTypeDict implements IDictDynamic{

    
    public List execute(HttpServletRequest request) {
        List returnValue=new ArrayList();
        Item item=new Item();
//        item.setKey("GS");
//        item.setValue("公司");
//        returnValue.add(item);
//        item=new Item();
//        item.setKey("BM");
//        item.setValue("部门");
//        returnValue.add(item);
        HttpSession session=request.getSession();
        String comId = WebHelper.getTopOrgId(session, "GS");
       
        IUrssServiceFacade urssServiceFacade=(IUrssServiceFacade)SpringHelper.getBean("urssServiceFacade");
        List orgTypeList=urssServiceFacade.getOrgTypeByComId(comId);
        for(int i=0;i<orgTypeList.size();i++)
        {
            OrgType orgType=(OrgType)orgTypeList.get(i);
            item=new Item();
            
            item.setKey(orgType.getOrgTypeCode());
            item.setValue(orgType.getOrgTypeName());
            if(StringHelper.doWithNull(orgType.getIsUseing()).endsWith("Y"))
            {
              returnValue.add(item);
            }
        }
        
//        item=new Item();
//        item.setKey("YG");
//        item.setValue("员工");
//        returnValue.add(item);
        
        
        
        return returnValue;
    }

}
