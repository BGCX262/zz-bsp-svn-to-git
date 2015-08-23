<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
	</head>
	<fe:body moduleName="urss" prompt="true" formId="orgTypeEdit">
	<fe:topTable>
	 <fe:powerTool groupName="edit" funCode="urss_org_type"/>
	</fe:topTable>
	<fe:span>
	<br />
		<center>
			<font size=4><b>组织架构类型管理</font>
		</center>
		<br />
		 
		
		<html:form action="/saveOrgType_urss.do"   styleId="orgTypeEdit" method="post" style="margin: 0">
	<table border="0" width="96%" align="center">
	<tr>
		<td>
		<div class="tab-pane" id="tabPane1"><script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
		<div class="tab-page" id="tabPage2">
			<h2 class="tab">基本信息</h2>
			<script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
	<table cellspacing="0" cellpadding="3" width="100%" class="tform" align=center>
	
			 <tr >
				<td width="15%" ><span id="orgTypeName_span">组织架构名称:</span></td>
				<td width="85%">
				  <html:hidden name="OrgTypeForm" property="orgTypeId" styleId="orgTypeId"/>
				  <html:hidden name="OrgTypeForm" property="comId" styleId="comId"/>
				  <logic:equal value="Y" name="OrgTypeForm" property="systemIn">
				      <html:text name="OrgTypeForm" disabled="true"  styleClass="formStyleall"  property="orgTypeName" styleId="orgTypeName"  size="80" />
				  </logic:equal>
				  
				  <logic:notEqual value="Y" name="OrgTypeForm" property="systemIn">
                      <html:text name="OrgTypeForm"   styleClass="formStyleall"  property="orgTypeName" styleId="orgTypeName"  size="80" />
                  </logic:notEqual>
				 
				  
				</td>
			  </tr>
			  <tr >
				<td width="15%" ><span id="orgTypeCode_span">组织架构编码:</span></td>
				<td width="85%">
				  <logic:equal value="Y" name="OrgTypeForm" property="systemIn">
                       <html:text name="OrgTypeForm" disabled="true" styleClass="formStyleall"  property="orgTypeCode" styleId="orgTypeCode"  size="80" />
                  </logic:equal>
                  
                  <logic:notEqual value="Y" name="OrgTypeForm" property="systemIn">
                  <html:text name="OrgTypeForm"  styleClass="formStyleall"  property="orgTypeCode" styleId="orgTypeCode"  size="80" />
                  </logic:notEqual>
				 
				</td>
			  </tr>
			  <tr >
				<td width="15%" ><span id="isUseing_span">状态:</span></td>
				<td width="85%">
				
				<logic:equal value="Y" name="OrgTypeForm" property="systemIn">
                      <html:radio name="OrgTypeForm" disabled="true"  property="isUseing" value="Y">启用</html:radio>
                      <html:radio name="OrgTypeForm" disabled="true"  property="isUseing" value="N">停用</html:radio>
                  </logic:equal>
                  
                  <logic:notEqual value="Y" name="OrgTypeForm" property="systemIn">
                  <html:radio name="OrgTypeForm"   property="isUseing" value="Y">启用</html:radio>
                      <html:radio name="OrgTypeForm"   property="isUseing" value="N">停用</html:radio>
                  </logic:notEqual>
				</td>
			  </tr>
			
	</table>
		</div>
		</td>
	</tr>
</table>
  </html:form>
	</fe:span>
	<fe:bottomTable>
	  <strong>
		<logic:notEmpty name="OrgTypeForm" property="orgTypeId">修改组织架构定义</logic:notEmpty> 
		<logic:empty name="OrgTypeForm" property="orgTypeId">新增组织架构定义</logic:empty> 
      </strong>
	</fe:bottomTable>
	</fe:body>
</html>


