<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/bsp/abdf/common.jsp"%>
<%@page import="com.youthor.bsp.view.abdf.web.form.InformationForm"%>
<html>
	<head>
	
	</head>
     <body>
	<br/>
         <center><font size="4"><b>
        	<bean:write name="InformationForm" property="infoTitle"/>
         </b></font> </center>
    <br /> 
		<table border="0" width="96%" align="center">
			<tr>
				<td>
					<div class="tab-pane" id="tabPane1">
						<script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
						<div class="tab-page" id="tabPage2">
							<h2 class="tab">
								信息内容
							</h2>
							<script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
							<table cellspacing="0" cellpadding="3" width="96%" class="tform" align="center">
								<tr>
									<td width="16%" class="edit_td">信息类型:</td>
									<td>
										&nbsp;&nbsp;<fe:codeToName dictType="abdf_information_type" name="InformationForm" property="infoType" struts="true" dynamic="false"/>
									</td>
								</tr>
								<tr >
									<td width="16%" class="edit_td">正文内容:</td>
									<td width="100%">
									
									 <%InformationForm informationForm = (InformationForm)request.getAttribute("InformationForm");%>
									 <%if (informationForm.getHtmlContent() !=null){ %>
									  <%=informationForm.getHtmlContent()%>
									   <%}%>
								    &nbsp;
									</td>
								</tr>
							</table>
							<br><br>
							<logic:present name="attachListData">	
							<logic:notEmpty name="attachListData">
							<fieldset style='width:100%'><legend>附件</legend>
	     <div>
	     	<iframe id="attacheFrame" name="attacheFrame" style="display: none;"></iframe>
	    		
	      <TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
	      <thead>
		<tr>
		
		
			<td width="45%" align="center"  nowrap="nowrap"><b>文件名</b></td>
			
		</tr>
		  </thead>
	
		<logic:iterate name="attachListData" id="attach" scope="request"> 
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td >
			<A href="<%=request.getContextPath()%>/downloadFile_abdf.do?attachId=<bean:write name="attach" property="attachId"/>" target="attacheFrame"><bean:write name="attach" property="oriFileName"/></a>
			 </td>
		</tr>
		</logic:iterate>
		
		
	</table>
	     </div>
    </fieldset>
    </logic:notEmpty>
    </logic:present>
 </div>
 </div>
 </td>
 </tr>
 </table></body>


</HTML>
