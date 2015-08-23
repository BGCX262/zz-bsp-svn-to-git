<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.view.urss.helper.WebHelper"%>	
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
	</head>
	
	<fe:body formId="ButtonForm" moduleName="wfss">
    <fe:topTable>
    <fe:powerTool funCode="wfss_button" groupName="edit"/>
     </fe:topTable>

  <fe:span>
	<html:form action="/saveButton_wfss.do"   styleId="ButtonForm" method="post">
	<br />
		<center>
			<font size=4><b>公用按钮管理</font>
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
							<table cellspacing="0" cellpadding="3" width="96%" class="tform" align=center>
	
			<tr >
				<td width="15%" ><span id="buttonStyleId_span">按钮编号：</span></td>
				<td width="35%">
						<html:hidden name="ButtonForm" property="buttonId" styleId="buttonId" />
						<html:text name="ButtonForm" styleClass="formStyleall"  property="buttonStyleId" readonly="true" styleId="buttonStyleId"  size="30" />
				</td>
				<td width="15%"><span id="buttonName_span">按钮名称：</span></td>
				<td width="35%">			   
				  <html:text name="ButtonForm" styleClass="formStyleall"   property="buttonName" styleId="buttonName"  size="30" />
				</td>
				</tr>
				<tr >
				<td width="16%" ><span id="buttonPositions_span">按钮所处理位置：</span></td>
				<td width="29%">
				<fe:checkBox name="ButtonForm"    property="buttonPositions" struts="true" dictType="buttonPositions" valueType="value"/>
				
				
				</td>
				<td width="16%" ><span id="jsMethod_span">执行js方法：</span> </td>
				<td width="29%">
				<html:text name="ButtonForm" styleClass="formStyleall" readonly="true" property="jsMethod" styleId="jsMethod"  size="30" />
				
					
				</td>
				
			  </tr>
			  
			  <tr >	
				<td width="20%"><span id="orderIndex_span">排序号：</span></td>
				<td width="35%" colspan="3">			   
				  <html:text name="ButtonForm" styleClass="formStyleall"  property="orderIndex" styleId="orderIndex"  size="30" />
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
		<logic:notEmpty name="ButtonForm" property="buttonId">修改公用按钮</logic:notEmpty> 
		<logic:empty name="ButtonForm" property="buttonId">新增公用按钮</logic:empty>
	</fe:bottomTable>
</fe:body>
</html>

