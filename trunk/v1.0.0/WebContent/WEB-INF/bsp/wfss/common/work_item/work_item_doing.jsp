<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.core.wfss.model.WorkItemDoing"%>
<%@ page import="java.util.*"%>
<%@ page import="com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine"%>
<%@ page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@ page import="com.youthor.bsp.core.wfss.model.AppForm"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Activity"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Process"%>
<%@ page import="com.youthor.bsp.core.urss.model.CoopArea"%>
<%@ page import="com.youthor.bsp.core.urss.model.Resource"%>
<%@ page import="com.youthor.bsp.core.abdf.common.AbdfCache"%>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
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
  		location.href= baseURL+"/listWorkItemDoing_wfss.do?appFormId="+appType;
  	}
  		function showQuery(){
  		    	showMessageBoxCenter('查询信息',"t",450);
  		    	return;
  		}
 <%
	 List coopAreaList = (List)request.getAttribute("coopAreaAdd");
 if (coopAreaList!=null && coopAreaList.size()>0) {
	 %>
	 var eMenuAdd = new Menu();
	 function showContextMenuAddBuzi() {
    	var el = window.event.srcElement;
    	var left = window.event.screenX;
    	var top = window.event.screenY;
    	eMenuAdd.show(left,top);
     }
     
     function addProcess(url){
        location.href = baseURL + url;
     }
	 <%
	  for(int i=0;i<coopAreaList.size();i++) {
		  Resource resource =(Resource)coopAreaList.get(i);
		  if (resource.getProcessInfo() == null || resource.getProcessInfo().trim().equals("")) continue;
		  String coopImg = resource.getCoopImg();
		  //if(coopImg==null || coopImg.equals("")) {
			  coopImg = "/bsp/abdf/skins/default/img/toolbar/label.gif";
		 // }
		  
		  if (resource.getImplUrl()!=null && !resource.getImplUrl().equals("")) {
		  %>
		  eMenuAdd.add(new MenuItem('<%=resource.getResourceName()%>', "javascript:addProcess('<%=resource.getImplCoopUrl()%>')", "<%=baseURL+coopImg%>" ) );
		  <%
        }
	  }
 }
%>	

  
</SCRIPT>
    <title>待办页</title>
	</head>
	<fe:body>
	


	 <form name="workItemDoing" method="post" action="<%=baseURL%>/listWorkItemDoing_wfss.do" id="workItemDoing" >		
	<fe:topTable> 
	    <input type="hidden" name="routeBatchFlag" value="" id="routeBatchFlag"/>
	     <input type="hidden" name="processOption" value="" id="processOption"/>
	     
	       <table cellpadding='0' cellspacing='0' width='100%' border='0'  class='toolBar1'>
 <tr>
<td>
<table id='toolBar' border='0'>
<tr>
<td class='coolButton' align='left' width='3'><img src='<%=baseURL%>/bsp/abdf/skins/default/img/toolbar/toolbar.gif'/></td>
  <%
	     CoopArea coopArea= (CoopArea)request.getAttribute("coopArea"); 
	     if (coopArea!=null && coopAreaList!=null && coopAreaList.size()>0) {
	     %>
 <td class='coolButton' name='POWER_BUTTON'  onaction="showContextMenuAddBuzi()"><%=coopArea.getCoopAreaName()%></td>
 <%} %>
 <td class='coolButton' name='POWER_BUTTON'  onaction="submitBatchProcessWorkItem('agree')"  >同意</td>
 <td class='coolButton' name='POWER_BUTTON'  onaction="submitBatchProcessWorkItem('unagree')"  >不同意</td>
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
		    <td width="3%" align="center"  nowrap="nowrap"><b>选择</b></td>
			<td width="25%" align="center"  nowrap="nowrap"><b>标题</b></td>
			<td width="15%" align="center"  nowrap="nowrap"><b>所属流程</b></td>
			<td width="10%" align="center"  nowrap="nowrap"><b>业务类型</b></td>
			<td width="30%" align="center"  nowrap="nowrap"><b>当前环节</b></td>
			<td width="17%" align="center"  nowrap="nowrap"><b>接收时间</b></td>
			
		</tr>
	  </thead>
		<%
		
		List listWorkItemDoing=(List)request.getAttribute("listWorkItemDoing");
		if(listWorkItemDoing!=null&&listWorkItemDoing.size()>0)
		{
		  for(int i=0;i<listWorkItemDoing.size();i++)
		  {
		     WorkItemDoing workItemDoing=(WorkItemDoing)listWorkItemDoing.get(i);
		     String disabled = "disabled='true'";
		     request.setAttribute("workItemDoing",workItemDoing);
		     Activity activity = wfCacheEngine.getActivityById(workItemDoing.getActivityId());
		     String isBatch = activity.getIsBatch()==null?"":activity.getIsBatch();
		     if (isBatch.equals("Y")) {
		    	 disabled= "";
		     }
		    	 
		%>
		<bean:define id="createDate" name="workItemDoing" property="createDate" scope="request"/>
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)' height="26">
		     <td>
                <input type="checkbox" <%=disabled%>  name="workItemDoingId" value="<%=workItemDoing.getWorkItemId()%>"/>
			 </td>
			 <td>
			    <a href="<%=baseURL%>/showWorkItemDoing_wfss.do?workItemId=<%=workItemDoing.getWorkItemId()%>"><%=workItemDoing.getTitle()%></a>
			 </td>
            
              <td>
                <%Process process=wfCacheEngine.getProcessById(workItemDoing.getProcessId());
                out.write(process.getProcessName());
                %>
			 </td>
			
			  <td>
			  <%AppForm appForm=wfCacheEngine.getAppFormById(workItemDoing.getAppFormId());
			     out.write(appForm.getAppFormName());
			  %>
			 
			 </td>
			 
			  <td>
			    <% 
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
	<fe:bottomTable><fe:root inputclass="formStyleall" formId="workItemDoing"/></fe:bottomTable>
	</form>
  </fe:body>
</html>

