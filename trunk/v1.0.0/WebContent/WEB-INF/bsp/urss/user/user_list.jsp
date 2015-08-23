<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
    	
   
	</head>
	<fe:body>
	<fe:topTable>
        <fe:powerTool funCode="urss_use_mrg" groupName="selected_list"/>
		 </fe:topTable>
		 <form action="<%=baseURL%>/deleteUser_urss.do" id="UserListForm" method="post" name="UserListForm" style="margin: 0">
		 <fe:span >
	
	    <TABLE  cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
           <thead>
			<tr>
				<td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></td>
				<td width="25%" align="center"  nowrap="nowrap"><b>用户名</b></td>
				<td width="20%" align="center"  nowrap="nowrap"><b>登陆名</b></td>
				<td width="50%" align="center"  nowrap="nowrap"><b>身份/组织</b></td>
			</tr>
			</thead>
		<logic:iterate name="pageList" id="user" scope="request" >
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td   align="center"><input type="checkbox" name="itemIdCheckBox"  value="<bean:write name="user" property="userId"/>" >&nbsp;</td>
			<td >
			<a href="#"  onclick="buttomOnClick('<%=baseURL%>/showUser_urss.do?userId=<bean:write name="user" property="userId"/>','self')" >
			  <bean:write name="user" property="userName"/>&nbsp;
			 </a>
			 </td>
			 <td>
			  <bean:write name="user" property="loginId"/>&nbsp;
			 </td>
			 
			 <td>
			   <TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
			<% int i=0;%>
			<logic:iterate name="user" id="org"  property="orgList" >
			<%i++; %>
			</logic:iterate>
			<logic:iterate name="user" id="org"  property="orgList" >
			<tr>
				 <td>
				  <bean:write name="org" property="allParentName"/>&nbsp; 
				   <%if (i>1){ %>
				  <input type='button' name='power_button'  value='删除身份'   class='Button3' onclick="">&nbsp;&nbsp;
				 <% }%>
				 </td>
			<tr>
			
			</logic:iterate>
			</table>
			 </td>
		</tr>
		</logic:iterate>
		
	</table>
	
	
		</td>
	</tr>
</table>
</fe:span>	

<fe:bottomTable><fe:root inputclass="formStyleall" formId="UserListForm"/></fe:bottomTable> 
</form>
</fe:body>
</html>


