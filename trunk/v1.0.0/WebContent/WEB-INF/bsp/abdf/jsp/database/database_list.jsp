<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>

<%@include file="/bsp/abdf/common.jsp"%>
<SCRIPT>
  function buildCodeToText(evt,tableName)
  {
     var packageName=evt.parentElement.parentElement.children[1].children[0].value;
     if(Trim(packageName)=='')
     {
        alert("包名不能为空格或者为空");
        evt.parentElement.parentElement.children[1].children[0].select();
        return;
     }
     var className=evt.parentElement.parentElement.children[2].children[0].value;
    
     if(Trim(className)=='')
     {
        alert("类名不能为空格或者为空");
         evt.parentElement.parentElement.children[1].children[0].select();
        return;
     }
     var keyName=evt.parentElement.parentElement.children[3].children[0].value;
     window.open("<%=baseURL%>/buildXMLModelToText_abdf.do?packageName="+packageName+"&className="+className+"&keyName="+keyName+"&tableName="+tableName);
  }
</SCRIPT>
</head>
<body>
   <table  <%=tableStyle%> width="100%">
    <tr class="ListTableHeader">
      <td colspan="4" ><div align="center" ><strong>数据库中所有表信息</strong></div></td>
    </tr>
   
    </table>
	<TABLE width="100%" <%=tableStyle%> align="center">
		<tr>
		   <td width="25%" align="center" class="ListTableHeader" nowrap="nowrap"><b>表名</b></td>
			<td width="25%" align="center" class="ListTableHeader" nowrap="nowrap"><b><span id="packageName_span" class="promptRed">包名</span></b></td>
			<td width="20%" align="center" class="ListTableHeader" nowrap="nowrap"><b><span id="className_span" class="promptRed">类名</span></b></td>
			<td width="20%" align="center" class="ListTableHeader" nowrap="nowrap"><b>表主key</b></td>
			<td width="10%" align="center" class="ListTableHeader" nowrap="nowrap"><b>操作</b></td>
			</tr>
		<logic:iterate name="pageList" id="tableName" scope="request">
		<tr >
			<td >
			  <bean:write name="tableName" />
			 </td>
			 <td >
			  <input type="text" name="packageName" style="width=100%"  id="packageName" class="formStyleall">
			 </td>
			 <td >
			 <input type="text" name="className" style="width=100%"  id="className" class="formStyleall">
			 </td>
			 <td >
			  <input type="text" name="keyName" style="width=100%"  id="keyName" class="formStyleall">
			 </td>
			<td align="center">
			  <input type='button' name='power_button'  value='浏览代码'  class='Button4'  onclick="buildCodeToText(this,'<bean:write name="tableName" />')" id='dictionary_add'>
			 </td>
		</tr>
		</logic:iterate>
	</table>

</body>

</html>
