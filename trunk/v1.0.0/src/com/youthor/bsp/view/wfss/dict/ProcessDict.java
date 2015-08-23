package com.youthor.bsp.view.wfss.dict;

import java.util.ArrayList;
import java.util.List;
import com.youthor.bsp.core.wfss.model.Process;
import javax.servlet.http.HttpServletRequest;

import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.view.abdf.common.criterion.IDictDynamic;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;

public class ProcessDict implements IDictDynamic{

    public List execute(HttpServletRequest request) {
        String appId=WebHelper.getAppId();
        IWfssServiceFacade wfssServiceFacade=(IWfssServiceFacade)SpringHelper.getBean("wfssServiceFacade");
        List processList=wfssServiceFacade.getProcessByAppId(appId);
        List returnList=new ArrayList();
        
            for(int i=0;i<processList.size();i++)
            {
                Process process=(Process)processList.get(i);
                Item item=new Item();
                item.setKey(process.getProcessId());
                item.setValue(process.getProcessName());
                returnList.add(item);
            }
        
        return returnList;
    }

}
