<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>
<%@include file="/bsp/abdf/common.jsp"%>
<SCRIPT type="text/javascript" language="javascript">
  function addResource(obj) {
    buttomOnClickAdd(obj,'<%=baseURL%>/initResource_urss.do?funModuleId=<%=request.getAttribute("funId")%>&appId=<%=request.getParameter("appId")%>','self')
  }
  function delResource(obj) {
    buttomOnClickDel(obj,'<%=baseURL%>/deleteResource_urss.do?funModuleId=<%=request.getAttribute("funId")%>','self','itemIdCheckBox')
  }
</SCRIPT>

</head>
<fe:body moduleName="urss">
<fe:topTable width="100%">
  <table cellpadding='0' cellspacing='0' width='100%' border='0'  class='toolBar1'>
 <tr>
<td>
<table id='toolBar' border='0'>
<tr>
<td class='coolButton' align='left' width='3'><img src='<%=baseURL%>/bsp/abdf/skins/default/img/toolbar/toolbar.gif'/></td>
 <td class='coolButton' name='POWER_BUTTON'  onaction="addResource(this)"  >新增</td>
 <td class='coolButton' name='POWER_BUTTON'  onaction="delResource(this)"  id='urss_fun_add_equal'>删除</td>
 </tr>
 </table>
</td>
</tr>
</table>

    </fe:topTable>
 <fe:span subHeight="0">
 
   <form name="ResourceForm" method="post" action="<%=baseURL%>/deleteResource_urss.do" id="resourceEdit">
	<TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
	 <thead>
        <tr>
			<td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></th>
			<td width="30%" align="center"  nowrap="nowrap"><b>资源名称</b></td>
			<td width="20%" align="center"  nowrap="nowrap"><b>资源编号</b></td>
			<td width="10%" align="center"  nowrap="nowrap"><b>是否按钮</b></td>
			<td width="15%" align="center"  nowrap="nowrap"><b>分组名称</b></td>
			<!--  <th width="15%" align="center"  nowrap="nowrap"><b>实现JS</b></th>-->
			<td width="15%" align="center"  nowrap="nowrap"><b>联带分配</b></td>
		</tr>
    </thead>
		<logic:iterate name="pageList" id="resource" scope="request">
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td   align="center"><input type="checkbox"  name="itemIdCheckBox"  value="<bean:write name="resource" property="resourceId"/>" ></td>
			<td >
			  <a href="#" onclick="buttomOnClick('<%=baseURL%>/showResource_urss.do?resourceId=<bean:write name="resource" property="resourceId"/>','self')" >
			  <bean:write name="resource" property="resourceName"/></a>
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
			 <!--  <td ><bean:write name="resource" property="implJs"/>&nbsp;</td> -->
			
			 <td >
			    <logic:equal name="resource" property="linkAssign" value="Y">是</logic:equal>
			    <logic:equal name="resource" property="linkAssign" value="N">否</logic:equal>
			 </td>
			   
		</tr>
		</logic:iterate>
	</table>
	</form>
	 </fe:span>
</fe:body>
<SCRIPT language=javascript>
var cells = document.getElementById('toolBar').rows[0].cells;
for (var i = 1; i < cells.length; i++){
createButton(cells[i]);
} 
 </SCRIPT>

</html>
