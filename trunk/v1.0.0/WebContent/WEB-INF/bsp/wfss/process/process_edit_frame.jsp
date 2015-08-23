<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>精鹰协同办公平台---流程管理</title>
</head>
<% String baseURL = request.getContextPath();
   String processId=request.getParameter("processId");
%>

<frameset cols="*,220"  frameborder="yes" border="0" framespacing="0">
 <%
 if(StringHelper.doWithNull(processId).equals("")){
 %>
  <frame src="<%=baseURL%>/initProcess_wfss.do" scrolling="no"  name="main">
  <%}else{%>
  <frame src="<%=baseURL%>/showProcess_wfss.do?processId=<%=processId%>" scrolling="no"  name="main">
  <%}%>
  <frame src="<%=baseURL%>/forwardProcessEditTree_wfss.do?processId=<%=processId%>" scrolling="auto"  name="left">
</frameset>
<noframes><body>
</body></noframes>
</html>
