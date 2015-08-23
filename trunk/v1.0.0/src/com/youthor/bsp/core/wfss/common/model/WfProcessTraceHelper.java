package com.youthor.bsp.core.wfss.common.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.youthor.bsp.core.wfss.model.ActivityInstance;

public class WfProcessTraceHelper implements Comparable{
    private ActivityInstance activityInstance;//流程跟踪环节实例
    private List wfProcessTraceHelperList=new ArrayList();
    
public ActivityInstance getActivityInstance() {
        return activityInstance;
    }

    public void setActivityInstance(ActivityInstance activityInstance) {
        this.activityInstance = activityInstance;
    }

    public List getWfProcessTraceHelperList() {
        return wfProcessTraceHelperList;
    }

    public void setWfProcessTraceHelperList(List wfProcessTraceHelperList) {
        this.wfProcessTraceHelperList = wfProcessTraceHelperList;
    }

    private static void setWfProcessTraceHelperChild(List returnValue,List listWfProcessTrace,WfProcessTraceHelper wfProcessTraceHelper)
    {
        //得到下面的子
        List childLit=wfProcessTraceHelper.getWfProcessTraceHelperList();
        if(childLit==null||childLit.isEmpty()) return;
        //对子进行loop
        for(int i=0;i<childLit.size();i++)
        {
            WfProcessTraceHelper wfProcessTraceHelperChild=(WfProcessTraceHelper)childLit.get(i);
            //得到子本身
            ActivityInstance activityInstance=wfProcessTraceHelperChild.getActivityInstance();
            for(int j=0;j<listWfProcessTrace.size();j++)
            {
                  ActivityInstance activityInstanceTemp=(ActivityInstance)listWfProcessTrace.get(j);
                  if(activityInstanceTemp.getParentActivityInstId()!=null&&activityInstanceTemp.getParentActivityInstId().equals(activityInstance.getActivityInstanceId()))
                  {
                      WfProcessTraceHelper wfProcessTraceHelperTemp=new WfProcessTraceHelper();
                      wfProcessTraceHelperTemp.setActivityInstance(activityInstanceTemp);
                      wfProcessTraceHelperChild.getWfProcessTraceHelperList().add(wfProcessTraceHelperTemp);
                  }
            }  
            if(wfProcessTraceHelperChild.getWfProcessTraceHelperList().size()>0)
                returnValue.add(wfProcessTraceHelperChild);
            setWfProcessTraceHelperChild(returnValue,listWfProcessTrace,wfProcessTraceHelperChild);
        }
        
    }
public static List getWfProcessTraceHelper(List listWfProcessTrace)
   {
      List returnValue=new ArrayList();
    //新建流程跟踪helper对象
       WfProcessTraceHelper wfProcessTraceHelper=new WfProcessTraceHelper(); 
       if(listWfProcessTrace==null||listWfProcessTrace.isEmpty()) return null;
       //对所有环节实例进行loop
       for(int i=0;i<listWfProcessTrace.size();i++)
       {
           ActivityInstance activityInstance=(ActivityInstance)listWfProcessTrace.get(i);
           //如果是顶层环节实例
           if(activityInstance.getParentActivityInstId()==null||activityInstance.equals(""))
           {
             //加入流程跟踪helper对象
               wfProcessTraceHelper.setActivityInstance(activityInstance);
               //最次对所有环节实例loop
               for(int j=0;j<listWfProcessTrace.size();j++)
               {
                     ActivityInstance activityInstanceTemp=(ActivityInstance)listWfProcessTrace.get(j);
                     //如果是顶层的子,加入处理
                     if(activityInstanceTemp.getParentActivityInstId()!=null&&activityInstanceTemp.getParentActivityInstId().equals(activityInstance.getActivityInstanceId()))
                     {
                         WfProcessTraceHelper wfProcessTraceHelperTemp=new WfProcessTraceHelper();
                         wfProcessTraceHelperTemp.setActivityInstance(activityInstanceTemp);
                         wfProcessTraceHelper.getWfProcessTraceHelperList().add(wfProcessTraceHelperTemp);
                     }
               }     
           }
       }
       //加入到返回值中
       returnValue.add(wfProcessTraceHelper);
       setWfProcessTraceHelperChild(returnValue,listWfProcessTrace,wfProcessTraceHelper);
       //Collections.sort(returnValue);
       return returnValue;
   }


public int compareTo(Object arg0) {
    WfProcessTraceHelper wfProcessTraceHelper=(WfProcessTraceHelper)arg0;
    if(this.getActivityInstance().getCreateDate().getTime()>wfProcessTraceHelper.getActivityInstance().getCreateDate().getTime())
        return 1;
    else if(this.getActivityInstance().getCreateDate().getTime()>wfProcessTraceHelper.getActivityInstance().getCreateDate().getTime())
      return 0;
    else
         return -1;
}
}
