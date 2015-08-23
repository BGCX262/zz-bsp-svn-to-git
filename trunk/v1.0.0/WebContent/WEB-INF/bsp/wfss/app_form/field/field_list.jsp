<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>
<%@include file="/bsp/abdf/common.jsp"%>
</head>
<script type="text/javascript" language="javascript">
  function addField(obj)
  {
     buttomOnClickAdd(obj,'<%=baseURL%>/initFormField_wfss.do?appFormId=<%=request.getAttribute("appFormId")%>','self');
  }
  function delField(obj)
  {
    buttomOnClickDel(this,'<%=baseURL%>/deleteFormField_wfss.do?appFormId=<%=request.getAttribute("appFormId")%>','self','itemIdCheckBox')
  }
</script>
<fe:body>
<fe:topTable>
  <fe:powerTool funCode="wfss_form_mrg" groupName="list_field"/>
</fe:topTable>
   <fe:span>
    <form name="FormFieldForm" method="post" action="<%=baseURL%>/deleteFormField_wfss.do" id="resourceEdit" style="margin: 0">
	<TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
	<thead>
		<tr>
			<td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></td>
			<td width="15%" align="center"  nowrap="nowrap"><b>字段名称</b></td>
			<td width="20%" align="center"  nowrap="nowrap"><b>字段编号</b></td>
			<td width="10%" align="center"  nowrap="nowrap"><b>字段类型</b></td>
		</tr>
		</thead>
		<logic:iterate name="pageList" id="field" scope="request">
		<bean:define id="fieldRequest" toScope="request" name="field"></bean:define>
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td   align="center"><input type="checkbox"  name="itemIdCheckBox"  value="<bean:write name="field" property="fieldId"/>" ></td>
			<td >
			  <a href="#" onclick="buttomOnClick('<%=baseURL%>/showFormField_wfss.do?fieldId=<bean:write name="field" property="fieldId"/>','self')" >
			  <bean:write name="field" property="fieldName"/></a>
			 </td>
			 <td >
			    <bean:write name="field" property="fieldAlias"/>&nbsp;
			 </td>
			 <td >
			   <fe:codeToName dictType="pageInputType" name="fieldRequest" property="fieldInputType" scope="request" dynamic="true"/>
			 &nbsp;
			 </td>
		</tr>
		</logic:iterate>
	</table>
	</form>
	</fe:span>
	<fe:bottomTable>
		<b><bean:write name="appForm" property="appFormName"/></b>
	</fe:bottomTable>
</fe:body>
</html>
