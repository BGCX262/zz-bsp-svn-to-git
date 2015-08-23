<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>
<%@include file="/bsp/abdf/common.jsp"%>
</head>
<body>

 <table <%=tableStyle%> width="100%">
			<tr class="ListTableHeader">
				<td colspan="4">
					<div align="center">
							<strong>
							  <bean:write name="expType"/>表达式列表
                             </strong>
					</div>
				</td>
			</tr>
	</table>	

   <table  <%=tableStyle%> width="100%">
  
    <tr  class=ListTableRow >
      <td colspan="4">
      <input type='button' name='power_button'  value='新增'  class='Button3'  onclick="buttomOnClickAdd(this,'<%=baseURL%>/initExpression_wfss.do?expType=<bean:write name="expType"/>','self')" id='dictionary_add'>&nbsp;&nbsp;
      <input type='button' name='power_button'  value='删除'  class='Button3'  onclick="buttomOnClickDel(this,'<%=baseURL%>/deleteExpression_wfss.do','self','itemIdCheckBox')" id='dictionary_del'>&nbsp;&nbsp;
     
     </td>
    </tr>
    </table>
	<TABLE width="100%" <%=tableStyle%> align="center">
	 <form name="ExpressionForm" method="post" action="<%=baseURL%>/listExpression_wfss.do" id="ExpressionForm" >
		<tr>
		
			<th align="center" class="ListTableHeader" width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></th>
			<th width="15%" align="center" class="ListTableHeader" nowrap="nowrap"><b>名称<INPUT type="hidden" name="expType" value="<bean:write name="expType"/>"></b></th>
			<th width="10%" align="center" class="ListTableHeader" nowrap="nowrap"><b>所属系统</b></th>
			<th width="10%" align="center" class="ListTableHeader" nowrap="nowrap"><b>应用表单</b></th>
			<th width="10%" align="center" class="ListTableHeader" nowrap="nowrap"><b>表达式用途分类</b></th>
		</tr>
		<logic:iterate name="pageList" id="expression" scope="request">
		<bean:define id="expressionRequest" name="expression" toScope="request"></bean:define>
		<bean:define id="appId" name="expression" property="appId" toScope="request"></bean:define>
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td   align="center"><input type="checkbox"  name="itemIdCheckBox"  value="<bean:write name="expression" property="expId"/>" ></td>
			<td >
			  <a href="#" onclick="buttomOnClick('<%=baseURL%>/showExpression_wfss.do?expId=<bean:write name="expression" property="expId"/>','self')" >
			  <bean:write name="expression" property="expName"/></a>
			 </td>
			
			 <td >
			 <fe:codeToName dictType="app" dynamic="true" name="expressionRequest" property="appId"/>
			 </td>
			 
			  <td >
			 <fe:codeToName dictType="appForm" dynamic="true" name="expressionRequest" property="appFormId"/>
			 </td>
			 
			  <td >
			  <logic:equal name="expression" property="expUseType"  value="JAVA_0">流程启动前</logic:equal>
			  <logic:equal name="expression"  property="expUseType"  value="JAVA_1">流程结束前</logic:equal>
			  <logic:equal name="expression"  property="expUseType"  value="JAVA_2">活动启动前</logic:equal>
               <logic:equal name="expression"  property="expUseType"  value="JAVA_3">活动启动后</logic:equal>
				   
				<logic:equal name="expression"  property="expUseType"  value="JS_0">流程启动前</logic:equal>
			  <logic:equal name="expression"  property="expUseType"  value="JS_1">选路由前</logic:equal>
			  <logic:equal  name="expression"  property="expUseType"  value="JS_2">打开业务之前</logic:equal>
               <logic:equal name="expression"  property="expUseType"  value="JS_3">提交活动之前</logic:equal>

			 </td>
		</tr>
		</logic:iterate>
	</table>
	<fe:root inputclass="formStyleall" formId="ExpressionForm"/>
	</form>
</body>
</html>
