<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>

<%@include file="/bsp/abdf/common.jsp"%>
</head>
<body>
   <table  <%=tableStyle%> width="100%">
  
    <tr  class=ListTableRow >
      <td colspan="4">
     
      <input type='button' name='power_button'  value='新增'  class='Button3'  onclick="buttomOnClickAdd(this,'<%=baseURL%>/initResource_urss.do?funModuleId=<%=request.getAttribute("funId")%>','self')" id='dictionary_add'>&nbsp;&nbsp;
      <input type='button' name='power_button'  value='删除'  class='Button3'  onclick="buttomOnClickDel(this,'<%=baseURL%>/deleteResource_urss.do?funModuleId=<%=request.getAttribute("funId")%>','self','itemIdCheckBox')" id='dictionary_del'>&nbsp;&nbsp;
     
     </td>
    </tr>
    </table>
	<TABLE width="100%" <%=tableStyle%> align="center">
	 <form name="ResourceForm" method="post" action="<%=baseURL%>/deleteResource_urss.do" id="resourceEdit">
		<tr>
			<th align="center" class="ListTableHeader" width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></th>
			<th width="15%" align="center" class="ListTableHeader" nowrap="nowrap"><b>资源名称</b></th>
			<th width="20%" align="center" class="ListTableHeader" nowrap="nowrap"><b>资源编号</b></th>
			<th width="10%" align="center" class="ListTableHeader" nowrap="nowrap"><b>是否按钮</b></th>
			<th width="15%" align="center" class="ListTableHeader" nowrap="nowrap"><b>分组名称</b></th>
			<th width="15%" align="center" class="ListTableHeader" nowrap="nowrap"><b>实现JS</b></th>
			<th width="15%" align="center" class="ListTableHeader" nowrap="nowrap"><b>联带分配</b></th>
		</tr>
		<logic:iterate name="pageList" id="resource" scope="request">
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td   align="center"><input type="checkbox"  name="itemIdCheckBox"  value="<bean:write name="resource" property="resourceId"/>" ></td>
			<td >
			  <a href="#" onclick="buttomOnClick('<%=baseURL%>/showResource_urss.do?resourceId=<bean:write name="resource" property="resourceId"/>','self')" >
			  <bean:write name="resource" property="resourceCode"/></a>
			 </td>
			 <td >
			    <bean:write name="resource" property="resourceName"/>&nbsp;
			 </td>
			 <td >
			  <bean:write name="resource" property="resourceCode"/>&nbsp;
			 </td>
			  <td >
			      <logic:equal name="resource" property="isButton" value="Y">是</logic:equal>
			    <logic:equal name="resource" property="isButton" value="N">否</logic:equal>
			  
			 </td>
			 <td >
			   <bean:write name="resource" property="groupName"/>&nbsp;
			 </td>
			 <td >
			   <bean:write name="resource" property="implJs"/>&nbsp;
			 </td>
			   <td >
			      <logic:equal name="resource" property="isButton" value="Y">是</logic:equal>
			    <logic:equal name="resource" property="isButton" value="N">否</logic:equal>
			  
			 </td>
		</tr>
		</logic:iterate>
	</table>
	</form>
</body>
</html>
