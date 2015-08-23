<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>
<%@include file="/bsp/abdf/common.jsp"%>
</head>
<fe:body>
   <form action="<%=baseURL%>/queryPageProcess.do" id="processListForm" method="process" name="processListForm">
   <table  <%=tableStyle%> width="100%">
    <tr class="ListTableHeader">
      <td colspan="4" ><div align="center"><strong>流程定义列表</strong></div></td>
    </tr>
    <tr  class=ListTableRow >
      <td colspan="4">
      <logic:present name="app">
      <input type='button' name='power_button'  value='新增'  class='Button3'  onclick="buttomOnClickAdd(this,'<%=baseURL%>/bsp/wfss/process/process_edit_frame.jsp','parent')" id='Process_add'>&nbsp;&nbsp;
      </logic:present>
      <input type='button' name='power_button'  value='删除'   class='Button3'  onclick="buttomOnClickDel(this,'<%=baseURL%>/deleteProcess.do','self','itemIdCheckBox')" id='Process_del'>&nbsp;&nbsp;
     </td>
    </tr>
    </table>
	<TABLE width="100%" <%=tableStyle%> align="center">
		<tr>
			<th align="center" class="ListTableHeader" width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></th>
			<th width="30%" align="center" class="ListTableHeader" nowrap="nowrap"><b>流程名称</b></th>
			<th width="65%" align="center" class="ListTableHeader" nowrap="nowrap"><b>流程别名</b></th>
		</tr>
		<logic:iterate name="pageList" id="process" scope="request" >
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td   align="center"><input type="checkbox" name="itemIdCheckBox"  value="<bean:write name="process" property="processId"/>" >&nbsp;</td>
			<td >
			<a href="#" onclick="buttomOnClick('<%=baseURL%>/bsp/wfss/process/process_edit_frame.jsp?processId=<bean:write name="process" property="processId"/>','parent')" >
			  <bean:write name="process" property="processName"/>&nbsp;
			 </a>
			 </td>
			 <td>
			 <bean:write name="process" property="processAlias"/>&nbsp;
			 </td>

			  
		</tr>
		</logic:iterate>
	</table>
	</form>
</fe:body>
<script>
	  <%String reloadTree=(String)request.getAttribute("reloadTree");
	  if(reloadTree!=null&&reloadTree.equals("true"))
	  {
	     %>
	       parent.left.location="<%=baseURL%>/bsp/wfss/process/process_tree.jsp";
	     <%
	  }
	  %>
	</script>
</html>
