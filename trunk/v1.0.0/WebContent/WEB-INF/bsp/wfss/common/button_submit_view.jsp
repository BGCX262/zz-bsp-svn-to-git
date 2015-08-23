<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Activity"%>
<%@ page import="java.util.*"%>
<%@ page import="com.youthor.bsp.core.wfss.model.WorkItemDoing"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Route"%>
<%@ page import="com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine"%>
<%@ page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@ page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>
<%@ page import="com.youthor.bsp.core.facade.IWfssServiceFacade"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Participant"%>
<%@ page import="com.youthor.bsp.core.wfss.model.ActivityInstance"%>
<%@ page import="com.youthor.bsp.view.wfss.common.FlowEngineView"%>



<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>意见输入</title>
    <%@include file="/bsp/abdf/common.jsp"%>
    <script>
     
    function affirClose()
    {
       returnValue=false;
       window.close();
    }
    
    var SUBMIT_WF_VALUE=window.dialogArguments.SUBMIT_WF_VALUE;
    function selectRouteOk()
    {
       
     var allReturnValue=document.getElementById("returnValue").value;
        SUBMIT_WF_VALUE.setKey(allReturnValue);
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
				<td colspan="2">
					<input type='button' name='power_button'  value='确定提交'   class='Button'  onclick="selectRouteOk()">&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='关闭'   class='Button3'  onclick="affirClose()">&nbsp;&nbsp;
                   </td>
			</tr>
			
			<tr>
			
		</tr>
		<%
		String   routeId = request.getParameter("routeId");
		String workItemId = request.getParameter("workItemId");
		
		StringBuffer sb = FlowEngineView.getNextExecuteor(routeId,workItemId);
		IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
		Route route = wfCacheEngine.getRouteById(routeId);
		
		IWfssServiceFacade wfssServiceFacade=(IWfssServiceFacade)SpringHelper.getBean("wfssServiceFacade");
		Activity activity = wfCacheEngine.getActivityById(route.getActivityId());
		String operateMode = activity.getOperateMode()==null?"":activity.getOperateMode();
		String allstr = sb.toString()==null?"":sb.toString();
		String [] allArr = StringHelper.split(allstr,"][");
		String sbNames = "";
		if(allArr.length>=2) sbNames = allArr[2];
		%>
		<tr >
			
			<td colspan="2">
			  <input type="hidden" id="returnValue" name="returnValue" value="<%=sb.toString()%>"/>
			  您当前环节是:<font color="red"><%=activity.getActivityName()%></font>.环节类型为:
			  <font color="red"><%if (operateMode.equalsIgnoreCase("XOR")){
				  out.write("单人处理");
			  }
			  else if (operateMode.equalsIgnoreCase("OR")){
				  out.write("多个消息一人处理");
			  }
			  else if (operateMode.equalsIgnoreCase("AND")){
				  out.write("并行会签");
			  }
			  else if (operateMode.equalsIgnoreCase("LOOP")){
				  out.write("顺序会签");
			  }
			  %>
			  </font>
			  您当前选择:<font color="red"><%=route.getRouteName()%></font>
			  <%if (operateMode.equalsIgnoreCase("XOR")){
				  out.write("下一步处理人:"+sbNames);
			  }
			  else if (operateMode.equalsIgnoreCase("OR")){
				  out.write("下一步处理人:"+sbNames);
			  }
			  else if (operateMode.equalsIgnoreCase("AND") || operateMode.equalsIgnoreCase("LOOP")){
				  WorkItemDoing workItemDoing = wfssServiceFacade.getWorkItemDoingById(workItemId);
				  List allActivityInst = wfssServiceFacade.getActivityInstByparentId(workItemDoing.getParentActivityInstId());
				  float  xorStrategyScale = route.getXorStrategyScale();
				  float ybNum = 1;
				  int disNmu = 0;
				  int dbNum = 0;
				  int all = 0;
					if (allActivityInst!=null && allActivityInst.size()>0) {
						all = allActivityInst.size();
						for (int j = 0;j<all;j++) {
							ActivityInstance activityInstance = (ActivityInstance)allActivityInst.get(j);
							String status = activityInstance.getStatus()==null? "":activityInstance.getStatus();
							String wantToActivityId = activityInstance.getWantToActivityId()==null?"":activityInstance.getWantToActivityId();
							if (!status.equals(com.youthor.bsp.core.wfss.common.Constants.WF_YB)) {
								dbNum++;
							}
							else if (status.equals(com.youthor.bsp.core.wfss.common.Constants.WF_YB) && wantToActivityId.equals(route.getToActivityId())) {
								ybNum++;
								disNmu++;
							}
						}
						out.write("&nbsp;&nbsp;共有:"+all+"人参与会签，其中已选择:"+route.getRouteName()+"共"+disNmu+"人,");
						float realScale = (ybNum/all)*100;
						if (realScale >= xorStrategyScale) {
							out.write("&nbsp;&nbsp;下一步处理人:"+sbNames);
						}
						
			  }
			  }
			  %>
			
			 </td>
		</tr>
		
		<tr >
			<td   align="center">处理意见</td>
			<td colspan="1">
			  <TEXTAREA rows="6" style="width:100%" name="opinion" id="opinion"><%=route.getRouteName()%></TEXTAREA>
			 </td>
			
			 
		</tr>
		<tr >
			<td   align="center">常用意见</td>
			<td colspan="1">
			 <SELECT>
			   <OPTION>--请选择--</OPTION>
			 </SELECT>
			 </td>
			
			 
		</tr>
	</table>
	
  </body>
</html>
