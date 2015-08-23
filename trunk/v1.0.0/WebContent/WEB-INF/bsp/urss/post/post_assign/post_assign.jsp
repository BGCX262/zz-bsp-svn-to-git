<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
    <SCRIPT>
       function selectPost()
       {
          var returnValue=showModalDialog('<%=baseURL%>/forwardPostSelectFrame_urss.do', window,'dialogHeight:500px;dialogWidth:650px;status=off');
          if(returnValue!=null&&returnValue!="")
          {
             document.getElementById("allPostId").value=returnValue;
             document.getElementById("postAssign").action="<%=baseURL%>/savePostAssign_urss.do";
             document.getElementById("postAssign").submit();
          }
       }
       function deletePost()
       {
            if(getCheckBoxNum("itemIdCheckBox")==0)
            {
               alert("请选择一个以导入的岗位进行移出!");
               return;
            }
            document.getElementById("postAssign").action="<%=baseURL%>/deletePostAssign_urss.do";
            document.getElementById("postAssign").submit();
       }
    </SCRIPT>
   
	</head>
	<html>
	<body>
	<table <%=tableStyle%> width="100%">
	<form action="<%=baseURL%>/savePostAssign_urss.do" method="post" id="postAssign">
			<tr class="ListTableHeader">
				<td colspan="4">
					<div align="center">
							<strong>
							为<bean:write name="org" property="orgName"/>分配岗位
							<input name="orgId" id="orgId" value="<bean:write name="org" property="orgId"/>" type="hidden"/>
							<input name="allPostId" id="allPostId" value="" type="hidden"/>
                             </strong>
					</div>
				</td>
			</tr>
			<tr class=ListTableRow>
				<td colspan="4">
					<input type='button' name='power_button'  value='导入岗位'   class='Button3'  onclick="selectPost()" id='OrgEdit_SAVE'>&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='移出岗位'   class='Button3'  onclick="deletePost()" id='OrgEdit_SAVE'>&nbsp;&nbsp;  
                </td>
			</tr>
	</table>
	<table width="100%" <%=tableStyle%>>
		<tr>
			<th align="center" class="ListTableHeader" width="15%">操作</th>
			<th width="85%" align="center" class="ListTableHeader" nowrap="nowrap"><b>岗位名称</b></th>
			
		</tr>
		<logic:iterate name="postAssignList" id="postAssign" scope="request" >
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td   align="center"><input type="checkbox" name="itemIdCheckBox"  value="<bean:write name="postAssign" property="assignId"/>" postId="<bean:write name="postAssign" property="postId"/>" postName="<bean:write name="postAssign" property="postName"/>">&nbsp;</td>
			<td >
			<a href="#" onclick="buttomOnClick('<%=baseURL%>/showPostOrg_urss.do?assignId=<bean:write name="postAssign" property="assignId"/>&orgId=<bean:write name="org" property="orgId"/>','self')" >
			  <bean:write name="postAssign" property="postName"/>&nbsp;
			 </a>
			 </td>  
		</tr>
		</logic:iterate>
	</table>
	</form>
	</body>
	
</html>


