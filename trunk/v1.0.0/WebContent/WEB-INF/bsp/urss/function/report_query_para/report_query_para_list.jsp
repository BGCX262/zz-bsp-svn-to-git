<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>
<%@include file="/bsp/abdf/common.jsp"%>
<SCRIPT type="text/javascript" language="javascript">
  function addReportQueryPara(obj) {
    buttomOnClickAdd(obj,'<%=baseURL%>/initReportQueryPara_urss.do?funModuleId=<%=request.getAttribute("funId")%>&appId=<%=request.getParameter("appId")%>','self')
  }
  function delReportQueryPara(obj) {
    buttomOnClickDel(obj,'<%=baseURL%>/deleteReportQueryPara_urss.do?funModuleId=<%=request.getAttribute("funId")%>','self','itemIdCheckBox')
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
 <td class='coolButton' name='POWER_BUTTON'  onaction="addReportQueryPara(this)"  >新增</td>
 <td class='coolButton' name='POWER_BUTTON'  onaction="delReportQueryPara(this)"  id='urss_fun_add_equal'>删除</td>
 </tr>
 </table>
</td>
</tr>
</table>

    </fe:topTable>
 <fe:span subHeight="0">
 
   <form name="ReportQueryParaForm" method="post" action="<%=baseURL%>/deleteReportQueryPara_urss.do" id="reportQueryParaEdit">
	<TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
	 <thead>
        <tr>
			<td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></th>
			<td width="30%" align="center"  nowrap="nowrap"><b>查询字段名称</b></td>
			<td width="20%" align="center"  nowrap="nowrap"><b>查询字段编号</b></td>
			
		</tr>
    </thead>
		<logic:iterate name="pageList" id="reportQueryPara" scope="request">
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td   align="center"><input type="checkbox"  name="itemIdCheckBox"  value="<bean:write name="reportQueryPara" property="id"/>" ></td>
			<td >
			  <a href="#" onclick="buttomOnClick('<%=baseURL%>/showReportQueryPara_urss.do?id=<bean:write name="reportQueryPara" property="id"/>','self')" >
			  <bean:write name="reportQueryPara" property="name"/></a>
			 </td>
			 <td >
			    <bean:write name="reportQueryPara" property="paraKey"/>&nbsp;
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
