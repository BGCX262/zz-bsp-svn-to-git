<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.core.wfss.model.WorkItemDoen"%>
<%@ page import="java.util.*"%>
<%@ page import="com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine"%>
<%@ page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Activity"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Process"%>
<%@ page import="com.youthor.bsp.core.wfss.model.AppForm"%>
<%@ page import="com.youthor.bsp.core.urss.model.Resource"%>
<%@ page import="com.youthor.bsp.core.abdf.common.AbdfCache"%>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <title>待办页</title>
     <SCRIPT language=javascript>
Menu.prototype.cssFile = '<%=baseURL%>/bsp/abdf/skins/default/css/popmenu/officexp.css';
var eMenu = new Menu();
<%
String defauleValue = "所有业务";
IWFCacheEngine wfCacheEngine=(IWFCacheEngine)SpringHelper.getBean("wfCacheEngine");
List appFormList = wfCacheEngine.getAllAppForm(AbdfCache.app.getAppId());
%>
 eMenu.add(new MenuItem('所有业务', "javascript:view('','所有业务')", "<%=baseURL%>/bsp/abdf/skins/default/img/toolbar/label.gif" ) );
  <%
  	   for(int j=0;j<appFormList.size();j++)
  	   {
  		 AppForm appForm=(AppForm)appFormList.get(j);
  		 String appFormId = request.getAttribute("appFormId") == null ? "" : (String)request.getAttribute("appFormId");
  		 if (appFormId.equals(appForm.getAppFormId())) {
  			defauleValue = appForm.getAppFormName();
  		 }
 %>	   
 eMenu.add(new MenuItem('<%=appForm.getAppFormName()%>', "javascript:view('<%=appForm.getAppFormId()%>','<%=appForm.getAppFormName()%>')", "<%=baseURL%>/bsp/abdf/skins/default/img/toolbar/label.gif" ) );
<%}%>
function showContextMenuShowBuzi() {
    	var el = window.event.srcElement;
    	var left = window.event.screenX;
    	var top = window.event.screenY;
    	eMenu.show(left,top);
}

  	function view(appType,appName){
  		document.getElementById("workItemDoing_type").value = appName;
  		location.href= baseURL+"/listWorkItemDoen_wfss.do?appFormId="+appType;
  	}
  		


  
</SCRIPT>
	</head>
	<fe:body>
	
  

	 <form name="workItemDoen" method="post" action="<%=baseURL%>/listWorkItemDoen_wfss.do" id="workItemDoen" >	
	 <fe:topTable> 
	    <table cellpadding='0' cellspacing='0' width='100%' border='0'  class='toolBar1'>
 <tr>
<td>
	 <table id='toolBar' border='0'>
<td class='coolButton' align='left' width='3'><img src='<%=baseURL%>/bsp/abdf/skins/default/img/toolbar/toolbar.gif'/></td>


 <td class='coolButton' name='POWER_BUTTON'  onaction="showContextMenuShowBuzi()" id="workItemDoing_type" ><%=defauleValue%></td>

 </tr>
 </table>
  </td></tr></table>
 <SCRIPT language=javascript>
var cells = document.getElementById('toolBar').rows[0].cells;
for (var i = 1; i < cells.length; i++){
createButton(cells[i]);
} 
 </SCRIPT>
     </fe:topTable>	
    <fe:span>
	<TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
	<thead>
		<tr>
			<td width="25%" align="center"  nowrap="nowrap"><b>标题</b></td>
			<td width="15%" align="center"  nowrap="nowrap"><b>所属流程</b></td>
			<td width="15%" align="center"  nowrap="nowrap"><b>业务类型</b></td>
			<td width="30%" align="center"  nowrap="nowrap"><b>处理环节</b></td>
			<td width="15%" align="center"  nowrap="nowrap"><b>完成时间</b></td>
			
		</tr>
	</thead>
		<%
			
		
		List listWorkItemDoen=(List)request.getAttribute("listWorkItemDoen");
		
		if(listWorkItemDoen!=null&&listWorkItemDoen.size()>0)
		{
		  for(int i=0;i<listWorkItemDoen.size();i++)
		  {
		     WorkItemDoen workItemDoen=(WorkItemDoen)listWorkItemDoen.get(i);
		     request.setAttribute("workItemDoen",workItemDoen);
		%>
		<bean:define id="createDate" name="workItemDoen" property="createDate" scope="request"/>
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)' height="26">
			 <td>
			    <a href="<%=baseURL%>/showWorkItemDoen_wfss.do?workItemId=<%=workItemDoen.getWorkItemId()%>"><%=workItemDoen.getTitle()%></a>
			 </td>
            
              <td>
                <%Process process=wfCacheEngine.getProcessById(workItemDoen.getProcessId());
                out.write(process.getProcessName());
                %>
			 </td>
			
			  <td>
			    <%AppForm appForm=wfCacheEngine.getAppFormById(workItemDoen.getAppFormId());
			     out.write(appForm.getAppFormName());
			  %>
			 
			 </td>
			 
			  <td>
			    <% Activity activity=wfCacheEngine.getActivityById(workItemDoen.getActivityId());
                out.write(activity.getActivityName());
                %>
			 </td>
			 
			  <td>
			       <bean:write name="createDate" format="yyyy-MM-dd HH:mm:ss"/>
			    
			 </td>
			 
			 
			  
		</tr>
		<%}
		}
		%>
		
	</table>
	</fe:span>
	<fe:bottomTable><fe:root inputclass="formStyleall" formId="workItemDoen"/></fe:bottomTable>
	
	</form>
  </fe:body>
</html>

