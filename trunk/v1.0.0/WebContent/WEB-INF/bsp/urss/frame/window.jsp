<%@ page contentType="text/html;charset=GBK"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>精鹰中国IT基础服务统一定义平台</title>
<% String baseURL = request.getContextPath();%>
</head>

<frameset rows="65,*" cols="*" frameborder="NO" border="0" framespacing="0">
  <frame src="<%=baseURL%>/forwardTop_urss.do" scrolling="NO" noresize  name="topFrame" name="topFrame">
  <frameset cols="200,*" frameborder="NO" border="0" framespacing="0" id="mainFrame">
  	<frame src="<%=baseURL%>/forwardLeft_urss.do"   name="left" scrolling="NO" id="left">
    <frame src="<%=baseURL%>/showAppByCode_urss.do" scrolling="NO"  name="main" id="main" >
  </frameset>
</frameset>
<noframes><body>
</body></noframes>
</html>
