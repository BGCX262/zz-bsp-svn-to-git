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
<body>
<script>
        function deleteCoopArea()
    {
       var count=getCheckBoxNum("itemIdCheckBox");
       if(count <1)
       {
  		alert("请选择一条子记录进行删除！");
        return ;
       }
        if(window.confirm("您确定要删除选中的记录吗？")){
           document.getElementById("coopAreaList").action="<%=baseURL%>/deleteCoopArea.do";
           document.getElementById("coopAreaList").submit();
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
		   
		   var formObj=document.getElementById("coopAreaList");
		   formObj.action="<%=baseURL%>/moveCoopArea.do";
		   formObj.submit();
		}
	}
}
    
    </script>
   <table  <%=tableStyle%> width="100%">
  
    <tr  class=ListTableRow >
      <td colspan="4">
      <input type='button' name='power_button'  value='新增'  class='Button3'  onclick="buttomOnClickAdd(this,'<%=baseURL%>/initCoopArea.do','self')" id='coopArea_add'>&nbsp;&nbsp;
      <logic:present name="pageList">
      <logic:notEmpty name="pageList">
       <input type='button' name='power_button'  value='删除'   class='Button3'  onclick="deleteCoopArea()" id='RegCompany_del'>&nbsp;&nbsp;
       <input type='button' name='power_button'  value='移动'   class='Button3'  onclick="move()" id='CoopAreaEdit_move'>&nbsp;&nbsp;         
     </logic:notEmpty>
     </logic:present>
     </td>
    </tr>
    </table>
	<TABLE width="100%" <%=tableStyle%> align="center">
	 <form action="<%=baseURL%>/deleteCoopArea.do" name="coopAreaList"  id="coopAreaList">
		<tr>
			<th align="center" class="ListTableHeader" width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></th>
			<th width="75%" align="center" class="ListTableHeader" nowrap="nowrap"><b>协同功能名称</b></th>
			<th width="20%" align="center" class="ListTableHeader" nowrap="nowrap"><b>是否公用</b></th>
		</tr>
		<logic:iterate name="pageList" id="coopArea" scope="request">
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td   align="center"><input type="checkbox"  name="itemIdCheckBox"  value="<bean:write name="coopArea" property="coopAreaId"/>" >&nbsp;</td>
			<td >
			<a href="#" onclick="buttomOnClick('<%=baseURL%>/showCoopArea.do?coopAreaId=<bean:write name="coopArea" property="coopAreaId"/>','self')" >
			  <bean:write name="coopArea" property="coopAreaName"/>&nbsp;
			 </a>
			 </td>
			 <td  >
			  <logic:equal name="coopArea" property="isDynamic" value="Y">是</logic:equal>
			  <logic:equal name="coopArea" property="isDynamic" value="N">否</logic:equal>
			 &nbsp;</td>
			 
			
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
</body>
<script>
	  <%String reloadTree=(String)request.getAttribute("reloadTree");
	  if(reloadTree!=null&&reloadTree.equals("true"))
	  {
	     %>
	       parent.left.location="<%=baseURL%>/bsp/urss/coop_area/coop_area_tree.jsp?reloadMid=false";
	     <%
	  }
	  %>
	</script>
</html>
