<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
	</head>
	<html>
	
	<body>
	<table <%=tableStyle%> width="100%">
			<tr class="ListTableHeader">
				<td colspan="4">
					<div align="center">
							<strong>
							  业务/数据组件
                             </strong>
					</div>
				</td>
			</tr>
			<tr class=ListTableRow>
				<td colspan="4">
				
					<input type='button' name='power_button'  value='保存'   class='Button3'  onclick="submitForm(this,'dictTypeEdit',0,'abdf')" id='dict_save'>&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='预览页面'   class='Button3'  onclick="backListDictType()" id='dict_save'>&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='生成基础代码'   class='Button4'  onclick="backListDictType()" id='dict_save'>&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='生成服务代码'   class='Button4'  onclick="backListDictType()" id='dict_save'>&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='生成Action'   class='Button4'  onclick="backListDictType()" id='dict_save'>&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='生成JSP'   class='Button4'  onclick="backListDictType()" id='dict_save'>&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='返回列表'   class='Button3'  onclick="backListDictType()" id='dict_save'>&nbsp;&nbsp;
                 
                   </td>
			</tr>
	</table>
	<html:form action="/saveSubassembly_abdf.do"   styleId="SubassemblyForm" method="post">
	<table width="100%" <%=tableStyle%>>
			<tr class="ListTableRow">
				<td width="16%" >数据表名：</sapn></td>
				<td width="29%">
						<html:hidden name="SubassemblyForm" property="subassemblyId" styleId="subassemblyId" />
						<html:text name="SubassemblyForm" styleClass="formStyleall"  property="tableName" styleId="tableName"  size="30" readonly="true"/>
				</td>
				<td width="20%"><span id="dictTypeName_span">业务/数据组件名称：</sapn></td>
				<td width="35%">
				  
				  <html:text name="SubassemblyForm" styleClass="formStyleall"  property="subassemblyName"  styleId="subassemblyName" size="30"  />
				</td>
			  </tr>
			
			<tr class="ListTableRow">
				<td width="16%" >Model包名：</sapn></td>
				<td width="29%" colspan="3">
				  <input type="text" name="tableName" size="80" value="ABDF_DICT" readonly="readonly" id="tableName" class="formStyleall">
				</td>
				
			  </tr>
			  
			  <tr class="ListTableRow">
				<td width="16%" >Model类名：</sapn></td>
				<td width="29%" colspan="3">
				  <input type="text" name="tableName" size="80" value="ABDF_DICT" readonly="readonly" id="tableName" class="formStyleall">
				</td>
			  </tr>
			  
			  <tr class="ListTableRow">
				<td width="16%" >ActionForm包名：</sapn></td>
				<td width="29%" colspan="3">
				  <input type="text" name="tableName" size="80" value="ABDF_DICT" readonly="readonly" id="tableName" class="formStyleall">
				</td>
			  </tr>
			  
			  <tr class="ListTableRow">
				<td width="16%" >ActionForm类名：</sapn></td>
				<td width="29%" colspan="3">
				  <input type="text" name="tableName" size="80" value="ABDF_DICT" readonly="readonly" id="tableName" class="formStyleall">
				</td>
			  </tr>
			  
			   <tr class="ListTableRow">
				<td width="16%" >Dao包名：</sapn></td>
				<td width="29%" colspan="3">
				  <input type="text" name="tableName" size="80" value="ABDF_DICT" readonly="readonly" id="tableName" class="formStyleall">
				</td>
			  </tr>
			  
			   <tr class="ListTableRow">
				<td width="16%" >Dao类名：</sapn></td>
				<td width="29%" colspan="3">
				  <input type="text" name="tableName" size="80" value="ABDF_DICT" readonly="readonly" id="tableName" class="formStyleall">
				</td>
			  </tr>
			  
			   <tr class="ListTableRow">
				<td width="16%" >service包名：</sapn></td>
				<td width="29%" colspan="3">
				  <input type="text" name="tableName" size="80" value="ABDF_DICT" readonly="readonly" id="tableName" class="formStyleall">
				</td>
			  </tr>
			  
			   <tr class="ListTableRow">
				<td width="16%" >service类名：</sapn></td>
				<td width="29%" colspan="3">
				  <input type="text" name="tableName" size="80" value="ABDF_DICT" readonly="readonly" id="tableName" class="formStyleall">
				</td>
			  </tr>
		
	</table>
	</html:form>

</body>
</html>

