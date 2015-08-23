<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
	</head>
	<html>
	<script>
	   function submitToNext()
	   {
	      if(document.getElementById("tableName").value=='')
	      {
	         alert("请选择表名!");
	         return;
	      }
	      alert(document.getElementById("tableName").value);
	      document.getElementById("SubassemblyForm").submit();
	   }
	</script>
	<body>
	<table <%=tableStyle%> width="100%">
			<tr class="ListTableHeader">
				<td colspan="4">
					<div align="center">
							<strong>业务/数据组件---第一步</strong>
					</div>
				</td>
			</tr>
			<tr class=ListTableRow>
				<td colspan="4">
					<input type='button' name='power_button'  value='下一步'   class='Button3'  onclick="submitToNext()" id='dict_save'>&nbsp;&nbsp;
                   </td>
			</tr>
	</table>
	
	<table width="100%" <%=tableStyle%>>
	<form name="SubassemblyForm" method="post" action="<%=baseURL%>/saveSubassembly_abdf.do" id="SubassemblyForm">
			<tr class="ListTableRow">
				<td width="10%" >请选择表名：</td>
				<td width="90%">
				<html:text property="tableName" name="SubassemblyForm" styleClass="formStyleall" styleId="tableName" size="80"></html:text>
				</td>
			  </tr>
		</form>	
	</table>
	
</body>
</html>

