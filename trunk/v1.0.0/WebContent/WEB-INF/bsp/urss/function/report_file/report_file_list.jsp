<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>
<%@include file="/bsp/abdf/common.jsp"%>
<SCRIPT type="text/javascript" language="javascript">
  function addReportFile(obj) {
    buttomOnClickAdd(obj,'<%=baseURL%>/initReportFile_urss.do?funModuleId=<%=request.getAttribute("funId")%>&appId=<%=request.getParameter("appId")%>','self')
  }
  function delReportFile(obj) {
    buttomOnClickDel(obj,'<%=baseURL%>/deleteReportFile_urss.do?funModuleId=<%=request.getAttribute("funId")%>','self','itemIdCheckBox')
  }
</SCRIPT>

</head>
<fe:body moduleName="urss">
<fe:topTable width="100%">
  <table cellpadding='0' cellspacing='0' width='100%' border='0'  class='toolBar1'>
 <tr>
<td>
<table id='toolBar' border='0'>
<tr>
<td class='coolButton' align='left' width='3'><img src='<%=baseURL%>/bsp/abdf/skins/default/img/toolbar/toolbar.gif'/></td>
 <td class='coolButton' name='POWER_BUTTON'  onaction="addReportFile(this)"  >新增</td>
 <td class='coolButton' name='POWER_BUTTON'  onaction="delReportFile(this)"  id='urss_fun_add_equal'>删除</td>
 </tr>
 </table>
</td>
</tr>
</table>

    </fe:topTable>
 <fe:span subHeight="0">
 
   <form name="ReportFileForm" method="post" action="<%=baseURL%>/deleteReportFile_urss.do" id="reportFileEdit">
	<TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
	 <thead>
        <tr>
			<td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></th>
			<td width="30%" align="center"  nowrap="nowrap"><b>附件名</b></td>
			<td width="20%" align="center"  nowrap="nowrap"><b>描述</b></td>
			
		</tr>
    </thead>
		<logic:iterate name="pageList" id="reportFile" scope="request">
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td   align="center"><input type="checkbox"  name="itemIdCheckBox"  value="<bean:write name="reportFile" property="id"/>" ></td>
			<td  width="20%">
			  <a href="#" onclick="buttomOnClick('<%=baseURL%>/showReportFile_urss.do?id=<bean:write name="reportFile" property="id"/>','self')" >
			  <bean:write name="reportFile" property="fileName"/></a>
			 </td>
			 <td width="80%">
			    <bean:write name="reportFile" property="desc"/>&nbsp;
			 </td>
			 
			   
		</tr>
		</logic:iterate>
	</table>
	</form>
	 </fe:span>
</fe:body>
<SCRIPT language=javascript>
var cells = document.getElementById('toolBar').rows[0].cells;
for (var i = 1; i < cells.length; i++){
createButton(cells[i]);
} 
 </SCRIPT>

</html>
