<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<% String baseURL = request.getContextPath();
String onLineHelperId = (String)request.getAttribute("onLineHelperId");
%>
<frameset cols="250,*"  frameborder="yes" border="0" framespacing="0" id ="mainFrame">
    <frame src="<%=baseURL%>/forwardViewOnlineHelperTree_abdf.do" scrolling="no" >
    <%if (onLineHelperId==null || onLineHelperId.equals("")) {%>
   <frame src="<%=baseURL%>/forwardViewOnlineHelperHome_abdf.do" scrolling="auto" name="main">
   <%}else {%>
	     <frame src="<%=baseURL%>/showOnLineHelper_abdf.do?onLineHelperId=<%=onLineHelperId%>&view_help=true" scrolling="auto" name="main">
	<%}%>
  
</frameset>
<noframes><body>
</body></noframes>
</html>
