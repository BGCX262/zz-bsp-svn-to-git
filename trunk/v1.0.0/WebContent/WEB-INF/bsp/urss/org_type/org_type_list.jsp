<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>

<%@include file="/bsp/abdf/common.jsp"%>
</head>
<fe:body>
<fe:topTable>
<fe:powerTool funCode="urss_org_type" groupName="list"/>
</fe:topTable>
  
   <fe:span>
    <form action="<%=baseURL%>/queryPageOrgType_urss.do" id="orgTypeListForm" method="orgType" name="orgTypeListForm" style="margin: 0">
	<TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
	  <thead>
		<tr>
			<td align="center"  width="10%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></td>
			<td width="30%" align="center"  nowrap="nowrap"><b>组织架构类型名称</b></td>
			<td width="30%" align="center"  nowrap="nowrap"><b>组织架构类型编码</b></td>
			
			<td width="15%" align="center"  nowrap="nowrap"><b>状态</b></td>
		</tr>
		</thead>
		<logic:iterate name="pageList" id="orgType" scope="request" >
		<bean:define name="orgType" toScope="request" id="orgTypeRquest"></bean:define>
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
		<%String disabled =""; %>
		<logic:greaterThan value="0" name="orgType" property="orgNumber">
		  <% disabled ="disabled"; %>
		</logic:greaterThan>
		<logic:equal value="Y" name="orgType" property="systemIn" >
		 <% disabled ="disabled"; %>
		</logic:equal>
			<td   align="center"><input type="checkbox"  name="itemIdCheckBox" <%=disabled %> value="<bean:write name="orgType" property="orgTypeId"/>" >&nbsp;</td>
			<td >
			<logic:notEqual value="Y" name="orgType" property="systemIn">
			<a href="#" onclick="buttomOnClick('<%=baseURL%>/showOrgType_urss.do?orgTypeId=<bean:write name="orgType" property="orgTypeId"/>','self')" >
              <bean:write name="orgType" property="orgTypeName"/>&nbsp;
             </a>
			</logic:notEqual>
			<logic:equal value="Y" name="orgType" property="systemIn">
             <bean:write name="orgType" property="orgTypeName"/>&nbsp;
            </logic:equal>
			 </td>
			 <td>
			 <bean:write name="orgType" property="orgTypeCode"/>&nbsp;
			 </td>
			   <td>
			    <logic:equal name="orgType" property="isUseing" value="Y">启用</logic:equal>
			  <logic:equal name="orgType" property="isUseing" value="N">停用</logic:equal>&nbsp;
			 
			 </td>
			 
		</tr>
		</logic:iterate>
	</table>
	</form>
	</fe:span>
	<fe:bottomTable>
	   <strong>组织架构类型定义列表</strong>
	</fe:bottomTable>
</fe:body>

</html>
