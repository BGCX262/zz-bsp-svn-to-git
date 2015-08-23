<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Activity"%>
<%@ page import="java.util.*"%>
<%@ page import="com.youthor.bsp.core.wfss.common.model.RouteHelper"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Route"%>
<%@ page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@ page import="com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine"%>
<%@ page import="com.youthor.bsp.core.wfss.model.WorkItemDoing"%>
<%@ page import="com.youthor.bsp.core.wfss.model.ActivityInstance"%>
<%@ page import="com.youthor.bsp.core.facade.IWfssServiceFacade"%>

<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>路由选择</title>
    <%@include file="/bsp/abdf/common.jsp"%>
    <script>
     var orgVo=new OrgVo();
    function openWfSelectOrgWindow(routeId)
    {
       //设置以选的组织
       if(event.srcElement.type!=undefined)
       {
          if(!event.srcElement.checked)
          {
             return;
          }
       }
       var isPointToEndValue=event.srcElement.getAttribute("isPointToEnd");
       if(isPointToEndValue!=null&&isPointToEndValue=='Y') return;
         var values=document.getElementById("route_"+routeId).value;
         
          orgVo.clearSubOrgVos();
         if(values!=null&&values!="")
         {
            var arrTotal=values.split("][");
            var arr0=arrTotal[0].split(",");
            var arr1=arrTotal[1].split(",");
             var arr2=arrTotal[2].split(",");
             for(var i=0;i<arr0.length;i++)
             {
                   var orgVoTemp=new  OrgVo();
                   orgVoTemp.setOrgId(arr0[i]);
                   orgVoTemp.setOrgName(arr1[i]);
                   orgVoTemp.setOrgType(arr2[i]);
                   orgVo.getSubOrgVos()[i]=orgVoTemp;
             }
        }
         var selectObjCR=document.getElementById("itemId_"+routeId);
      
       var returnValue=showModalDialog('<%=baseURL%>/forwardOrgSelectFrame_wfss.do?routeId='+routeId, window,'dialogHeight:500px;dialogWidth:650px;status=off');
        if(returnValue==null) 
        {
          if(values!="")
          {
              selectObjCR.checked=true;
          }
          else
          {
             selectObjCR.checked=false;
          }
           
          return ;
        }
        
       var subOrgList=orgVo.getSubOrgVos();
       var ids="";
       var names="";
       var orgTypes="";
        for(var i=0;i<subOrgList.length;i++)
        {
            var valueObj=subOrgList[i];
            ids=ids+valueObj.getOrgId()+",";
             names=names+valueObj.getOrgName()+",";
            orgTypes=orgTypes+valueObj.getOrgType()+",";
        }
        if(ids!="")
        {
          ids=ids.substring(0,ids.length-1);
        } 
        if(names!="")
        {
          names=names.substring(0,names.length-1);
        } 
        if(orgTypes!="")
        {
          orgTypes=orgTypes.substring(0,orgTypes.length-1);
        } 
        var allValues="";
        if(ids!='')
        {
          allValues=ids+"]["+names+"]["+orgTypes;
          selectObjCR.checked=true;
        }
        else
        {
          selectObjCR.checked=false;
        }
        document.getElementById("route_org_"+routeId).innerHTML=names;
         document.getElementById("route_"+routeId).value=allValues;
    }
    function affirClose()
    {
       returnValue=false;
       window.close();
    }
    
    var SUBMIT_WF_VALUE=window.dialogArguments.SUBMIT_WF_VALUE;
    function selectRouteOk()
    {
        var itemIds=document.getElementsByName("itemId");
        var isSelect=false;
        var allReturnValue="";
        var selectNum=0;
        var isSelectToEnd=false;
        for(var i=0;i<itemIds.length;i++)
        {
            if(itemIds[i].checked)
            {
               isSelect=true;
               var allOrgValue=document.getElementById("route_"+itemIds[i].value).value;
               if(allOrgValue==''&&itemIds[i].getAttribute("isPointToEnd")=='N' && itemIds[i].getAttribute("needSelectExecutor") =='true')
               {
                  alert( "路由 "+itemIds[i].getAttribute("routeName")+" 未选择参与者，请确认！");
                  return;
               }
               if(itemIds[i].getAttribute("isPointToEnd")=='Y')
               {
                  isSelectToEnd=true;
               }
               selectNum=selectNum+1;
               allReturnValue=allReturnValue+itemIds[i].value+"]["+allOrgValue+"}";
            }
        }
        if(selectNum>1&&isSelectToEnd)
        {
           alert("流程结束路由不能同其它非流程结束路由一并选择！");
           return;
        }
         if(selectNum==0)
        {
           alert("请选择路由信息！");
           return;
        }
        if(allReturnValue!="")
        {
           allReturnValue=allReturnValue.substring(0,allReturnValue.length-1);
        }
       
        SUBMIT_WF_VALUE.setKey(allReturnValue);
        //alert(allReturnValue);
       SUBMIT_WF_VALUE.setValue(document.getElementById("opinion").value);
         returnValue=true;
        window.close();
    }
    </script>
    </head>
    <body>
   
<table border="0" width="100%" align="center">
    <tr>
        <td>
            
    <table <%=tableStyle%> width="100%">
            <tr class=ListTableRow>
                <td colspan="4">
                    <input type='button' name='power_button'  value='确定提交'   class='Button'  onclick="selectRouteOk()">&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='关闭'   class='Button3'  onclick="affirClose()">&nbsp;&nbsp;
                   </td>
            </tr>
            
            <tr>
            <th align="center" class="ListTableHeader" width="10%">操作</th>
            <th width="50%" align="center" class="ListTableHeader" nowrap="nowrap">路由名称</th>
            <th width="40%" align="center" class="ListTableHeader" nowrap="nowrap"><b>操作人</b></th>
        </tr>
        <%Activity activity=(Activity)request.getAttribute("activity");
        String workItemId = (String)request.getAttribute("workItemId");
        WorkItemDoing workItemDoing = null;
        List  viewRouteList=(List)request.getAttribute("viewRouteList");
        if(viewRouteList==null) viewRouteList=new ArrayList();
        for(int i=0;i<viewRouteList.size();i++)
        {
          RouteHelper routeHelper=(RouteHelper)viewRouteList.get(i);
          Route route=routeHelper.getRoute();
        
          String checked="";
          String disabled="";
         if(routeHelper.getSelectLevel()==-1)
         {
            disabled=" disabled='true'";
         }
         else if(routeHelper.getSelectLevel()==1)
         {
           checked=" checked=true";
           disabled=" disabled='true'"; 
         }
         
         String toActId = route.getToActivityId();
         IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
         Activity toActivity = wfCacheEngine.getActivityById(toActId);
         String joinId = toActivity.getJoinId() == null ? "" : toActivity.getJoinId();
         String joinMode = toActivity.getJoinMode() == null ? "" : toActivity.getJoinMode();
         String joinStrategy = toActivity.getJoinStrategy() == null ? "" : toActivity.getJoinStrategy();
         boolean needSelectExecutor = true;
         StringBuffer sbId = new StringBuffer();
         StringBuffer sbName = new StringBuffer();
         StringBuffer sbOrgType = new StringBuffer();
         String onclick = " onclick=\"openWfSelectOrgWindow('"+route.getRouteId()+"')\"";
         IWfssServiceFacade wfssServiceFacade = (IWfssServiceFacade)SpringHelper.getBean("wfssServiceFacade");
         //此环节为聚合环节.
         if (!joinId.equals("")) {
            
            if (workItemDoing == null) {
                workItemDoing = wfssServiceFacade.getWorkItemDoingById(workItemId);
            }
            //如果为单一聚合(XOR),则第一个提交到这里就应该生成待办,然后以后的任何一个提交
            //到这里都不最生成待办,同时生成的这个聚合待办事在所有的该分支下待办没有提交之前,此待办不能提交
            if ("XOR".equals(joinMode)) {
               //是否已生成待办
               List activityInstanceList =  wfssServiceFacade.getDBActInsByProInstActId(workItemDoing.getProcessInstanceId(),toActivity.getActivityId());
               //当已经生成了待办时
               if (activityInstanceList!=null && activityInstanceList.size()>0) {
                  needSelectExecutor = false;
                  onclick = "";
                  for(int n = 0; n<activityInstanceList.size();n++) {
                     ActivityInstance activityInstance = (ActivityInstance)activityInstanceList.get(n);
                     if(activityInstance.getExecutorId()!=null && !activityInstance.getExecutorId().equals("")) {
                         sbId.append(activityInstance.getExecutorId()+",");
                         sbName.append(activityInstance.getExecutorName()+",");
                         sbOrgType.append("YG,");
                     }
                  }
               } 
            }
            //如果为全部聚合，则要检查非了当前待办，是否所有的joinId的待办是否合部提交，如果没有提交，则当前待办还不能选择人员
            //提交到下一环节.如果全部提交了，则可以选择人员。
            else if ("AND".equals(joinMode)) {
               int dbCount = wfssServiceFacade.getDBCountByProInstActIdJoinId(workItemDoing.getProcessInstanceId(),toActivity.getActivityId(),joinId);
               if(dbCount-1 > 0 ) {
                 onclick = "";
                 needSelectExecutor = false;
               }
            }
         }
         String ids = sbId.toString();
         String names = sbName.toString();
         String orgTypes = sbOrgType.toString();
         String orgValue = "";
         if(ids!=null && !ids.equals("")) {
            ids = ids.substring(0,ids.length()-1);
            names = names.substring(0,names.length()-1);
            orgTypes = orgTypes.substring(0,orgTypes.length()-1);
            orgValue = ids + "][" + names +"][" + orgTypes;
         }
        %>
        
        <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
        <INPUT type="hidden" value="<%=orgValue%>" name="route_<%=route.getRouteId()%>" id="route_<%=route.getRouteId()%>">
            <td align="center">
            <%if(activity.getSplitMode().equals("XOR")){
            %>
              <input type="radio" needSelectExecutor = "<%=needSelectExecutor%>" name="itemId" id="itemId_<%=route.getRouteId()%>"  value="<%=route.getRouteId()%>" <%=checked%> <%=onclick%> <%=disabled%> routeName="<%=route.getRouteName()%>"  isPointToEnd="<%=route.getIsPointToEnd()%>">
              <IMG src="<%=baseURL%>/bsp/abdf/skins/default/img/wf/wf_user.gif" border="0"  isPointToEnd="<%=route.getIsPointToEnd()%>">
            <%}else{%>
              <input type="checkbox" needSelectExecutor = "<%=needSelectExecutor%>" name="itemId" id="itemId_<%=route.getRouteId()%>"  value="<%=route.getRouteId()%>" <%=onclick%> <%=checked%> <%=disabled%> routeName="<%=route.getRouteName()%>" isPointToEnd="<%=route.getIsPointToEnd()%>">
              <IMG src="<%=baseURL%>/bsp/abdf/skins/default/img/wf/wf_user.gif" border="0" <%=onclick%> isPointToEnd="<%=route.getIsPointToEnd()%>">
            <%}%>
            </td>
            <td >
              <%=route.getRouteName()%>
             </td>
            
             <td >
             <div id="route_org_<%=route.getRouteId()%>"><%=names%>&nbsp;</div>
             </td>
             
             
        </tr>
        <%}%>
        <tr >
            <td   align="center">处理意见</td>
            <td colspan="2">
              <TEXTAREA rows="6" style="width:100%" name="opinion" id="opinion"></TEXTAREA>
             </td>
            
             
        </tr>
        <tr >
            <td   align="center">常用意见</td>
            <td colspan="2">
             <SELECT>
               <OPTION>--请选择--</OPTION>
             </SELECT>
             </td>
            
             
        </tr>
    </table>
    
  </body>
</html>



