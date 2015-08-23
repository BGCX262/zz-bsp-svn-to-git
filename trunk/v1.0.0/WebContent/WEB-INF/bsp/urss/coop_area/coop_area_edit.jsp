<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
	</head>
	<fe:body moduleName="urss" formId="CoopAreaEdit" prompt="true">
	   <fe:topTable>
          <fe:powerTool funCode="urss_coop_area" groupName="edit"/>
	 </fe:topTable>
     <fe:span>
      <br />
		<center>
			<font size=4><b>协同区管理</font>
		</center>
		<br />
	<html:form action="/saveCoopArea_urss.do"   styleId="CoopAreaEdit" method="post">
	<table border="0" width="80%" align="center">
	<tr>
		<td>
		<div class="tab-pane" id="tabPane1"><script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
		<div class="tab-page" id="tabPage2">
		<h2 class="tab">基本信息</h2>
		<script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
		
	    <table cellspacing="0" cellpadding="3" width="100%" class="tform" align=center>
			 <tr  style="display:none">
				<td width="20%" >所属父名称：</td>
				<td width="80%" colspan="3">
				 
				  <html:hidden name="CoopAreaForm" property="coopAreaId" styleId="coopAreaId" />
				</td>
			  </tr>
			  <tr >
				<td width="16%" ><span id="coopAreaName_span">协同定义名称：</span></td>
				<td width="29%" colspan="1">
					 <html:text name="CoopAreaForm" styleClass="formStyleall"  property="coopAreaName" styleId="coopAreaName"  size="30" />
				</td>
				
				<td width="16%" ><span id="coopAreaCode_span">编号：</isDynamic></td>
				<td width="29%" colspan="1">
				<html:text name="CoopAreaForm" styleClass="formStyleall"  property="coopAreaCode" styleId="coopAreaCode"   />
				</td>
			  </tr>
			  <tr >
				<td width="16%" ><span id="isDynamic_span">是否动态：</span></td>
				<td width="29%" colspan="1">
					<html:radio name="CoopAreaForm"   property="isDynamic" value="Y">是</html:radio>
				<html:radio name="CoopAreaForm"   property="isDynamic" value="N">否</html:radio>
				</td>
				
				<td width="16%" ><span id="orderShow_span">排序号：</span></td>
				<td width="29%" colspan="1">
				   <html:text name="CoopAreaForm" styleClass="formStyleall"  property="orderShow" styleId="orderShow"  size="20" />
				</td>
			  </tr>
			  
			  
			  <tr >
				<td width="16%" ><span id="coopAreaImg_span">图标：</span></td>
				<td  colspan="3">
					 <html:text name="CoopAreaForm" styleClass="formStyleall"  property="coopAreaImg" styleId="coopAreaImg"  size="40" />
				</td>
				
				
			  </tr>
			  
			 
	</table>
	 </html:form>
	 </div>
		</td>
	</tr>
</table>
	 </fe:span>
	 <fe:bottomTable>
	 <strong>
	   <logic:notEmpty name="CoopAreaForm" property="coopAreaId">修改协同区</logic:notEmpty> 
	   <logic:empty name="CoopAreaForm" property="coopAreaId">新增协同区</logic:empty> 
	 </strong></fe:bottomTable>
	</fe:body>
	
	
</html>


