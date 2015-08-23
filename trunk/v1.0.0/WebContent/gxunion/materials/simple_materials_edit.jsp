<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.view.urss.helper.WebHelper"%>	
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
	</head>
 
	<fe:body formId="BaseStationEdit" moduleName="gxunion" >
    <fe:topTable>
       <fe:powerTool funCode="baseStation" groupName="edit"/>
       <input type='button' name='power_button'  value='返回列表'   class='Button3'  onclick="buttomOnClick('<%=baseURL%>/listPageBaseStation.do','self')" id='baseStation_save'>&nbsp;&nbsp;       
    </fe:topTable>

  <fe:span>
	<html:form action="/saveBaseStation.do"   styleId="BaseStationEdit" method="post">
	<br/><center><font size="4"><b>基站管理</b></font></center><br/>
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
	
			 <tr>
				<td width="16%" ><span id="code_span">基站代号：</span></td>
				<td width="29%">
				  <html:hidden name="BaseStationForm" property="id" styleId="id" />
				  <html:hidden name="BaseStationForm" property="createOrgId" styleId="createOrgId" />
				  <html:hidden name="BaseStationForm" property="createOrgName" styleId="createOrgName" />
				  <html:text name="BaseStationForm" styleClass="formStyleall"  property="code" styleId="code"  size="30" />
				</td>
				<td width="20%"><span id="name_span">名称：</span></td>
				<td width="35%">
				  <html:text name="BaseStationForm" styleClass="formStyleall"  property="name"  styleId="name" size="30"  />
				</td>
			  </tr>
			  <tr>
				<td width="16%" ><span id="northLatitude_span">北纬位置：</span></td>
				<td width="29%">
				  <html:text name="BaseStationForm" styleClass="formStyleall"  property="northLatitude" styleId="northLatitude"  size="30" />
				</td>
				<td width="20%"><span id="eastLongitude_span">东经位置：</span></td>
				<td width="35%">
				  <html:text name="BaseStationForm" styleClass="formStyleall"  property="eastLongitude"  styleId="eastLongitude" size="30"  />
				</td>
			  </tr>
			  <tr>
				<td width="16%" ><span id="createTime_span">建站时间：</span></td>
				<td width="29%">
				  <fe:date property="createTime" name="BaseStationForm"/>
				</td>
				<td width="20%"><span id="createOrgName_span">创建者：</span></td>
				<td width="35%">
				  <html:text name="BaseStationForm" styleClass="formStyleall"  property="createOrgName"  styleId="createOrgName" size="30"  readonly="true"/>
				</td>
			  </tr>
			  
			  <tr>
				<td width="16%" ><span id="description_span">基站描述：</span></td>
				<td width="29%" colspan="3">
				  <html:textarea name="BaseStationForm" property="description" rows="5" style="width:100%"></html:textarea>
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
	<fe:bottomTable></fe:bottomTable>
</fe:body>
</html>

