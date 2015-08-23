<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>

<%@include file="/bsp/abdf/common.jsp"%>
<SCRIPT>
    function downLoadBaseFile(type)
    {
       document.getElementById("downLoadIframe").src="<%=baseURL%>/buildXMLModelToFile_abdf.do?packageName=<bean:write name="xmlModel" property="packageName"/>&className=<bean:write name="xmlModel" property="className"/>&keyName=<bean:write name="xmlModel" property="keyFieldName"/>&tableName=<bean:write name="xmlModel" property="tableName"/>&type="+type;
    }
</SCRIPT>
</head>
<body>
   <table  <%=tableStyle%> width="100%">
    <tr class="ListTableHeader">
      <td colspan="4" ><div align="center" ><strong>为数据表<bean:write name="xmlModel" property="tableName"/>生成xml和model文件</strong></div></td>
    </tr>
   
    </table>
   
    
	<TABLE width="100%" <%=tableStyle%> align="center">
		<tr>
		   <td width="25%" align="center" class="ListTableHeader" nowrap="nowrap"><b>XML文件内容,建议文件名<bean:write name="xmlModel" property="className"/>.hbm.xml</b>
		   <input type='button' name='power_button'  value='下载'  class='Button2'  onclick="downLoadBaseFile('xml')" id='dictionary_add'>
			<IFRAME id="downLoadIframe" src="" style="display:none"></IFRAME> 
		   </td>
		</tr>
	   <tr>
		   <td width="25%" align="center"  nowrap="nowrap">
		   <TEXTAREA style="width:100%" rows="20" readonly="true"><bean:write name="XMLContent"/></TEXTAREA>
		   </td>
		</tr>
		
		
		<tr>
		   <td width="25%" align="center" class="ListTableHeader" nowrap="nowrap"><b>Model文件内容,文件名<bean:write name="xmlModel" property="className"/>.java</b>
		   <input type='button' name='power_button'  value='下载'  class='Button2'  onclick="downLoadBaseFile('model')" id='dictionary_add'>
			 
		   </td>
		</tr>
	   <tr>
		   <td width="25%" align="center"  nowrap="nowrap">
		   <TEXTAREA style="width:100%" rows="20" readonly="true" ><bean:write name="modelContent"/></TEXTAREA>
		   </td>
		</tr>
		
		<tr>
		   <td width="25%" align="center" class="ListTableHeader" nowrap="nowrap"><b>ActionForm文件内容,文件名<bean:write name="xmlModel" property="className"/>Form.java</b>
		   <input type='button' name='power_button'  value='下载'  class='Button2'  onclick="downLoadBaseFile('actionForm')" id='dictionary_add'>
			 
		   </td>
		</tr>
	   <tr>
		   <td width="25%" align="center"  nowrap="nowrap">
		   <TEXTAREA style="width:100%" rows="20" readonly="true" ><bean:write name="formContent"/></TEXTAREA>
		   </td>
		</tr>
	</table>

</body>

</html>
