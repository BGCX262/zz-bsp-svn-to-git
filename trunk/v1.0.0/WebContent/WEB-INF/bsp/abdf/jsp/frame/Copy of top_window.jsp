<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>精鹰中国门户</title>
<% String baseURL = request.getContextPath();%>
</head>

<frameset rows="*" cols="220,*" frameborder="NO" border="0" framespacing="0">
  <frame src="<%=baseURL%>/forwardTopLogo_abdf.do" scrolling="NO" noresize="noresize"  name="topFrame" name="topFrame">
    <frame src="<%=baseURL%>/top_abdf.do" scrolling="NO"  name="main" id="main" >
</frameset>
<noframes><body>
</body></noframes>
</html>
