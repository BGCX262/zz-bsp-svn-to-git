<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%
String baseURL = request.getContextPath();

%>
<html>
<head>
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
<title>欢迎管理系统</title>
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<frameset frameborder="no" cols="125,*" border="0" framespacing="0" id="main">
	<frame frameBorder="no" scrolling="no" noresize id="mainLeft" src="<%=baseURL%>/forwardLeft_abdf.do"/>
	<frame frameBorder="no" scrolling="no" noresize id="right" name="right" src="<%=baseURL%>/listWorkItemDoing_wfss.do"/>
</frameset><noframes>

<body bgcolor="#FFFFFF">

your browser does not support frame
</body>
</noframes>

</html>