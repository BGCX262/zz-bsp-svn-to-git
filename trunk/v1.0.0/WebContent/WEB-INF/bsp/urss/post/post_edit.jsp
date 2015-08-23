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
							<logic:notEmpty name="PostForm" property="postId">修改岗位定义</logic:notEmpty> 
							<logic:empty name="PostForm" property="postId">新增岗位定义</logic:empty> 
                             </strong>
					</div>
				</td>
			</tr>
			<tr class=ListTableRow>
				<td colspan="4">
				
					<input type='button' name='power_button'  value='保存'   class='Button3'  onclick="submitForm(this,'postEdit',0,'urss')" id='dict_save'>&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='返回列表'   class='Button3'  onclick="buttomOnClick('<%=baseURL%>/queryPagePost_urss.do','self')" id='post_save'>&nbsp;&nbsp;
                 
                   </td>
			</tr>
	</table>
	
	<table width="100%" <%=tableStyle%>>
	<html:form action="/savePost_urss.do"   styleId="postEdit" method="post">
			 <tr class="ListTableRow">
				<td width="15%" >岗位名称：</td>
				<td width="85%">
				  <html:hidden name="PostForm" property="postId" styleId="postId" />
				  <html:text name="PostForm" styleClass="formStyleall"  property="postName" styleId="postName"  size="80" /><%=red%>
				</td>
			  </tr>
			  <tr class="ListTableRow">
				<td width="15%" >岗位说明：</td>
				<td width="85%">
				  <html:hidden name="PostForm" property="postId" styleId="postId" />
				  <html:text name="PostForm" styleClass="formStyleall"  property="postMemo" styleId="postMemo"  size="80" /><%=red%>
				</td>
			  </tr>
			  </html:form>
	</table>
</html>

