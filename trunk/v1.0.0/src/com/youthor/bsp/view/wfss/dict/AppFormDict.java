package com.youthor.bsp.view.wfss.dict;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.core.facade.IWfssServiceFacade;
import com.youthor.bsp.core.urss.model.App;
import com.youthor.bsp.core.wfss.model.AppForm;
import com.youthor.bsp.view.abdf.common.criterion.IDictDynamic;
import com.youthor.bsp.view.abdf.common.helper.WebHelper;

public class AppFormDict implements IDictDynamic{

    public List execute(HttpServletRequest request) {
        IWfssServiceFacade wfssServiceFacade=(IWfssServiceFacade)SpringHelper.getBean("wfssServiceFacade");
        List appFormList=null;
        //如果是公司用户
        App app=WebHelper.getApp();
        List list =(List)request.getAttribute(app.getAppId()+ "_AppFormDict");
        if(list!=null) return list;
        
       
        
        String editionId = request.getParameter("editionId");
        if (editionId==null || editionId.equals("")) {
            editionId = (String) request.getAttribute("editionId");
        }
        if (editionId==null || editionId.equals("")) return new ArrayList();
        
        appFormList=wfssServiceFacade.getAppFormByAppIdEditionId(app.getAppId(),editionId);
        
        if(appFormList==null&&appFormList.size()==0) return new ArrayList();
        List returnList=new ArrayList();
        
        for(int i=0;i<appFormList.size();i++)
        {
            AppForm appForm=(AppForm)appFormList.get(i);
            Item item=new Item();
            item.setKey(appForm.getAppFormId());
            item.setValue(appForm.getAppFormName());
            returnList.add(item);
        }
        if(returnList.isEmpty())
        {
            Item item=new Item();
            item.setKey("");
            item.setValue("无表单");
            returnList.add(item);
        }
        request.setAttribute(app.getAppId()+ "_AppFormDict",returnList);
        return returnList;
    }

}
