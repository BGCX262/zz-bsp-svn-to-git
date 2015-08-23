<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>精鹰协同办公平台---字典管理</title>
</head>
<% String baseURL = request.getContextPath();
   String subassemblyId=(String)request.getAttribute("subassemblyId");
   if(subassemblyId==null)
      subassemblyId=request.getParameter("subassemblyId");
 
%>
<frameset cols="*,320"  frameborder="yes" border="0" framespacing="2">
    <frame src="<%=baseURL%>/showSubassembly_abdf.do?subassemblyId=<%=subassemblyId%>" scrolling="auto"  name="main">
  <frame src="<%=baseURL%>/forwardSubassemblyTree_abdf.do?subassemblyId=<%=subassemblyId%>" scrolling="auto"   name="left">
  
</frameset>
<noframes><body>
</body></noframes>
</html>
