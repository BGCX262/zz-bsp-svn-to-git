<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>精鹰协同办公平台---组织管理</title>
</head>
<% String baseURL = request.getContextPath();%>
<frameset cols="*,220"  frameborder="yes" border="0" framespacing="2">
    <frame src="<%=baseURL%>/showOrg_urss.do" scrolling="no"  name="main">
  <frame src="<%=baseURL%>/forwardOrgTree_urss.do" scrolling="auto"   name="left">
  
</frameset>
<noframes><body>
</body></noframes>
</html>
