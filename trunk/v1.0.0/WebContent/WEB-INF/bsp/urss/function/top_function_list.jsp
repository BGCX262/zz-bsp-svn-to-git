<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>
<%@include file="/bsp/abdf/common.jsp"%>
<style type="text/css">
		<!--
		#MOVE_Div {
		position: absolute;
		left: 20%;
		top: 15%;
		width: 300px;
		height: 165px;
		background-color: #FFFFFF;
		}
		 -->
	  </style>
</head>
<fe:body>
	
<script>
        function deleteFunction()
    {
       var count=getCheckBoxNum("itemIdCheckBox");
       if(count <1)
       {
  		alert("请选择一条子记录进行删除！");
        return ;
       }
        if(window.confirm("如果确定删除此数据\n\n 1:将联带删除所有子数据 \n 2:数据将不能恢复\n\n确定要删除选中的记录吗？")){
           document.getElementById("functionList").action="<%=baseURL%>/deleteFunction_urss.do";
           document.getElementById("functionList").submit();
        }
    }
    
      function move()
    {
	  document.getElementById("MOVE_Div").style.display='';
    }
    function closeMove()
   {
	document.getElementById("MOVE_Div").style.display='none'
   }
   function Move_OK()
{
	var mtdObj=document.getElementById("moveToDataId");
	if(mtdObj.value=='')
	{
		
		alert('请先在右边树中选择移入到的节点!');
		return;
	}
	else
	{
		if(getCheckBoxNum("itemIdCheckBox")==0)
		{
			
			alert('请选择要移动的数据!');
			return;
		}
		else
		{
		   var checkBoxObj=document.getElementsByName("itemIdCheckBox");
		   for(var i=0;i<checkBoxObj.length;i++)
		   {
		     if(checkBoxObj[i].checked)
		     {
			     if(checkBoxObj[i].value==mtdObj.value)
			     {
			        alert("选择移动的角色中不能移动到自己的平级或下级");
			        return;
			     }
			 }
		   }
		   
		   var formObj=document.getElementById("functionList");
		   formObj.action="<%=baseURL%>/moveFunction_urss.do";
		   formObj.submit();
		}
	}
	}
	function addFunction(obj){
	   buttomOnClickAdd(obj,'<%=baseURL%>/initFunction_urss.do?appId=<bean:write name="app" property="appId"/>','self');
	}

    
    </script>
    <logic:present name="app">
       <fe:topTable>
          <fe:powerTool funCode="urss_function" groupName="function_top"/>
		   
		 </fe:topTable>
     <fe:span>
	<TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
	 <form action="<%=baseURL%>/deleteFunction_urss.do" name="functionList"  id="functionList">
	
		 <thead>
		<tr> <input type="hidden" name="appId" value="<bean:write name="app" property="appId"/>"/>
			<td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></td>
			<td width="20%" align="center"  nowrap="nowrap"><b>功能名称</b></td>
			<td width="20%" align="center"  nowrap="nowrap"><b>功能编号</b></td>
			<td width="10%" align="center"  nowrap="nowrap"><b>是否公用</b></td>
		</tr>
		</thead>
		 
		<logic:iterate name="pageList" id="function" scope="request">
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td   align="center"><input type="checkbox"  name="itemIdCheckBox"  value="<bean:write name="function" property="funModuleId"/>" >&nbsp;</td>
			<td >
			<a href="#" onclick="buttomOnClick('<%=baseURL%>/showFunction_urss.do?funModuleId=<bean:write name="function" property="funModuleId"/>','self')" >
			  <bean:write name="function" property="funModuleName"/>&nbsp;
			 </a>
			 </td>
			  <td>
			   <bean:write name="function" property="funCode"/>&nbsp;
			  
			 </td>
			 
			 <td  >
			  <logic:equal name="function" property="isPublic" value="Y">是</logic:equal>
			  <logic:equal name="function" property="isPublic" value="N">否</logic:equal>&nbsp;
			 </td>
			 
			
		</tr>
		</logic:iterate>	
	</table>
	<DIV id='MOVE_Div' style='display:none'>
		<iframe src='' style='position:absolute; visibility:inherit; top:0px; left:0px; width:380px; height:220px; z-index:-1;' filter='progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)';></iframe>
		<TABLE width='380' align='center' border='1' cellSpacing='0' cellpadding='3' bordercolorlight='#E2D7CF' bordercolordark='#FAF8F6'>
			<TR>
				<TD align="center">
					<img src='<%=baseURL%>/bsp/abdf/skins/default/img/public/right.gif'>
					<br>
					请在左边树中选择移入到的节点
				</TD>
			</TR>
			<TR>
				<iframe style='display:none'></iframe>
				<TD height='21'>
					<div align='center'>
						<font color='#0000FF'>移到: <input type="hidden" name="moveToDataId" id="moveToDataId"> <input type="text" name="moveToDataName" size="30" value="" class="formStyleall" id="moveToDataName" readonly="true"> 之<input type='radio' checked name='upAndDown'
								value='down' />下级&nbsp;&nbsp;&nbsp;&nbsp;<input type='radio' name='upAndDown' value='equals' />平级 </font>
					</div>
				</TD>
			</TR>
			<TR>
				<iframe style='display:none'></iframe>
				<TD height='21'>
					<div align='center'>
						<input type='button' name='Submit' value='确定' class='Button3' onclick='Move_OK()'>
						<input type='button' name='Submit' value='关闭' class='Button3' onclick='closeMove()'>
					</div>
				</TD>
			</TR>
		</TABLE>
	</div>
	</form>
	</fe:span>
	<fe:bottomTable>(<bean:write name="app" property="appName"/>)功能列表</strong></fe:bottomTable>
	</logic:present>
	
</fe:body>
<script>
	  <%String reloadTree=(String)request.getAttribute("reloadTree");
	  if(reloadTree!=null&&reloadTree.equals("true"))
	  {
	     %>
	       parent.left.location="<%=baseURL%>/bsp/urss/function/function_tree.jsp?appId=<bean:write name="app" property="appId"/>&reloadMid=false";
	     <%
	  }
	  %>
	</script>
</html>
