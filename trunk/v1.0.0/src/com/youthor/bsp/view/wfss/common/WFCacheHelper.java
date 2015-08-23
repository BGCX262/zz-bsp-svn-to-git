package com.youthor.bsp.view.wfss.common;


import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine;
import com.youthor.bsp.core.wfss.model.Activity;
import com.youthor.bsp.core.wfss.model.Process;
public class WFCacheHelper {
    
    
    public static Item getInitProcessInfo(String processInfo)
    {
        IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
         String [] processInfoArr=StringHelper.split(processInfo,"][");
          Item item =new Item();
           //从首环节启动
           if(processInfoArr.length==1)
           {
               Process process=wfCacheEngine.getProcessByAlias(processInfoArr[0], "Y");
               
               item.setKey(process.getProcessId());
               item.setValue(process.getFirstActivityId());
           }
           else
           {
               Process process=wfCacheEngine.getProcessByAlias(processInfoArr[0],"Y");
               item.setKey(process.getProcessId());
               Activity acticity=wfCacheEngine.getActivityByAlias(processInfoArr[0], "Y",processInfoArr[1]);
               item.setValue(acticity.getActivityId());
           }
           return item;
    }
        
}
