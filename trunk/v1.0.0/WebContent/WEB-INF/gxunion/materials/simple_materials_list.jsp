<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <title>物料信息列表</title>
	</head>
	<fe:body>
	


	<form action="<%=baseURL%>/listPageSimpleMaterials.do" id="simpleMaterialsListForm" method="post" name="simpleMaterialsListForm">
	<fe:topTable> 
	   <fe:powerTool funCode="simpleMaterials" groupName="list"/>&nbsp;&nbsp;
	   &nbsp;&nbsp;
   </fe:topTable> 
  
   <fe:span>
	<TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
	 <thead>
	 	<tr>
			<td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllGrid(this,'itemIdCheckBox')"></td>
			<fe:tabTitle title="<b>物料代号</b>" column="code" width="22%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
			<fe:tabTitle title="<b>物料名称</b>" column="name" width="22%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
		    <fe:tabTitle title="<b>当前库存数</b>" column="northLatitude" width="22%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
		    <fe:tabTitle title="<b>预警库存数</b>" column="eastLongitude" width="22%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
		    <fe:tabTitle title="<b>预警联系邮箱</b>" column="eastLongitude" width="22%" downImg="bsp/abdf/skins/default/img/public/down.png" upImg="bsp/abdf/skins/default/img/public/up.gif"  align="center" />
		</tr>
	  </thead>
	  <logic:iterate name="pageList" id="materials" scope="request">
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td  align="center"><input type="checkbox" name="itemIdCheckBox" value="<bean:write name="materials" property="id"/>" >&nbsp;</td>
			<td >
			<a href="#" onclick="buttomOnClick('<%=baseURL%>/showMaterials.do?id=<bean:write name="materials" property="id"/>','self')" >
			  <bean:write name="materials" property="code"/>&nbsp;
			 </a>
			 </td>
			 <td><bean:write name="materials" property="name"/>&nbsp;</td>
			 <td><bean:write name="materials" property="inventory" format="0.0"/>&nbsp;</td>
			 <td><bean:write name="materials" property="warningValue" format="0.0"/>&nbsp;</td>
		</tr>
		</logic:iterate>
	</table>
	</fe:span>
	<fe:bottomTable><fe:root inputclass="formStyleall" formId="materialsListForm"/></fe:bottomTable>
	</form>
  </fe:body>
</html>

