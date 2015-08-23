<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.core.urss.model.AppCom"  %>
<%@ page import="com.youthor.bsp.core.urss.model.App"  %>
<%@ page import="java.util.*"  %>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <title>管理员列表</title>
	</head>
	<fe:body>
	


	<form name="commonList" method="post" action="<%=baseURL%>/saveAppWithApply_urss.do" id="commonList">
	<fe:topTable> 
       
      
   </fe:topTable> 
  
   <fe:span>
	<TABLE  cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
	 <thead>
		<tr>
		
			<td width="15%" align="center"  nowrap="nowrap"><b>应用编码</b></td>
			<td width="20%" align="center" nowrap="nowrap"><b>应用名称</b></td>
			<td width="15%" align="center" nowrap="nowrap"><b>有效期</b></td>
			<td width="15%" align="center" nowrap="nowrap"><b>操作</b></td>
		</tr>
		</thead>
		<%
		List listApp = (List)request.getAttribute("pageList"); 
		List listComApp = (List)request.getAttribute("pageListWithApply"); 
		if (listApp != null && listApp.size()>0) {
		  for(int i=0;i< listApp.size();i++) {
		  App app = (App)listApp.get(i);
		  AppCom appCom = null;
		  if(listComApp!=null&&listComApp.size()>0) {
		    for(int j=0;j<listComApp.size();j++) {
		        AppCom appComTemp = (AppCom)listComApp.get(j);
		        if(appComTemp.getAppId().equals(app.getAppId())) {
		          appCom = appComTemp;
		          break;
		        }
		    }
		  }
		%>
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
		      <td>
			  <%=app.getAppCode()%>
			   </td>
			 <td >
			   <%=app.getAppName()%>
			 </td>

			  <td >
			  <%if(appCom!=null&&appCom.getStatus()!=null && appCom.getStatus().equals("approved")){%>
			      <%=appCom.getValidDate()%>
			      <%}else{%>
			        &nbsp;
			       <% 
			      
			    }
%>
			 </td>
			  
			   <td   align="center">
			   <%if(appCom!=null&&!appCom.getStatus().equals("")){%>
			      <input type='button' name='power_button'  value='取消'   class='Button3'  onclick="buttomOnClick('<%=baseURL%>/comCancelApp_urss.do?appId= <%=app.getAppId()%>','self')" id='RegCompany_del'>&nbsp;&nbsp;
			   <%}else {%>
			     <input type='button' name='power_button'  value='审请'   class='Button3'  onclick="buttomOnClick('<%=baseURL%>/comApplyApp_urss.do?appId= <%=app.getAppId()%>','self')" id='RegCompany_del'>&nbsp;&nbsp;
			    <%}%>
			   </td>
		  	
		
		</tr>
		
		<%} }%>
		
	</table>
	</fe:span>
	<fe:bottomTable>应用申请</fe:bottomTable>
	</form>
  </fe:body>
</html>

