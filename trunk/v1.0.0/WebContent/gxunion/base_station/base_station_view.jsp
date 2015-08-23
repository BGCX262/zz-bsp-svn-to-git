<%@ page contentType="text/html;charset=UTF-8" language="java"%>
 <%@include file="/bsp/abdf/common.jsp"%>
 
<table cellspacing="0" cellpadding="0" width="100%" class="tform" align="center">
	<tr>
		<td width="22%" ><span id="code_span">基站代号：</span></td>
		<td width="28%"><bean:write name="BaseStationForm" property="code"/></td>
		<td width="22%"><span id="name_span">名称：</span></td>
		<td width="28%"><bean:write name="BaseStationForm" property="name"/></td>
	  </tr>
	  <tr>
		<td width="22%" ><span id="northLatitude_span">北纬位置：</span></td>
		<td width="28%"><bean:write name="BaseStationForm" property="northLatitude" format="0.0000"/></td>
		<td width="22%"><span id="eastLongitude_span">东经位置：</span></td>
		<td width="28%"><bean:write name="BaseStationForm" property="eastLongitude" format="0.0000"/></td>
	  </tr>
	  <tr>
		<td width="22%" ><span id="createTime_span">建站时间：</span></td>
		<td width="28%"><bean:write name="BaseStationForm" property="createTime" format="yyyy-MM-dd"/></td>
		<td width="22%"><span id="createOrgName_span">创建者：</span></td>
		<td width="28%"><bean:write name="BaseStationForm" property="createOrgName"/></td>
	  </tr> 
	  <tr>
		<td width="22%" ><span id="description_span">基站描述：</span></td>
		<td width="78%" colspan="3"><bean:write name="BaseStationForm" property="description"/></td>
	  </tr>
</table>


