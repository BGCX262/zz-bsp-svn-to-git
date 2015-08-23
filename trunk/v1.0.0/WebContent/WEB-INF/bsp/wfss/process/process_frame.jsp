<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>精鹰协同办公平台---功能管理</title>
</head>
<% String baseURL = request.getContextPath();
   String appId=request.getParameter("appId");
   if(appId==null) appId="";
%>
<frameset cols="*,220"  frameborder="no" border="0" framespacing="0">
  <frame src="<%=baseURL%>/queryPageProcess_wfss.do?appId=<%=appId%>" scrolling="no"  name="main">
  <frame src="<%=baseURL%>/forwardProcessTree_wfss.do" scrolling="auto"  name="left">
</frameset>
<noframes><body>
</body></noframes>
</html>
