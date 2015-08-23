<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.core.urss.model.Resource"%>	
<%@ page import="com.youthor.bsp.core.urss.model.Function"%>
<%@ page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>
	
<%@ page import="java.util.*"%>	
<html>
<body>
<SCRIPT>
 alert('<%=(String)request.getAttribute("prom")%>');
 parent.document.getElementById("urss_role_power").disabled=false;
</SCRIPT>

</body>
</html>


