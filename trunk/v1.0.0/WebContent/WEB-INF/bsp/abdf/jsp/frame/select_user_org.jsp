<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="com.youthor.bsp.core.urss.model.User" %>
<%@page import="com.youthor.bsp.core.urss.model.Org" %>
<%@page import="java.util.*" %>
<html>
<head>
	<%String baseURL=request.getContextPath();%>
	<link rel="stylesheet" type="text/css" href="<%=baseURL%>/bsp/abdf/skins/default/css/login.css" >
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>通信基站建设进度项目管理系统</title>
	

</head>

<body text="#000000" bgcolor="#cccccc">
<form action="<%=baseURL%>/userLogonOn_abdf.do" name="loginForm" id="loginForm" method="post" >
	
	<table align="center" height="100%"><tbody><tr><td>
	<table width="783" align="center" border="0" cellpadding="0" cellspacing="0">
  		<tbody><tr> 
    		<td colspan="3"><img src="<%=baseURL%>/bsp/abdf/skins/default/img/login/l_top.gif" width="783" height="45"></td>
  		</tr>
 		<tr> 
    		<td colspan="3" height="68"><img src="<%=baseURL%>/bsp/abdf/skins/default/img/login/l_topp.jpg" width="782" height="68"></td>
  		</tr>
 		<tr> 
    		<td colspan="3" height="38"><img src="<%=baseURL%>/bsp/abdf/skins/default/img/login/lvpp.gif" width="782" height="38"></td>
  		</tr>
  		<tr> 
    		<td width="262" height="214"><img src="<%=baseURL%>/bsp/abdf/skins/default/img/login/l_01.gif" width="262" height="214"></td>
    		<td width="258" bgcolor="#ffffff"><table width="258" border="0" cellpadding="0" cellspacing="0">
        		<tbody>
        		<TR>
                <TD height="20">&nbsp;&nbsp;</TD>
				</TR>
        		<tr> 
          			<td>&nbsp;</td>
       			</tr>
        		<tr> 
          		<td align="center"><table width="230" border="0" cellpadding="1" cellspacing="1">
                	<tbody><tr> 
                	 <%User user = (User)session.getAttribute("GLOBAL_USER"); 
                	 if (user == null){
                		 response.sendRedirect(request.getContextPath()+"/forwardIndex_abdf.do");
                		 return;
                	 }
                	
                	 List list = (List)session.getAttribute("USER_ORG");
                	 
                	 %>
                  		<td   width="100%" colspan="2"><font color="red">用户<%=user.getUserName()%>拥有如下身份:</font></td>
                  	
               			
                	</tr>
                	<tr> <td colspan="2"><br/>
                	    <%for(int i=0;i<list.size();i++) {
                	    	Org org = (Org)list.get(i);
                	    	%>
                	    	<a href="<%=request.getContextPath()%>/selectUserOrg_abdf.do?orgId=<%=org.getOrgId()%>"><b><%=org.getAllParentName()%></b><br/><br/>
                	    	<%
                	    }
                	    %>
                  		</td>
                  		
                	</tr>
                	<tr> 
                  		<td height="30">请选择身份进入系统</td>
                  		<td>&nbsp;</td>
               		</tr>
                	<tr>
                  		<td align="center"></td>
                	</tr>
            		</tbody></table></td>
        		</tr>
      		</tbody></table></td>
   				<td width="262"><img src="<%=baseURL%>/bsp/abdf/skins/default/img/login/l_03.gif" width="262" height="214"></td>
  			</tr>
  			<tr> 
    			<td colspan="3"><img src="<%=baseURL%>/bsp/abdf/skins/default/img/login/l_04.gif" width="782" height="26"></td>
  			</tr>
  			<tr align="center">
    			<td colspan="3" background="<%=baseURL%>/bsp/abdf/skins/default/img/login/l_05.gif" height="47"> <p>版权所有 &#169; 2009 <a href="http://###/">中国联通</a> <br>
    			</p>
      		</td>
  			</tr>
			</tbody></table>
		</td></tr>
		</tbody></table>
	</form>
</body></html>
