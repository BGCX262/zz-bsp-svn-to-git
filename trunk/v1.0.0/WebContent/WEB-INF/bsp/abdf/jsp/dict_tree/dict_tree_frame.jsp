<%@ page contentType="text/html;charset=GBK"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title></title>
</head>
<% String baseURL = request.getContextPath();
   String treeType=request.getParameter("treeType");
%>
<frameset cols="*,220"  frameborder="yes" border="0" framespacing="2">
    <frame src="<%=baseURL%>/getTopDictTreeByType_abdf.do?treeType=<%=treeType%>" scrolling="auto"  name="main">
  <frame src="<%=baseURL%>/forwardDictTree_abdf.do?treeType=<%=treeType%>" scrolling="auto"   name="left">
  
</frameset>
<noframes><body>
</body></noframes>
</html>
