<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@page import="java.util.*"%>
<title>协同区</title>
</head>

<script>
 
   <%
   String baseURL=request.getContextPath();
  
    %>
</script>
<frameset rows="76,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="<%=baseURL%>/bsp/abdf/jsp/frame/coop/leftCoop_top.jsp" name="CoopTopFrame" scrolling="No" noresize="noresize" id="CoopTopFrame" />
  <frame src="<%=baseURL%>/leftCoopBar_abdf.do" name="CoopMiddleFrame" scrolling="No" noresize="noresize" id="CoopMiddleFrame" />
</frameset>
<noframes><body>
</body>
</noframes></html>


