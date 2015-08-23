<%@ page contentType="text/html;charset=UTF-8" language="java"%>	
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <script type="text/javascript" language="javascript">
    function addField(obj) {
       buttomOnClickAdd(obj,'<%=baseURL%>/initFormField_wfss.do?appFormId=<bean:write name="AppFormFieldForm" property="appFormId"/>','self');
    }
    function backList(obj)
    {
     buttomOnClick('<%=baseURL%>/getFormFieldByFormId_wfss.do?appFormId=<bean:write name="AppFormFieldForm" property="appFormId"/>','self');
    }
    </script>
	</head>
	<html>
	<fe:body formId="appFormFieldEdit" moduleName="wfss">
	<fe:topTable>
	 <fe:powerTool funCode="wfss_form_mrg" groupName="edit_field"/>
	</fe:topTable>
	
	
	 <fe:span>
	<br />
		<center>
			<font size=4><b>管理字段</font>
		</center>
		<br />
	<table border="0" width="80%" align="center">
			<tr>
				<td>
					<div class="tab-pane" id="tabPane1">
						<script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
						<div class="tab-page" id="tabPage2">
							<h2 class="tab">
								基本属性
							</h2>
							<script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
							<html:form action="/saveFormField_wfss.do"   styleId="appFormFieldEdit" method="post" style="margin: 0">
							<table cellspacing="0" cellpadding="3" width="96%" class="tform" align="center">
	
			<tr >
				<td width="16%" ><span id="fieldName_span">字段名称：</sapn></td>
				<td width="29%">
						
						<html:hidden name="AppFormFieldForm" property="fieldId" styleId="fieldId" />
						<html:hidden name="AppFormFieldForm" property="appFormId" styleId="appFormId" />
						
						<html:text name="AppFormFieldForm" styleClass="formStyleall"  property="fieldName" styleId="fieldName"  size="30" />
				</td>
				<td width="20%"><span id="fieldAlias_span">字段编号：</sapn></td>
				<td width="35%">			   
				  <html:text name="AppFormFieldForm" styleClass="formStyleall"  property="fieldAlias" styleId="fieldAlias"  size="30" />
				</td>
				</tr>
				<tr >
				
				<td width="16%" ><span id="fieldInputType_span">字段类型：</sapn></td>
				<td width="29%" colspan="1">
				 <fe:dropDown dictType="pageInputType" name="AppFormFieldForm"  property="fieldInputType" dynamic="true" struts="true"/>
				
				</td>	
				<td width="16%" ><span id="fieldInputType_span">是否数组：</sapn></td>
				<td width="29%" colspan="1">
				 <html:radio name="AppFormFieldForm" property="isArray" value="Y"/>是&nbsp;
				  <html:radio name="AppFormFieldForm" property="isArray" value="N"/>否&nbsp;
				</td>	
				
			  </tr> 
			</table>
	
						 </div>
		
		                 </div>
				 </td>
			</tr>
		</table>
		</html:form>
	</fe:span>
	<fe:bottomTable>
		<b><bean:write name="appForm" property="appFormName"/></b>
	</fe:bottomTable>	
	</fe:body>
</html>

