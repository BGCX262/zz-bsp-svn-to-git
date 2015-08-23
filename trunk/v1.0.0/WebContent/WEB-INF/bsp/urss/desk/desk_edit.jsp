<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
	</head>
	<html>
	<table <%=tableStyle%> width="100%">
			<tr class="ListTableHeader">
				<td colspan="4">
					<div align="center">
							<strong>
							<logic:notEmpty name="DeskForm" property="deskId">修改桌面定义</logic:notEmpty> 
							<logic:empty name="DeskForm" property="deskId">新增桌面定义</logic:empty> 
                             </strong>
					</div>
				</td>
			</tr>
			<tr class=ListTableRow>
				<td colspan="4">
				
					<input type='button' name='power_button'  value='保存'   class='Button3'  onclick="submitForm(this,'deskEdit',0,'urss')" id='dict_save'>&nbsp;&nbsp;
                    
                    <input type='button' name='power_button'  value='返回列表'   class='Button3'  onclick="buttomOnClick('<%=baseURL%>/queryPageDesk_urss.do','self')" id='desk_save'>&nbsp;&nbsp;
                 
                   </td>
			</tr>
	</table>
	<table width="100%" <%=tableStyle%>>
	<html:form action="/saveDesk_urss.do"   styleId="deskEdit" method="post">
			 <tr class="ListTableRow">
				<td width="15%" >桌面名称：</td>
				<td width="35%">
				  <html:hidden name="DeskForm" property="deskId" styleId="deskId" />
				  <html:text name="DeskForm" styleClass="formStyleall"  property="deskName" styleId="deskName"  size="30" /><%=red%>
				</td>
				<td width="15%">所属应用：</td>
				<td width="35%">
				<fe:dropDown struts="true" dictType="app" property="appId" name="DeskForm" dynamic="true"/><%=red%>
				</td>
			  </tr>
			  <tr class="ListTableRow">
				<td>顺序号：</td>
				<td>
					 <html:text name="DeskForm" styleClass="formStyleall"  property="orderIndex" styleId="orderIndex"  size="30" /><%=red%>
				</td>
				<td>初始显示：</td>
				<td>
				<html:radio name="DeskForm"   property="initDisplay" value="Y">是</html:radio>
				<html:radio name="DeskForm"   property="initDisplay" value="N">否</html:radio>
				  </td>
				
			  </tr>
			  
			   <tr class="ListTableRow">
				<td>URL地址：</td>
				<td colspan="3">
				  <html:text name="DeskForm" styleClass="formStyleall"  property="deskUrl" styleId="deskUrl"  size="80" /><%=red%>
				</td>
				
			  </tr>
			  </html:form>
	</table>
</html>

