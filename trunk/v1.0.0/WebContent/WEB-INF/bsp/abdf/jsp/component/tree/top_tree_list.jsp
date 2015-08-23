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
            formObj.action="<%=baseURL%>/deleteTreeNodeObject_abdf.do";
		   formObj.submit();
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
	var mtdObjParent=document.getElementById("moveToDataParentId");
	
	if(mtdObj.value=='')
	{
		
		alert('请先在右边树中选择移入到的<bean:write name="dictTreeType" property="treeTypeName"/>!');
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
		        
		        
			     if(checkBoxObj[i].value==mtdObj.value||mtdObjParent.value.indexOf(checkBoxObj[i].value)>=0)
			     {
			        alert("选择移动的<bean:write name="dictTreeType" property="treeTypeName"/>中不能移动到本身或者本身下级的平级或下级");
			        return;
			     }
			    
			 }
		   }
		   var formObj=document.getElementById("DictTreeForm");
		   formObj.action="<%=baseURL%>/moveTreeNode_abdf.do";
		   formObj.submit();
		}
	}
}
  
  
</script>
<fe:body>
<form id="DictTreeForm" action="<%=baseURL%>/listTopNodeObjectByType_abdf.do" method="post" name="DictTreeForm">
<fe:topTable> 
         <input type='button' name='power_button'  value='新增'  class='Button3'  onclick="buttomOnClickAdd(this,'<%=baseURL%>//initTreeNodeObject_abdf.do?treeType=<bean:write name="dictTreeType" property="treeTypeCode"/>','self')" id='dictionary_add'>&nbsp;&nbsp;
      <logic:notEmpty name="pageList" scope="request">
      <input type='button' name='power_button'  value='移动'   class='Button3'  onclick="move()" >&nbsp;&nbsp;
      <input type='button' name='pow{er_button'  value='删除'   class='Button3'  onclick="deleteDictTree()" id='dictionary_del'>&nbsp;&nbsp;
    </logic:notEmpty>
   </fe:topTable> 
   



 
  
  <fe:span>
	<TABLE  cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
	<thead>
	<tr>
		<input type="hidden" name="treeType" value="<bean:write name="dictTreeType" property="treeTypeCode"/>" id="treeType">
		
		  	<input type="hidden" name="treeTypeCode" id="treeTypeCode" value="<bean:write name="dictTreeType" property="treeTypeCode"/>"> 
			<td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></td>
		<td align="center" ><font color="#000000"><b><bean:write name="dictTreeType" property="treeTypeName"/>名称</b></font></td>
			</tr>
	</thead>	
			
			<logic:notEmpty name="pageList" scope="request">
		<logic:iterate name="pageList" id="itemTree" scope="request" >
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
		
			<td   align="center"><input type="checkbox"  name="itemIdCheckBox"  value="<bean:write name="itemTree" property="id"/>" ></td>
			
			<td  >
			     <A href = "<%=baseURL %>/showTreeNodeObject_abdf.do?id=<bean:write name="itemTree" property="id"/>&treeTypeCode=<bean:write name="dictTreeType" property="treeTypeCode"/>"><bean:write name="itemTree" property="name"/> </A>
			 </td>
		</tr>
		</logic:iterate>
		</logic:notEmpty>
	</table>
  </fe:span>
  
	
	
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
						<input type="hidden" name="moveToDataParentId" id="moveToDataParentId"> 
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
		<fe:bottomTable><fe:root inputclass="formStyleall" formId="DictTreeForm"/></fe:bottomTable>
		</form>
</fe:body>
 <script>
		  <%String reloadTree=(String)request.getAttribute("reloadTree");
	  if(reloadTree!=null&&reloadTree.equals("true"))
	  {
	     %>
	      
	       parent.left.location="<%=baseURL%>/forwardSyncTree_abdf.do?treeType=<bean:write name="dictTreeType" property="treeTypeCode" />";
	     <%
	  }
	  %>
	</script>
</html>
