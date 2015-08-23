<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<%@include file="/bsp/abdf/common.jsp"%>
 
</head>


<fe:body formId="DictForm" moduleName="abdf">
	<fe:topTable>
		<input type='button' name='power_button'  value='保存'   class='Button3'  onclick="submitForm(this,'DictForm',0,'abdf')" id='dict_save'>&nbsp;&nbsp;
					 <input type='button' name='power_button'  value='新增'  class='Button3'  onclick="buttomOnClickAdd(this,'<%=baseURL%>/initDict_abdf.do?dictTypeId=<bean:write name="dictType" property="dictTypeId"/>','self')" id='Dict_add'>&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='返回列表'   class='Button3'  onclick="buttomOnClickAdd(this,'<%=baseURL%>/listDict_abdf.do?dictTypeCode=<bean:write name="dictType" property="dictTypeCode"/>','self')" id='dict_save'>&nbsp;&nbsp; 
    </fe:topTable>
    <html:form action="/saveDict_abdf.do" style="margin: 0px" styleId="DictForm">
    <html:hidden name="DictForm" property="dictId" styleId="dictId" />
	<fe:span>

		<br />
		<center><font size=4><b><bean:write name="dictType" property="dictTypeName"/>管理</font></center>
		<br />
		<table border="0" width="80%" align="center">
			<tr>
				<td>
				<div class="tab-pane" id="tabPane1"><script
					type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
				<div class="tab-page" id="tabPage2">
				<h2 class="tab"> <html:hidden name="DictForm" property="dictTypeId" styleId="dictTypeId" />
							    <html:hidden name="DictForm" property="dictId" styleId="dictId" />
								<bean:write name="dictType" property="dictTypeName"/>信息</h2>
				<script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
				 
    
				<table cellspacing="0" cellpadding="3" width="100%" class="tform" align=center>
					 <tr>
                             	<td width="15%" ><span id="dictValue_span"><bean:write name="dictType" property="dictTypeName"/>值：</span></td>
								<td width="35%"><html:text name="DictForm" styleClass="formStyleall"  property="dictValue"  styleId="dictValue" size="30"  /></td>
								<td width="15%"><span id="dictAlias_span"><bean:write name="dictType" property="dictTypeName"/>别名：</span></td>
								<td width="35%"><html:text name="DictForm" styleClass="formStyleall"  property="dictAlias"  styleId="dictAlias" size="30"  /></td>
			                   </tr>
							<tr>
                             	<td width="15%" ><span id="isUse_span">状态：</span></td>
								<td width="35%" ><html:radio name="DictForm" property="isUse" value="Y"/>启用<html:radio name="DictForm" property="isUse" value="N"/>停用</td>
								<td width="15%">排序号：</td>
								<td width="35%"><html:text name="DictForm" styleClass="formStyleall"  property="orderIndex"  styleId="orderIndex" size="4"  /></td>
			                   </tr>
			                   
			                   <tr>
                             	<td width="15%">描述：</td>
								<td width="35%" colspan="3">
								<html:textarea name="DictForm" property="dictDes" style="width:100%" rows="8"></html:textarea>
								</td>
								
			                   </tr>	
				</table>	

				
				</div>

				</div>
				</td>
			</tr>
		</table>
 
		
	</fe:span>
	</html:form>
	<fe:bottomTable>
		<logic:notEmpty name="DictForm" property="dictId">修改<bean:write name="dictType" property="dictTypeName"/></logic:notEmpty> 
		<logic:empty name="DictForm" property="dictId">新增<bean:write name="dictType" property="dictTypeName"/></logic:empty>
	</fe:bottomTable>
</fe:body>
 
</html>

