<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<% String baseURL = request.getContextPath();
%>
<frameset cols="*,220"  frameborder="yes" border="0" framespacing="0">
    <frame src="<%=baseURL%>/getTopOnLineHelper_abdf.do" scrolling="no"  name="main">
  <frame src="<%=baseURL%>/forwardOnlineHelperTree_abdf.do" scrolling="auto"   name="left">
  
</frameset>
<noframes><body>
</body></noframes>
</html>
