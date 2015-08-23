<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通信基站建设进度项目管理系统1111</title>
<% String baseURL = request.getContextPath();%>
</head>

<frameset rows="65,*" cols="*" frameborder="NO" border="0" framespacing="0">
  <frame src="<%=baseURL%>/forwardTopWindow_abdf.do" scrolling="NO" noresize="noresize"  name="topFrame" name="topFrame">
  <frameset cols="225,*" frameborder="NO" border="0" framespacing="0" id="mainFrame" name="mainFrame">
  	<frame src="<%=baseURL%>/forwardLeft_abdf.do"   name="left" scrolling="no" id="left">
    <frame src="<%=baseURL%>/forwardWorkDesk_abdf.do?bb=hello" scrolling="NO"  name="main" id="main" >
  </frameset>
</frameset>
<noframes><body>
</body></noframes>
</html>
