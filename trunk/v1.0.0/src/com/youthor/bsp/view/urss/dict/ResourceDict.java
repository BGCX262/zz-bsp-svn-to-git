package com.youthor.bsp.view.urss.dict;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.abdf.model.Item;
import com.youthor.bsp.core.facade.IUrssServiceFacade;
import com.youthor.bsp.core.urss.model.ComUser;
import com.youthor.bsp.core.urss.model.Resource;
import com.youthor.bsp.view.abdf.common.criterion.IDictDynamic;
import com.youthor.bsp.core.abdf.common.helper.SpringHelper;
import com.youthor.bsp.view.urss.helper.WebHelper;
import com.youthor.bsp.view.urss.web.form.ResourceForm;

public class ResourceDict implements IDictDynamic{

    
    public List execute(HttpServletRequest request) {
        List returnValue=new ArrayList();
        ResourceForm resourceForm=(ResourceForm)request.getAttribute("ResourceForm");
        List resourcesList=(List)request.getAttribute("resourcesList");
        if(resourcesList==null)
        {
            String funId=resourceForm.getFunModuleId();
            IUrssServiceFacade urssServiceFacade=(IUrssServiceFacade)SpringHelper.getBean("urssServiceFacade");
            resourcesList=urssServiceFacade.getResourcesByFunId(funId);
            request.setAttribute("resourcesList",resourcesList);
        }
        for(int i=0;i<resourcesList.size();i++)
        {
            Resource resource=(Resource)resourcesList.get(i);
//            if (!returnValue.isEmpty()) {
//                for(int j=returnValue.size()-1;j>=0;j--) {
//                    Item item=(Item)returnValue.get(j);
//                    if(StringHelper.doWithNull(resource.getLinkAssign()).equals("Y"))
//                    {
//                      String linkAssignValue = StringHelper.doWithNull(resource.getLinkAssignValue());
//                      String [] linkAssignValues = StringHelper.split(linkAssignValue, ",");
//                      for(int n=0;n<linkAssignValues.length;n++) {
//                          if (item.getKey().equals(linkAssignValues[n])) {
//                              returnValue.remove(j);
//                              break;
//                          }
//                      }
//                    }
//                }
//            }
            if(resource.getResourceId().equals(resourceForm.getResourceId())) continue;
            if(StringHelper.doWithNull(resource.getLinkAssign()).equals("Y"))
            {
                Item item=new Item();
                item.setKey(resource.getResourceId());
                item.setValue(resource.getResourceName());
                returnValue.add(item);
            }
        }
        return returnValue;
    }

}

