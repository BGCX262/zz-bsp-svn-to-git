<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <title>接收的信息列表</title>
	</head>
	
	<fe:body>
	<form action="<%=baseURL%>/listUserAllMessageAccept_abdf.do" id="messageAcceptListForm" method="post" name="messageAcceptListForm">
	<fe:topTable> 
	   &nbsp;&nbsp;<fe:powerTool funCode="messageAcceptList" groupName="list" type="button"/>
	   &nbsp;&nbsp;<span class="btn-input"><input type='button' name='power_button' value='编写消息' class='Button3' onclick="buttomOnClick('<%=baseURL%>/editMessageSend_abdf.do','self');" id='baseStation_show'>&nbsp;&nbsp;</span>
	   &nbsp;&nbsp;<span class="btn-input"><input type='button' name='power_button' value='文件夹维护' class='Button3' onclick="buttomOnClick('<%=baseURL%>/listUserMessageFolder_abdf.do','self');" id='baseStation_show'>&nbsp;&nbsp;  </span>
   </fe:topTable> 
  
   <fe:span>
	<TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
	 <thead>
	 	<tr>
			<td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllGrid(this,'itemIdCheckBox')"></td>
			<fe:tabTitle title="<b>标题</b>" column="" width="40%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
			<fe:tabTitle title="<b>收件时间</b>" column="acceptTime" width="10%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
		    <fe:tabTitle title="<b>发件人</b>" column="sendId" width="10%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
		    <fe:tabTitle title="<b>已读</b>" column="readFlag" width="10%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
	        <fe:tabTitle title="<b>阅读时间</b>" column="readTime" width="10%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
	        <td width="5%"><b>操作</b></td>
		</tr>
	  </thead>
	  <logic:iterate name="pageList" id="messageSendAndAccept" scope="request">
	  	<bean:define id="messageSend" name="messageSendAndAccept" property="messageSend" />
	  	<bean:define id="messageAccept" name="messageSendAndAccept" property="messageAccept" />
	  	
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td  align="center"><input type="checkbox" name="itemIdCheckBox" value="<bean:write name="messageAccept" property="id"/>" >&nbsp;</td>
			<td><a href="#" onclick="buttomOnClick('<%=baseURL%>/showMessageAccept_abdf.do?id=<bean:write name="messageAccept" property="id"/>','self')" >
			  <bean:write name="messageSend" property="htmlTitle"/>&nbsp;</a></td>
			<td><bean:write name="messageAccept" property="acceptTime" format="yyyy-mm-dd"/>&nbsp;</td>
			<td><bean:write name="messageSend" property="sendOrgName"/>&nbsp;</td>
			<td><fe:codeToName dictType="abdf_yesno" name="messageAccept" property="readFlag" struts="true" dynamic="false" scope="page"/>&nbsp;</td>
			<td><bean:write name="messageAccept" property="readTime" format="yyyy-mm-dd"/>&nbsp;</td>
			<td><a href="#" onclick="buttomOnClick('<%=baseURL %>/deleteMessageAccept_abdf.do?id=<bean:write name="messageAccept" property="id"/>','self')" >
			  删除&nbsp;</a></td>
		</tr>
		</logic:iterate>
	</table>
	</fe:span>
	<fe:bottomTable><fe:root inputclass="formStyleall" formId="messageAcceptListForm"/></fe:bottomTable>
	</form>
  </fe:body>
</html>

