<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
	<head>
    <%@include file="/bsp/abdf/common.jsp"%>
    	
   
	</head><script>
function displayUserPage()
{
     location.href="<%=baseURL%>/listPageUserByOrgId_urss.do?orgId=<%=(String)request.getAttribute("orgId")%>";
     
}

function addUser()
{
   var checkedObjs=document.getElementsByName("itemIdCheckBox");
   var num=0;
   var str="";
   for(var i=0;i<checkedObjs.length;i++)
   {
      var checkedObj=checkedObjs[i];
      if(checkedObj.checked)
      {
        str=str+"orgId="+checkedObj.value+"&"
         num=num+1;
          for(var j=i+1;j<checkedObjs.length;j++)
         {
	         var checkedObjComp=checkedObjs[j];
	         if(checkedObjComp.checked)
	         {
		         if(checkedObjComp.getAttribute("orgName")!=checkedObj.getAttribute("orgName"))
		         {
		            alert("用户名不相同，不能新建多重身份用户");
		            return;
		         }
		     }
        }
      }
     
   }
   if(num<=0)
   {
      alert("请选择一条或多条记录进行新增！")
      return;
   }
   location.href="<%=baseURL%>/initUser_urss.do?"+str;
   
}
</script>
	<fe:body>
	<fe:topTable>
          <fe:powerTool funCode="urss_use_mrg" groupName="un_edit" />
		 </fe:topTable>
		 
	<fe:span >
	     <br />
		<center>
			<font size=4><b><bean:write name="org" property="orgName"/>/用户管理</font>
		</center>
		<br />
  <form action="<%=baseURL%>/listPageUnUserByOrgId_urss.do" id="UserListForm" method="post" name="UserListForm" style="margin: 0">
	<table border="0" width="96%" align="center">
	<tr>
		<td>
		<div class="tab-pane" id="tabPane1"><script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
		<div class="tab-page" id="tabPage2">
		<h2 class="tab">未定义用户</h2>
		<script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
	     <TABLE cellspacing="0" cellpadding="3" width="96%" class="tlist" align="center">
	       <thead>
			<tr>
				<th align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></th>
				<th width="70%" align="center"  nowrap="nowrap"><b>所属组织</b></th>
				<th width="20%" align="center"  nowrap="nowrap"><b>用户名</b></th>
				
			</tr>
			 </thead>
		<logic:iterate name="pageList" id="org" scope="request" >
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td   align="center"><input type="checkbox" name="itemIdCheckBox"  value="<bean:write name="org" property="orgId"/>" orgName="<bean:write name="org" property="orgName"/>" >&nbsp;</td>
			<td >
			<a href="#" title="点击新增用户" onclick="buttomOnClick('<%=baseURL%>/initUser_urss.do?orgId=<bean:write name="org" property="orgId"/>','self')" >
			  <bean:write name="org" property="allParentName"/>&nbsp;
			 </a>
			 </td>
			 <td>
			 <bean:write name="org" property="orgName"/>&nbsp;
			 </td>
		</tr>
		</logic:iterate>
		
	</table>
	
	
		</div>
		</div>
		</td>
	</tr>
</table>

</fe:span>	 
<fe:bottomTable><fe:root inputclass="formStyleall" formId="UserListForm"/></fe:bottomTable>
</form>
</fe:body>
</html>


