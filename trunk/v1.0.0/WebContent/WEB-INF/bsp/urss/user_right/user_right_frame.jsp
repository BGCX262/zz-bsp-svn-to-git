<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>精鹰协同办公平台---用户权限分配</title>
</head>
<% String baseURL = request.getContextPath();%>
<frameset cols="0,*,220"  frameborder="no" border="0" framespacing="0" id="mainFrame">
    <frame src="" scrolling="auto"  name="right">
    <frame src="<%=baseURL%>/forwardUserRightDes_urss.do" scrolling="auto"  name="main">
    <frame src="<%=baseURL%>/orgTreeUserRight_urss.do" scrolling="auto"   name="left">
  
</frameset>
<noframes><body>
</body></noframes>
</html>
