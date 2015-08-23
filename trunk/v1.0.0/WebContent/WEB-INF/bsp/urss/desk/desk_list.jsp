<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>

<%@include file="/bsp/abdf/common.jsp"%>
</head>
<body  class="right_body">
   <form action="<%=baseURL%>/queryPageDesk_urss.do" id="deskListForm" method="post" name="deskListForm">
   <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="right_top">
 <tr>
    
	<td  class="right_top_td">
        <input type='button' name='power_button'  value='新增'  class='Button3'  onclick="buttomOnClickAdd(this,'<%=baseURL%>/initDesk_urss.do','self')" id='Desk_add'>&nbsp;&nbsp;
      <input type='button' name='power_button'  value='删除'   class='Button3'  onclick="buttomOnClickDel(this,'<%=baseURL%>/deleteDesk_urss.do','self','itemIdCheckBox')" id='Desk_del'>&nbsp;&nbsp;
    
  </td>
  </tr>
  </table>
 <SPAN class="right_middle" id="cccc">
	<TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
		 <thead>
		<tr>
			<td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></td>
			<td width="20%" align="center"  nowrap="nowrap"><b>桌面名称</b></td>
			<td width="20%" align="center"  nowrap="nowrap"><b>所属应用</b></td>
			<td width="10%" align="center"  nowrap="nowrap"><b>初始显示</b></td>
			<td width="50%" align="center"  nowrap="nowrap"><b>URL链接</b></td>
		</tr>
		</thead>
		<logic:iterate name="pageList" id="desk" scope="request" >
		<bean:define name="desk" toScope="request" id="deskRquest"></bean:define>
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td   align="center"><input type="checkbox" name="itemIdCheckBox"  value="<bean:write name="desk" property="deskId"/>" >&nbsp;</td>
			<td >
			<a href="#" onclick="buttomOnClick('<%=baseURL%>/showDesk_urss.do?deskId=<bean:write name="desk" property="deskId"/>','self')" >
			  <bean:write name="desk" property="deskName"/>&nbsp;
			 </a>
			 </td>
			 <td>
			 <fe:codeToName dictType="app" dynamic="true" name="deskRquest" property="appId" struts="true"/>
			 </td>
			  <td>
			  <logic:equal name="desk" property="initDisplay" value="Y">是</logic:equal>
			  <logic:equal name="desk" property="initDisplay" value="N">否</logic:equal>
			  &nbsp;
			 </td>
			  <td>
			 <bean:write name="desk" property="deskUrl"/>&nbsp;
			 </td>
		</tr>
		</logic:iterate>
	</table>
	</span>
<script language=javascript>
	document.getElementById("cccc").style.height=document.body.clientHeight-51;
	window.onresize = onresizeBB;
	function onresizeBB() {
	 document.getElementById("cccc").style.height=document.body.clientHeight-51;
	}
	
</script>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="right_bottom">
<tr>
 <td align=center><fe:root inputclass="formStyleall" formId="deskListForm"/></td>
</tr>
</table>
	
	</form>
</body>

</html>
