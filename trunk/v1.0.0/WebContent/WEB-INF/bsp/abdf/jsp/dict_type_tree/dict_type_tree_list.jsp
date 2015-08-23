<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>
<%@include file="/bsp/abdf/common.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<link rel="StyleSheet" type="text/css" href="<%=baseURL%>/css/grid.css">
<link rel="StyleSheet" type="text/css" href="<%=baseURL%>/css/public.css">

</head>

<fe:body>
<fe:topTable> 
        <input type='button' name='power_button'  value='新增'  class='Button3'  onclick="buttomOnClickAdd(this,'<%=baseURL%>/initDictTypeTree_abdf.do','self')" id='dictionary_add'>&nbsp;&nbsp;
   </fe:topTable> 
   



 
  
  <fe:span>
	<TABLE  cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
	<thead>
	<tr>
			<td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></td>
			<td width="15%" align="center"  nowrap="nowrap"><b>数据字典类型名称</b></td>
			<td width="15%"  align="center"  nowrap="nowrap"><b>数据字典类型代码</b></td>
			<td  width="10%" align="center"  nowrap="nowrap"><b>树类型</b></td>
			<td  width="10%" align="center"  nowrap="nowrap"><b>删除方式</b></td>
			<td  align="center"  nowrap="nowrap"><b>model类全类名</b></td>
			</tr>
	</thead>	
		<logic:iterate name="listDictTypeTree" id="dictTreeType" scope="request">
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td   align="center"><input type="checkbox"  name="itemIdCheckBox"  value="<bean:write name="dictTreeType" property="treeTypeId"/>" ></td>
			<td >
			  <a href="#" onclick="buttomOnClick('<%=baseURL%>/showDictTypeTree_abdf.do?treeTypeId=<bean:write name="dictTreeType" property="treeTypeId"/>','self')" >
			  <bean:write name="dictTreeType" property="treeTypeName"/></a>
			 </td>
			 <td >
			 <bean:write name="dictTreeType" property="treeTypeCode"/>
			 </td>
			 
			  
			   <td >
			  <logic:equal name="dictTreeType" property="treeStyle" value="sync">同步</logic:equal>
			  <logic:equal name="dictTreeType" property="treeStyle" value="async">异步</logic:equal>
			 </td>
			 
			   <td >
			  <logic:equal name="dictTreeType" property="delMode" value="logicDel">逻辑删除</logic:equal>
			  <logic:equal name="dictTreeType" property="delMode" value="physicsDel">物理删除</logic:equal>
			 </td>
			  <td >
			 <bean:write name="dictTreeType" property="modelClass"/>&nbsp;
			 </td>
		</tr>
		</logic:iterate>
	</table>
  </fe:span>

		<fe:bottomTable></fe:bottomTable>
	
</fe:body>
</html>
