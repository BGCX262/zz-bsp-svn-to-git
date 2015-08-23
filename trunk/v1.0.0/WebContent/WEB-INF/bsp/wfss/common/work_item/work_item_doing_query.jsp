<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
	</head>
	
	<fe:body  >
    <fe:topTable>
     
       <SPAN class='btn-input' id='urss_save_sys_conf'><INPUT style='WIDTH: 60px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none'  class='Button3'  type='button' value='确定查询'  name='POWER_BUTTON' onclick="selfDefSubmitForm('SystemConfEdit')" /></span>
       <SPAN class='btn-input' id='ABDF_FAVORITE'><INPUT style='WIDTH: 60px; BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none' type='button' value='关闭'  name='POWER_BUTTON'  onclick='javascript:window.parent.tb_remove()' /></span>     
    </fe:topTable>

  
	<br />
		<center>
			<font size=4><b>待办查询</font>
		</center>
		<br />
	<table border="0" width="80%" align="center">
			<tr>
				<td>
					<div class="tab-pane" id="tabPane1">
						<script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
						<div class="tab-page" id="tabPage2">
							<h2 class="tab">
								查询条件
							</h2>
							<script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
							<table cellspacing="0" cellpadding="3" width="96%" class="tform" align="center">
	
			<tr >
				<td width="15%" ><span id="appCode_span">所属流程：</span></td>
				<td width="85%">
						
						<input type="text" name="appCode" size="30" value="GXUNION_PROJECT" id="appCode" class="formStyleall">
				</td>
				
				</tr>
				<tr >
				<td width="15%"><span id="appName_span">业务类型：</span></td>
				<td width="85%">			   
				  <input type="text" name="appName" size="30" value="项目管理系统" id="appName" class="formStyleall">
				</td>
				</tr>
				
				<tr >
				<td width="15%"><span id="appName_span">标题：</span></td>
				<td width="85%">			   
				  <input type="text" name="appName" size="30" value="" id="appName" class="formStyleall">
				</td>
				</tr>
				
			  
			  
	</table>
						 </div>
		
		                 </div>
				 </td>
			</tr>
		</table>
	
</fe:body>
</html>

