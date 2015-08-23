<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/bsp/abdf/common.jsp"%>
<%@page import="java.util.*"%>
<html>
<head>

<style type="text/css">
<!--
#MOVE_Div {
	position: absolute;
	left: 30%;
	top: 10%;
	width: 120 px;
	height: 10 px;
	background-color: #FFFFFF;
}
-->
</style>
</head>
<fe:body formId="InformationForm" moduleName="abdf">
	<script type="text/javascript" language="javascript">    
    function deleteAttach()
    {
       var formObj=document.getElementById("InformationForm");
	   var count=getCheckBoxNum("itemIdFileCheckBox");
       if(count <1)
       {
  		alert("请选择一条附件记录进行删除！");
        return ;
       }
        if(window.confirm("您确定要删除选中的附件吗？")){
         var editModel_fireeagleTemp=editModel_fireeagle;
	   editModel_fireeagle=false;
            formObj.action="<%=baseURL%>/deleteAttachInfor_abdf.do";
		   formObj.submit();
        }
    }
var fileIndex = 0;
	function addFile() 
	{
		fileIndex++;
	    var spanId = "filespan";
	    var fileId = "uploadFile(" +fileIndex+ ")";
	    addInputFile(spanId, fileId,fileIndex);
	}
	function addInputFile(spanId, fileId,index) 
	{
    	var span = document.getElementById(spanId);
    	if (span != null) 
    	{
        	var divObj = document.createElement("div");
        	var fileObj, delObj;
        	divObj.id = fileId;

           	fileObj = document.createElement("<input type=file size=\"80\" style=\"height: 22\" >");
           	delObj = document.createElement("<input type=button onclick=delInputFile('" + spanId + "','" + fileId + "') class=button>");
        	fileObj.name = fileId;
        	fileObj.size = "80";
        	//设置显示风格,input暂时未定义
        	fileObj.className = "input";
        	delObj.value ='删除';
        	divObj.appendChild(document.createTextNode("文件: "));
        	//divObj.appendChild(textObj);
        	divObj.appendChild(document.createTextNode(" "));
        	divObj.appendChild(fileObj);
        	divObj.appendChild(document.createTextNode(" "));
        	divObj.appendChild(delObj);
        	span.appendChild(divObj);
    	}
	}
	 function delInputFile(spanId, fileId) 
	{
    	var span = document.getElementById(spanId);
    	var divObj = document.getElementById(fileId);
    	if (span != null && divObj != null) 
    	{
        	span.removeChild(divObj);
    	}
	}
	</script>

	<fe:topTable>
		<fe:powerTool funCode="abdf_information" groupName="edit" />
	</fe:topTable>
	<fe:span>
		<br />
		<center><font size="4"><b> 公告/新闻信息管理 </b></font></center>
		<br />
		<html:form action="/saveInformation_abdf.do" styleId="InformationForm" enctype="multipart/form-data">
			<table border="0" width="96%" align="center">
				<tr>
					<td>
					<div class="tab-pane" id="tabPane1"><script
						type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
					<div class="tab-page" id="tabPage2">
					<h2 class="tab">基本属性</h2>
					<script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>

					<table cellspacing="0" cellpadding="3" width="96%" class="tform"
						align="center">

						<tr>
							<td width="16%" class="edit_td"><span id="infoType_span">信息类型:</span></td>
							<html:hidden property="infoId" name="InformationForm" />
							<td width="29%"><fe:dropDown
								dictType="abdf_information_type" name="InformationForm"
								property="infoType" disabled="false" dynamic="false"
								struts="true"  valueType="alias"/></td>
							<td width="16%" class="edit_td"><span id="infoTitle_span">信息标题:</span></td>
							<td width="29%"><html:text name="InformationForm"
								styleClass="formStyleall" property="infoTitle"
								styleId="infoTitle" size="30" /></td>
						</tr>

						<tr>
							<td width="16%" class="edit_td"><span id="infoStatus_span">信息状态:</span></td>
							<td width="29%"><fe:dropDown
								dictType="abdf_information_status" name="InformationForm"
								property="infoStatus" disabled="false" dynamic="false" 
								struts="true" valueType="alias"/></td>
							<td width="16%" class="edit_td"><span id="createTime_span">创立时间:</span></td>
							<td width="29%"><fe:date property="createTime" name="InformationForm" disabled="true" /></td>
						</tr>

						<tr>
							<td width="16%" class="edit_td">创立人:</td>
							<td width="29%"><html:text name="InformationForm" styleClass="formStyleall" property="createOrgName"
								styleId="createOrgName" size="30" disabled="true"/></td>
							<td width="16%" class="edit_td"><span id="url_span">链接路径：</span></td>
							<td width="29%"><html:text name="InformationForm" styleClass="formStyleall" property="url" styleId="url" size="30" /></td>
						</tr>

						<tr>
							<td width="16%" class="edit_td"><span id="abledDate_span">生效日期:</span></td>
							<td width="29%"><fe:date property="abledDate" name="InformationForm" disabled="false" /></td>
							<td width="16%" class="edit_td"><span id="disabledDate_span">失效日期:</span></td>
							<td width="29%"><fe:date property="disabledDate" name="InformationForm" disabled="false" /></td>
						</tr>

						<tr>
							<td width="16%" class="edit_td"><span id="htmlContent_span">正文:</span></td>
							<td width="84%" colspan="3"><html:textarea property="htmlContent" name="InformationForm" 
								cols="80" rows="8" styleId="htmlContent"/></td>
						</tr>
					</table>
					<br>
					<br>

					<fieldset style='width: 100%'><legend>附件</legend>
					<div><iframe id="attacheFrame" name="attacheFrame"
						style="display: none;"></iframe>
					<table width="100%" <%=tableStyle%>>
						<tr>
							<td nowrap id="filespan">文件:&nbsp;<inputname
								="uploadFile(0)" type="file" size="80" style="height: 22" /> <input
								name="button" type="button" onclick="addFile()" class="button"
								value="增加" /></td>
						</tr>
					</table>
					<TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist"
						align="center">
						<thead>
							<tr>
								<td align="center" width="5%">选择</td>
								<td width="45%" align="center" nowrap="nowrap"><b>文件名</b></td>
								<td width="7%" align="center" nowrap="nowrap"><b>上传人</b></td>
								<td width="16%" align="center" nowrap="nowrap"><b>上传时间</b></td>

								<td width="10%" align="center" nowrap="nowrap"><b>大小(K)</b></td>
							</tr>
						</thead>
						<logic:present name="attachListData">
							<logic:iterate name="attachListData" id="attach" scope="request">
								<tr onmouseover='mouseovertd(this)'
									onmouseout='mouseouttd(this)'>
									<td align="center"><input type="checkbox"
										name="itemIdFileCheckBox"
										value="<bean:write name="attach" property="attachId"/>">&nbsp;</td>
									<td><A
										href="<%=request.getContextPath()%>/downloadFile_abdf.do?attachId=<bean:write name="attach" property="attachId"/>"
										target="attacheFrame"><bean:write name="attach"
										property="oriFileName" /></a></td>
									<td><bean:write name="attach" property="createName" /></td>
									<td><bean:write name="attach" property="createTime"
										format="yyyy-MM-dd HH:mm" /></td>
									<td><bean:write name="attach" property="fileSize"
										format="0.0" /></td>
								</tr>
							</logic:iterate>
						</logic:present>
					</table>
					</div>
					</fieldset>
					<br>
					<br>
					</div>

					</div>
					</td>
				</tr>
			</table>
		</html:form>
	</fe:span>

	<fe:bottomTable>
		<logic:notEmpty name="InformationForm" property="infoId">修改公告/新闻</logic:notEmpty>
		<logic:empty name="InformationForm" property="infoId">新增公告/新闻</logic:empty>
	</fe:bottomTable>
</fe:body>
</HTML>
