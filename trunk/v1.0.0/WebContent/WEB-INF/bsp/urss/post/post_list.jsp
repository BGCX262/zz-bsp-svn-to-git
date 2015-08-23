<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>

<%@include file="/bsp/abdf/common.jsp"%>
</head>
<body>
   <form action="<%=baseURL%>/queryPagePost_urss.do" id="postListForm" method="post" name="postListForm">
   <table  <%=tableStyle%> width="100%">
    <tr class="ListTableHeader">
      <td colspan="4" ><div align="center" ><strong>岗位定义列表</strong></div></td>
    </tr>
    <tr  class=ListTableRow >
      <td colspan="4">
     
      <input type='button' name='power_button'  value='新增'  class='Button3'  onclick="buttomOnClickAdd(this,'<%=baseURL%>/initPost_urss.do','self')" id='Post_add'>&nbsp;&nbsp;
      <input type='button' name='power_button'  value='删除'   class='Button3'  onclick="buttomOnClickDel(this,'<%=baseURL%>/deletePost_urss.do','self','itemIdCheckBox')" id='Post_del'>&nbsp;&nbsp;
     </td>
    </tr>
    </table>
	<TABLE width="100%" <%=tableStyle%> align="center">
		<tr>
			<th align="center" class="ListTableHeader" width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></th>
			<th width="30%" align="center" class="ListTableHeader" nowrap="nowrap"><b>岗位名称</b></th>
			<th width="65%" align="center" class="ListTableHeader" nowrap="nowrap"><b>岗位说明</b></th>
		</tr>
		<logic:iterate name="pageList" id="post" scope="request" >
		<bean:define name="post" toScope="request" id="postRquest"></bean:define>
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td   align="center"><input type="checkbox" name="itemIdCheckBox"  value="<bean:write name="post" property="postId"/>" >&nbsp;</td>
			<td >
			<a href="#" onclick="buttomOnClick('<%=baseURL%>/showPost_urss.do?postId=<bean:write name="post" property="postId"/>','self')" >
			  <bean:write name="post" property="postName"/>&nbsp;
			 </a>
			 </td>
			 <td>
			 <bean:write name="post" property="postMemo"/>&nbsp;
			 </td>

			  
		</tr>
		</logic:iterate>
	</table>
	<fe:root inputclass="formStyleall" formId="postListForm"/>
	</form>
</body>

</html>
