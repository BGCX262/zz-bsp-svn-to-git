<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String baseURL = request.getContextPath();
String id = request.getParameter("id");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<SCRIPT type="text/javascript" language="javascript">
function affirmClose() {
    var processId=offerSelectFrame.document.getElementById("processId").value;
    if(processId == "") {
       alert("请选择一个流程");
       return;
    }
    returnValue=processId;
    window.close();
}
</SCRIPT>
<title>流程选择</title>
</head>
<frameset rows="*,40" frameborder="no" border="0" framespacing="0">
  <frame src="<%=baseURL%>/offerProcessSelect_wfss.do?id=<%=id%>" name="offerSelectFrame" scrolling="NO" noresize>
  <frame src="<%=baseURL%>/forwardProcessSelectBottom_wfss.do" name="bottomFrame" scrolling="NO" noresize id="bottomFrame">
</frameset>
<noframes><body>
</body></noframes>
</html>

