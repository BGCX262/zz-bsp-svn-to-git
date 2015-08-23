<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>精鹰协同办公平台---字典管理</title>
</head>
<% String baseURL = request.getContextPath();%>
<frameset cols="*,220"  frameborder="yes" border="0" framespacing="2">
    <frame src="<%=baseURL%>/getAllDictType_abdf.do" scrolling="no"  name="main">
  <frame src="<%=baseURL%>/forwardDictTypeTree_abdf.do" scrolling="auto"   name="left">
  
</frameset>
<noframes><body>
</body></noframes>
</html>
