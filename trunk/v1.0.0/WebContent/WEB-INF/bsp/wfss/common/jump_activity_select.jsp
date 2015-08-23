<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Activity"%>
<%@ page import="java.util.*"%>
<%@ page import="com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine"%>
<%@ page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Process"%>
<%
IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
String processId = request.getParameter("processId");
Process process = wfCacheEngine.getProcessById(processId);
List activityList = wfCacheEngine.listActivitysByProcessId(processId);
%>

<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><%=process.getProcessName()%>跳转环节选择选择</title>
    <%@include file="/bsp/abdf/common.jsp"%>
   <script type="text/javascript" language="javascript">
 function affirClose()
    {
       returnValue=false;
       window.close();
    }
    
 var orgVo=new OrgVo();
    function openWfSelectOrgWindow(activityId)
    {
       //设置以选的组织
       if(event.srcElement.type!=undefined)
       {
          if(!event.srcElement.checked)
          {
             return;
          }
       }
       //var isPointToEndValue=event.srcElement.getAttribute("isPointToEnd");
       //if(isPointToEndValue!=null&&isPointToEndValue=='Y') return;
	   var values=document.getElementById("activity_"+activityId).value;
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
		 var selectObjCR=document.getElementById("itemId_"+activityId);
	  
       var returnValue=showModalDialog('<%=baseURL%>/forwardOrgSelectFrame_wfss.do?activityId='+activityId, window,'dialogHeight:500px;dialogWidth:650px;status=off');
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
        document.getElementById("activity_org_"+activityId).innerHTML=names;
         document.getElementById("activity_"+activityId).value=allValues;
         var divs = document.getElementsByTagName("div");
        for(var i=0;i<divs.length;i++) {
            if (divs[i].id.indexOf("activity_org_")>=0 && divs[i].id != "activity_org_"+activityId) {
              divs[i].innerHTML= "&nbsp;";
            }
        }
    }
    
 function selectRouteOk()
    {
        var itemIds=document.getElementsByName("itemId");
        var selectNum = 0;
        var activityId = "";
        var allOrgValue= "";
        for(var i=0;i<itemIds.length;i++)
        {
            if(itemIds[i].checked)
            {
                allOrgValue=document.getElementById("activity_"+itemIds[i].value).value;
               selectNum=selectNum+1;
               activityId = itemIds[i].value;
            }
        }
       
         if(selectNum==0)
        {
           alert("请选择跳转环节信息！");
           return;
        }
        if(allOrgValue=="")
        {
            alert("请选择跳转环节执行人！");
           return;
         }
        
         window.dialogArguments.document.getElementById("jump_to_activity").value = activityId;
          window.dialogArguments.document.getElementById("jump_org").value = allOrgValue;
          window.dialogArguments.document.getElementById("jump_option").value = document.getElementById("opinion").value;
       
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
			<th width="50%" align="center" class="ListTableHeader" nowrap="nowrap">环节名称</th>
			<th width="40%" align="center" class="ListTableHeader" nowrap="nowrap"><b>处理人</b></th>
		</tr>
		<%
		  if (activityList!=null && activityList.size()>0) {
			 for(int i = 0;i<activityList.size();i++) {
				 Activity  activity = (Activity)activityList.get(i);
		%>
		<INPUT type="hidden" value="" name="activity_<%=activity.getActivityId()%>" id="activity_<%=activity.getActivityId()%>">
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
		
			<td   align="center">
			
			  <input type="radio"  name="itemId" id="itemId_<%=activity.getActivityId()%>"  value="<%=activity.getActivityId()%>" onclick="openWfSelectOrgWindow('<%=activity.getActivityId()%>')"   >
			  <IMG src="<%=baseURL%>/bsp/abdf/skins/default/img/wf/wf_user.gif" border="0" onclick="openWfSelectOrgWindow('<%=activity.getActivityId()%>')" >
			
			</td>
			<td >
			  <%=activity.getActivityName()%>
			 </td>
			
			 <td >
			 <div id="activity_org_<%=activity.getActivityId()%>">&nbsp;</div>
			 </td>
			 
			 
		</tr>
<% }}%>
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



