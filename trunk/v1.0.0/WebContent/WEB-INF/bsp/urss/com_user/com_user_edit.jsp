<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.youthor.bsp.view.urss.helper.WebHelper"%>	
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
	</head>
	 <script>
   function changeComName()
   {
 
       document.getElementById("regComName").value=event.srcElement.options[event.srcElement.selectedIndex].text;
   }
    
  </script> 
	<fe:body formId="ComUserEdit" moduleName="urss" >
    <fe:topTable>
       <input type='button' name='power_button'  value='保存'   class='Button3'  onclick="submitForm(this,'ComUserEdit',0,'urss')" id='dict_save'>&nbsp;&nbsp;
       <input type='button' name='power_button'  value='返回列表'   class='Button3'  onclick="buttomOnClick('<%=baseURL%>/listPageComUser_urss.do','self')" id='regCompany_save'>&nbsp;&nbsp;       
    </fe:topTable>

  <fe:span>
	<html:form action="/saveComUser_urss.do"   styleId="ComUserEdit" method="post">
	<br />
		<center>
			<font size=4><b>应用管理</font>
		</center>
		<br />
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
	
			 <tr >
				<td width="16%" ><span id="comUserName_span">管理用户姓名：</span></td>
				<td width="29%">
				  <html:hidden name="ComUserForm" property="comUserId" styleId="comUserId" />
				  <html:text name="ComUserForm" styleClass="formStyleall"  property="comUserName" styleId="comUserName"  size="30" />
				</td>
				<td width="20%"><span id="logonId_span">管理用户登陆名：</span></td>
				<td width="35%">
				  <html:text name="ComUserForm" styleClass="formStyleall"  property="logonId"  styleId="logonId" size="30"  />
				</td>
			  </tr>
			  <tr >
				<td width="16%" ><span id="pwd_span">管理用户密码：</span></td>
				<td width="29%" colspan="1">
				
				     <input type="hidden" name="pwdOld" value="<bean:write name="ComUserForm"   property="pwd"/>" id="pwdOld">
					 <html:password name="ComUserForm" styleClass="formStyleall"  property="pwd" styleId="pwd"  size="30" />
				</td>
				<td width="16%" ><span id="userType_span">管理用户类型：</span></td>
				<td width="29%" colspan="1">
				<fe:dropDown name="ComUserForm"  property="userType" dictType="adminType" dynamic="true" struts="true"/>
				
					 
				</td>
			  </tr>
			  <%
			  if(WebHelper.isComAdmin(session))
		     {
			%>
			   <tr >
				<td width="16%" ><span id="logonId_regComName">所属公司名称：</span></td>
				<td width="29%" colspan="3">
				<input type="hidden" name="regComId" value="<%=WebHelper.getCurrComId(session)%>">
				<input type="hidden" name="regComName" value="<%=WebHelper.getCurrComName(session)%>">
				<%=WebHelper.getCurrComName(session)%>
				</td>
				<!-- 
				<td width="20%">所有组织名称：</td>
				<td width="35%">
				  <html:text name="ComUserForm" styleClass="formStyleall"  property="orgName"  styleId="orgName" size="30"  />
				</td>
				-->
			  </tr>
			<%
		     }
		     else if(WebHelper.isSuperAdmin(session))
		     {
		    %>
			   <tr >
				<td width="16%" ><span id="logonId_regComName">所属公司名称：</span></td>
				<td width="29%" colspan="3">
				<fe:dropDown dictType="canAddUserComs" name="ComUserForm" property="regComId"  struts="true" dynamic="true" onchange="changeComName()"/>
				 <html:hidden name="ComUserForm" property="regComName" styleId="regComName" />
				</td>
				<!-- 
				<td width="20%">所有组织名称：</td>
				<td width="35%">
				  <html:text name="ComUserForm" styleClass="formStyleall"  property="orgName"  styleId="orgName" size="30"  />
				</td>
				-->
			  </tr>
			  <%}%>
	</table>
						 </div>
		
		                 </div>
				 </td>
			</tr>
		</table>
	</html:form>
	</fe:span>
	<fe:bottomTable>
		<logic:notEmpty name="ComUserForm" property="comUserId">修改管理用户</logic:notEmpty> 
		<logic:empty name="ComUserForm" property="comUserId">新增管理用户</logic:empty> 
	</fe:bottomTable>
</fe:body>
</html>

