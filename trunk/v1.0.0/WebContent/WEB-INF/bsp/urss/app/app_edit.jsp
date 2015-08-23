<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.view.urss.helper.WebHelper"%>	
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
	</head>
	
	<fe:body formId="appEdit" moduleName="urss" >
    <fe:topTable>
     <fe:powerTool funCode="urss_app_mrg" groupName="edit"/>
    </fe:topTable>

  <fe:span>
	<html:form action="/saveApp_urss.do"   styleId="appEdit" method="post" style="margin: 0">
	<br />
		<center>
			<font size=4><b>应用管理</font>
		</center>
		<br />
	<table border="0" width="80%" align="center">
			<tr>
				<td>
					<div class="tab-pane" id="tabPane1">
						<script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
						<div class="tab-page" id="tabPage2">
							<h2 class="tab">
								基本属性
							</h2>
							<script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
							<table cellspacing="0" cellpadding="3" width="96%" class="tform" align="center">
	
			<tr >
				<td width="15%" ><span id="appCode_span">应用编码：</span></td>
				<td width="35%">
						<html:hidden name="AppForm" property="appId" styleId="appId" />
						<html:text name="AppForm" styleClass="formStyleall"  property="appCode" styleId="appCode"  size="30" />
				</td>
				<td width="15%"><span id="appName_span">应用名称：</span></td>
				<td width="35%">			   
				  <html:text name="AppForm" styleClass="formStyleall"  property="appName" styleId="appName"  size="30" />
				</td>
				</tr>
				<tr >
				<td width="16%" ><span id="status_span">应用状态：</span></td>
				<td width="29%">
				<html:radio name="AppForm"   property="status" value="0">开发</html:radio>
				<html:radio name="AppForm"   property="status" value="1">上线</html:radio>
				
				</td>
				<td width="16%" ><span id="appType_span">应用类型：</span> </td>
				<td width="29%">
				<html:text name="AppForm" styleClass="formStyleall"  property="appType" styleId="appType"  size="30" />
				
					
				</td>
				
			  </tr>
			  
			  <tr >	
				<td width="20%"><span id="deskUrl_span">应用桌面地址：</span></td>
				<td width="35%">			   
				  <html:text name="AppForm" styleClass="formStyleall"  property="deskUrl" styleId="deskUrl"  size="30" />
				</td>
				<td width="20%"><span id="orderIndex_span">应用排序号：</span></td>
				<td width="35%">			   
				  <html:text name="AppForm" styleClass="formStyleall"  property="orderIndex" styleId="orderIndex"  size="30"/>
				</td>
			  </tr>
			  
			  <tr >	
				<td width="16%" ><span id="appAddress_span">应用发布地址：</span></td>
				<td width="29%" colspan="1">
					<html:text name="AppForm" styleClass="formStyleall"  property="appAddress" styleId="appAddress"  size="40" />
				</td>
				<td width="16%" ><span id="appOutAddress_span">应用外网发布地址：</span></td>
				<td width="29%" colspan="1">
					<html:text name="AppForm" styleClass="formStyleall"  property="appOutAddress" styleId="appOutAddress"  size="40" />
				</td>
				
			  </tr>
			  
			  <tr >	
				<td width="20%"><span id="turnOnMenu_span">是否启用菜单：</span></td>
				<td width="35%">
				<html:radio name="AppForm"   property="turnOnMenu" value="Y" >是</html:radio>
				<html:radio name="AppForm"   property="turnOnMenu" value="N">否</html:radio>
				
				</td>
				<td width="20%"><span id="startupMenuCache_span">是否启用菜单缓存：</span></td>
				<td width="35%">
				<html:radio name="AppForm"   property="startupMenuCache" value="Y">是</html:radio>
				<html:radio name="AppForm"   property="startupMenuCache" value="N">否</html:radio>
				</td>
			  </tr>
			  
			  
	</table>
						 </div>
		
		                 </div>
				 </td>
			</tr>
		</table>
	</html:form>
	</fe:span>
	<fe:bottomTable>
		<logic:notEmpty name="AppForm" property="appId">修改应用</logic:notEmpty> 
		<logic:empty name="AppForm" property="appId">新增应用</logic:empty>
	</fe:bottomTable>
</fe:body>
</html>

