package com.youthor.bsp.view.urss.web.action.helper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.youthor.bsp.core.abdf.common.helper.StringHelper;
import com.youthor.bsp.core.urss.model.Right;

public class RightActionHelper {
    
public  static void getLinkAssign(HttpServletRequest request, String memberId, String appId, List rightList, String[] arr) {
        
        String linkAssigns=request.getParameter("linkAssign_"+arr[0]);
        if(linkAssigns!=null&&!linkAssigns.equals(""))
        {
            String [] arrTemp=StringHelper.split(linkAssigns,",");
            for(int j=0;j<arrTemp.length;j++)
            {
                if(isCanAdd(rightList,arrTemp[j]))
                {
                    Right  right=new Right();
                    right.setAppId(appId);
                    right.setMemberId(memberId);
                    right.setResourceId(arrTemp[j]);
                    right.setFunModuleId(arr[1]);
                    rightList.add(right);
                }
            }
        }
    }

public static  boolean isCanAdd(List rightList,String resourceId)
{
    if(rightList==null||rightList.isEmpty()) return true;
    for(int i=0;i<rightList.size();i++)
    {
        Right right=(Right)rightList.get(i);
        if(right.getResourceId().equals(resourceId))
            return false;
    }
    return true;
}
}
