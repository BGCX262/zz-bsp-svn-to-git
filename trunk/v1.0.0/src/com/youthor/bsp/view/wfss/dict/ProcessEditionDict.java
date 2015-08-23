package com.youthor.bsp.view.wfss.dict;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.core.wfss.model.ProcessEdition;
import com.youthor.bsp.view.abdf.common.criterion.IDictDynamic;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;

public class ProcessEditionDict implements IDictDynamic{
     public List execute(HttpServletRequest request) {
        IWfssServiceFacade wfssServiceFacade=(IWfssServiceFacade)SpringHelper.getBean("wfssServiceFacade");
        HttpSession session = request.getSession();
         String comId = WebHelper.getTopOrgId(session, "GS");
         List list = wfssServiceFacade.getProcessEditionByComId(comId);
         List returnList=new ArrayList();
         if (list!=null && list.size()>0) {
             for(int i=0;i<list.size();i++)
             {
               ProcessEdition processEdition=(ProcessEdition)list.get(i);
                 Item item=new Item();
                 item.setKey(processEdition.getId());
                 item.setValue(processEdition.getName());
                 returnList.add(item);
             }
         }
         
         return returnList;
     }
}
