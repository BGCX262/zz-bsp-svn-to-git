<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <title>基站信息列表</title>
	</head>
	<fe:body>
	


	<form action="<%=baseURL%>/listPageBaseStation.do" id="baseStationListForm" method="post" name="baseStationListForm">
	<fe:topTable> 
	   &nbsp;&nbsp;<fe:powerTool funCode="baseStation" groupName="list" type="button"/>
	   &nbsp;&nbsp;<span class="btn-input"><input type='button' name='power_button' value='查看地图' class='Button3' onclick="window.open('<%=baseURL%>/showBaseStationImg.do')" id='baseStation_show'>&nbsp;&nbsp;
	   </span>
   </fe:topTable> 
  
   <fe:span>
	<TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
	 <thead>
	 	<tr>
			<td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllGrid(this,'itemIdCheckBox')"></td>
			<fe:tabTitle title="<b>基站代号</b>" column="code" width="20%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
			<fe:tabTitle title="<b>名称</b>" column="name" width="20%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
		    <fe:tabTitle title="<b>北纬位置</b>" column="northLatitude" width="20%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
		    <fe:tabTitle title="<b>东经位置</b>" column="eastLongitude" width="20%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
		    <fe:tabTitle title="<b>创建日期</b>" column="createTime" width="20%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
	        
		</tr>
	  </thead>
	  <logic:iterate name="pageList" id="baseStation" scope="request">
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td  align="center"><input type="checkbox" name="itemIdCheckBox" value="<bean:write name="baseStation" property="id"/>" >&nbsp;</td>
			<td >
			<a href="#" onclick="buttomOnClick('<%=baseURL%>/showBaseStation.do?id=<bean:write name="baseStation" property="id"/>','self')" >
			  <bean:write name="baseStation" property="code"/>&nbsp;
			 </a>
			 </td>
			 <td><bean:write name="baseStation" property="name"/>&nbsp;</td>
			 <td><bean:write name="baseStation" property="northLatitude" format="0.0000"/>&nbsp;</td>
			 <td><bean:write name="baseStation" property="eastLongitude" format="0.0000"/>&nbsp;</td>
			 <td><bean:write name="baseStation" property="createTime" format="yyyy-mm-dd"/>&nbsp;</td>
		</tr>
		</logic:iterate>
	</table>
	</fe:span>
	<fe:bottomTable><fe:root inputclass="formStyleall" formId="baseStationListForm"/></fe:bottomTable>
	</form>
  </fe:body>
</html>

