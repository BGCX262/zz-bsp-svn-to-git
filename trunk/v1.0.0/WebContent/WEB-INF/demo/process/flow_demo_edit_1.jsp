<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.core.facade.IWfssServiceFacade"%>
<%@ page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@ page import="com.youthor.bsp.core.wfss.model.ActivityInstance"%>
<%@ page import="com.youthor.bsp.core.wfss.model.ProcessInstance"%>
<%@ page import="com.youthor.bsp.core.wfss.common.cache.IWFCacheEngine"%>
<%@ page import="com.youthor.bsp.core.abdf.common.helper.DateHelper"%>
<%@ page import="com.youthor.bsp.core.wfss.common.helper.FlowDataHelper"%>
<%@ page import="com.youthor.bsp.core.wfss.model.Activity"%>
<%@ page import="com.youthor.bsp.core.wfss.common.model.WfProcessTraceHelper"%>
<%@ page import="com.youthor.bsp.view.abdf.common.helper.DictHelper"%>
<%@ page import="com.youthor.bsp.core.abdf.model.Item"%>
<%@ page import="com.youthor.bsp.core.abdf.model.Attachment"%>
<%@ page import="com.youthor.bsp.core.abdf.common.helper.DateHelper"%>
<%@ page import="com.youthor.bsp.view.abdf.common.helper.WebHelper"%>
<%@ page import="com.youthor.bsp.core.urss.model.Org"%>


<%@ page import="java.util.*"%>

<html>
<head>
<%@include file="/bsp/abdf/common.jsp"%>
</head>

<html>

<fe:body formId="SimpleProcessDemoForm1" moduleName="demo" prompt="true" runFlow="true" >
	<form name="SimpleProcessDemoForm1" method="post" action="<%=baseURL%>/submitSimpleProcessDemo1_demo.do" style="margin: 0px" id="SimpleProcessDemoForm1">
	    <fe:topTable><fe:wfPowerTool formId="SimpleProcessDemoForm1" moduleName="demo"/></fe:topTable>
		<fe:span>
		<br />
		<center><font size=4><b>流程DEMO</b></font></center>
		<br />
		<fe:wfPageHead />
		<html:hidden name="SimpleProcessDemoForm1" property="id"styleId="id" />
		<table border="0" width="98%" align="center">
			<tr>
				<td>
				<div class="tab-pane" id="tabPane1"><script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
				<div class="tab-page" id="tabPage2">
				<h2 class="tab">流程Demo</h2>
				<script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
				<table   cellspacing="0" cellpadding="3" width="96%" class="tform" align=center>
					<tr>
						<td width="15%"><span id="name_span">名称：</span></td>
						<td width="35%">
						<html:text name="SimpleProcessDemoForm1" property="name" styleId="name" size="30"styleClass="formStyleall" readonly="true" /></td>
						<td width="15%"><span id="simpleId_span">父id：</span></td>
						<td width="35%">
						<html:text name="SimpleProcessDemoForm1" property="simpleId" styleId="simpleId" size="30" styleClass="formStyleall" readonly="true" /></td>
						
						</td>
					</tr>

				

				</table>
				</div>


				<div class="tab-page" id="tabPage3">
				<h2 class="tab">流程跟踪</h2>
				<script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage3" ) );</script>
				<fe:wfProcessTrace/>
				</div>


				</div>
				</td>
			</tr>
		</table>
         <fe:wfAttachment/>
		 </fe:span>
	</form>
	
	
</fe:body>
</html>

