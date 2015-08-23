<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>精鹰协同办公平台---功能管理</title>
</head>
<% String baseURL = request.getContextPath();%>
<frameset cols="*,220"  frameborder="no" border="0" framespacing="0">
    <frame src="<%=baseURL%>/queryPageAppForm_wfss.do" scrolling="no"  name="main">
  <frame src="<%=baseURL%>/forwardAppFormTree_wfss.do" scrolling="auto"   name="left">
  
</frameset>
<noframes><body>
</body></noframes>
</html>
