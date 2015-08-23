package com.youthor.bsp.view.wfss.dict;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.core.wfss.model.Activity;
import com.youthor.bsp.view.abdf.common.criterion.IDictDynamic;
import com.youthor.bsp.view.wfss.web.form.ProcessForm;

public class ActivityDict implements IDictDynamic{

    public List execute(HttpServletRequest request) {
        ProcessForm processForm=(ProcessForm)request.getAttribute("ProcessForm");
        String processId="";
        if(processForm!=null)
        {
            processId=processForm.getProcessId();
        }
        if(processId==null||processId.equals(""))
        {
            processId=request.getParameter("toProcessId");
        }
        if(processId==null||processId.equals(""))
        {
            processId=(String)request.getAttribute("toProcessId");
        }
        List returnList=new ArrayList();
        if(StringHelper.doWithNull(processId).equals(""))
        {
            Item item=new Item();
            item.setKey("");
            item.setValue("无环节");
            returnList.add(item);
        }
        else
        {
            IWfssServiceFacade wfssServiceFacade=(IWfssServiceFacade)SpringHelper.getBean("wfssServiceFacade");
            List activityList=wfssServiceFacade.getActivityByProcessId(processId);
            if(activityList==null||activityList.isEmpty())
            {
                Item item=new Item();
                item.setKey("");
                item.setValue("无环节");
                returnList.add(item);
            }
            else
            {
                for(int i=0;i<activityList.size();i++)
                {
                    Activity activity=(Activity)activityList.get(i);
                    Item item=new Item();
                    item.setKey(activity.getActivityId());
                    item.setValue(activity.getActivityName());
                    returnList.add(item);
                }
            }
        }
        return returnList;
    }
    

}
