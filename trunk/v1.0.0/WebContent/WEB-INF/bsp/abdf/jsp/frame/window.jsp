<%@ page contentType="text/html;charset=UTF-8"%>
<% String baseURL=request.getContextPath();%>
<html>
<head>
<title>欢迎管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<STYLE>
	BODY {
		SCROLLBAR-HIGHLIGHT-COLOR: #C6D7EF;
		SCROLLBAR-SHADOW-COLOR: #FCE8BE;
		SCROLLBAR-ARROW-COLOR: #D163C3;
		SCROLLBAR-3DLIGHT-COLOR: #FCE8BE;
		SCROLLBAR-DARKSHADOW-COLOR: #C6D7EF;
		SCROLLBAR-FACE-COLOR: #FBF8F2;
		SCROLLBAR-TRACK-COLOR: #FAF8F6;
		SCROLLBAR-BASE-COLOR: #C6D7EF;
	}
</STYLE>
</head>
    <frameset frameborder="0" cols="35,*" border="0" framespacing="0">
	<frame frameBorder="no" scrolling="no" noresize name="left" src="<%=baseURL%>/nav_tool.jsp"/>
	<frameset frameborder="no" rows="80,*" border="0" framespacing="0" id="main">
	   <frame frameBorder="0" scrolling="no" noresize name="topMenu1" src="<%=baseURL%>/forwardTopWindow_abdf.do"/>
       <frame frameBorder="no" scrolling="auto" noresize id="mainRight" name="mainRight" src="<%=baseURL%>/nav_main.jsp"/>
    </frameset>
   </frameset>
 
<noframes>
<body bgcolor="#FFFFFF">
your browser does not support frame
</body>
</noframes>
</html>