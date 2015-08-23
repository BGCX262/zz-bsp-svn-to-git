<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>
<%@include file="/bsp/abdf/common.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<link rel="StyleSheet" type="text/css" href="<%=baseURL%>/css/grid.css">
<link rel="StyleSheet" type="text/css" href="<%=baseURL%>/css/public.css">
<style type="text/css">
		<!--
		#MOVE_Div {
		position: absolute;
		left: 50%;
		top: 10%;
		width: 120 px;
		height: 10 px;
		background-color: #FFFFFF;
		}
		 -->
	  </style>
</head>
<script>

   function move()
    {
	  document.getElementById("MOVE_Div").style.display='';
    }
  
 function deleteDictTree()
    {
     var editModel_fireeagleTemp=editModel_fireeagle;
	   editModel_fireeagle=false;
       var formObj=document.getElementById("DictTreeForm");
	   var count=getCheckBoxNum("itemIdCheckBox");
       if(count <1)
       {
  		alert("请选择一条记录进行删除！");
        return ;
       }
        if(window.confirm("您确定要删除选中的记录吗？")){
            formObj.action="<%=baseURL%>/deleteDictTree_abdf.do";
		   formObj.submit();
        }
    }
    function closeMove()
   {
	document.getElementById("MOVE_Div").style.display='none'
   }
   function Move_OK()
{
	var mtdObj=document.getElementById("moveToDataId");
	var moveToDataAllIdValue=document.getElementById("moveToDataAllId").value;
	var editModel_fireeagleTemp=editModel_fireeagle;
	   editModel_fireeagle=false;
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
		  var checkBoxObj=document.getElementsByName("itemIdCheckBox");
		   for(var i=0;i<checkBoxObj.length;i++)
		   {
		     if(checkBoxObj[i].checked)
		     {
			     if(checkBoxObj[i].value==mtdObj.value)
			     {
			        alert("选择移动的数据中不能移动到自己的平级或下级");
			        return;
			     }
			      if(moveToDataAllIdValue.indexOf(checkBoxObj[i].value)>=0)
			     {
			        alert("选择移动的数据中不能移动到自己子的平级或下级");
			        return;
			     }
			 }
		   }
		   var formObj=document.getElementById("DictTreeForm");
		   formObj.action="<%=baseURL%>/moveDictTree_abdf.do";
		   formObj.submit();
		}
	}
}
  
  
</script>
<body>
<form id="DictTreeForm" action="" method="post" name="DictTreeForm">
 <table  <%=tableStyle%> width="100%">
    <tr class="ListTableHeader">
      <td colspan="4" ><div align="center" ><strong><bean:write name="dictTreeRoot" property="treeName"/>顶层列表</strong></div></td>
    </tr>
    <tr  class=ListTableRow >
      <td colspan="4">
     
      <input type='button' name='power_button'  value='新增'  class='Button3'  onclick="buttomOnClickAdd(this,'<%=baseURL%>/initDictTree_abdf.do?treeType=<bean:write name="dictTreeRoot" property="treeType"/>','self')" id='dictionary_add'>&nbsp;&nbsp;
      <logic:notEmpty name="pageList" scope="request">
      <input type='button' name='power_button'  value='移动'   class='Button3'  onclick="move()" id='dictionary_del'>&nbsp;&nbsp;

      <input type='button' name='pow{er_button'  value='删除'   class='Button3'  onclick="deleteDictTree()" id='dictionary_del'>&nbsp;&nbsp;
 </logic:notEmpty>
     
     </td>
    </tr>
    </table>


 
  
  <TABLE width="100%" <%=tableStyle%> align="center">
		<tr>
		
		  	<html:hidden name="dictTreeRoot" property="treeType" styleId="treeType" />
			<td align="center" class="ListTableHeader" width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></td>
		<td align="center" class="ListTableHeader"><font color="#000000"><b><bean:write name="dictTreeRoot" property="treeName"/>名称</b></font></td>
			</tr>
			
			
			<logic:notEmpty name="pageList" scope="request">
		<logic:iterate name="pageList" id="itemDictTree" scope="request" >
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
		
			<td   align="center"><input type="checkbox" onclick="clearAllSelect(this,'itemIdCheckBox_all')" name="itemIdCheckBox"  value="<bean:write name="itemDictTree" property="treeId"/>" ></td>
			
			<td  >
			  <a href="#" onclick="buttomOnClick('<%=baseURL%>/showDictTree_abdf.do?treeType=<bean:write name="itemDictTree" property="treeType"/>&treeId=<bean:write name="itemDictTree" property="treeId"/>','self')" >
			     <bean:write name="itemDictTree" property="treeName"/>
			  </a>
			 </td>
		</tr>
		</logic:iterate>
		</logic:notEmpty>
	</table>
  
  
	
	
	 <DIV id='MOVE_Div' style='display:none' >
		<TABLE width='10' align='center' border='1' cellSpacing='0' cellpadding='3' bordercolorlight='#E2D7CF' bordercolordark='#FAF8F6'>
			<TR>
				<TD align="center">
					请在左边树中选择移入到的节点
				</TD>
			</TR>
			<TR>
				
				<TD >
					<div align='center'>
						<font color='#0000FF'>移到 <input type="hidden" name="moveToDataId" id="moveToDataId"> 
						<input type="hidden" name="moveToDataAllId" id="moveToDataAllId"> 
						<input type="text" name="moveToDataName" size="30" value="" class="formStyleall" id="moveToDataName" readonly="true"> 之<input type='radio' checked name='upAndDown'
								value='down' />下级&nbsp;&nbsp;&nbsp;&nbsp;<input type='radio' name='upAndDown' value='equals' />平级 </font>
					</div>
				</TD>
			</TR>
			<TR>
				
				<TD >
					<div align='center'>
						<input type='button' name='Submit' value='确定' class='Button3' onclick='Move_OK()'>
						<input type='button' name='Submit' value='关闭' class='Button3' onclick='closeMove()'>
					</div>
				</TD>
			</TR>
		</TABLE>
		</div>
		</form>
	 </form>
</body>
 <script>
	  <%String reloadTree=(String)request.getAttribute("reloadTree");
	  if(reloadTree!=null&&reloadTree.equals("true"))
	  {
	     %>
	      
	       parent.parent.left.location="<%=baseURL%>/forwardControlTree_abdf.do?treeType=<bean:write name="dictTreeRoot" property="treeType"/>";
	     <%
	  }
	  %>
	</script>
</html>
