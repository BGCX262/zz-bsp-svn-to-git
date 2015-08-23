<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
	</head>   
	<fe:body moduleName="urss" formId="UserPwdEdit">
		<fe:topTable>
			 <fe:powerTool funCode="urss_modify_pwd" groupName="edit"/>
    	</fe:topTable>
	<fe:span>
	<br />
		<center>
			<font size="4"><b>修改密码 &nbsp;&nbsp;</b></font>
		</center><br/>
		<center>
			<font color="red">&nbsp;&nbsp;<strong>
					<%
						if(request.getAttribute("hintMessage")!= null){
							out.println(request.getAttribute("hintMessage"));
						}
					%>
				</strong></font>
		</center>
		<br/>
		<html:form action="/modifyPassword_urss.do"   styleId="UserPwdEdit" method="post">
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
								<tr>
									<td width="16%" ><span id="oldPwd_span">原始密码：</span></td>
									<td width="29%" colspan="3"><input type="password" name="oldPwd"  value="" id="oldPwd"></td>
								</tr>
								<tr>
									<td width="16%" ><span id="pwd_span">新密码：</span></td>
									<td width="29%" colspan="3"><input type="password" name="pwd"  value="" id="pwd"></td>
								</tr>
								<tr>
									<td width="16%" ><span id="rePwd_span">重复新密码：</span></td>
									<td width="29%" colspan="3"><input type="password" name="rePwd"  value="" id="rePwd"></td>
								</tr>
							</table>
		 				</div>
	                 </div>
				 </td>
			</tr>
		</table>
		 </html:form>
	</fe:span>
	<fe:bottomTable><strong>修改用户密码</strong></fe:bottomTable>
	</fe:body>
</html>


