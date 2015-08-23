<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html >
<head>
<%@include file="/bsp/abdf/common.jsp"%>
<%@page import="java.util.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>

<style type="text/css">
		<!--
		#MOVE_Div {
		position: absolute;
		left: 5%;
		top: 10%;
		width: 120 px;
		height: 10 px;
		background-color: #FFFFFF;
		}
		 -->
	  </style>
</head>
<script>
  function disHiddenButton()
  {
      <logic:notEmpty name="pageList" scope="request">
      parent.document.getElementById("controlTree_move").style.display="";
      parent.document.getElementById("controlTree_del").style.display="";
      </logic:notEmpty>
      
       <logic:empty name="pageList" scope="request">
      parent.document.getElementById("controlTree_move").style.display="none";
      parent.document.getElementById("controlTree_del").style.display="none";
      </logic:empty>
  }
  
   function move()
    {
	  document.getElementById("MOVE_Div").style.display='';
    }
  
 function deleteOnLineHelper()
    {
       var editModel_gdcnTemp=editModel_gdcn;
	   editModel_gdcn=false;
       var formObj=document.getElementById("OnLineHelperForm");
	   var count=getCheckBoxNum("itemIdCheckBox");
       if(count <1)
       {
  		alert("请选择一条记录进行删除！");
        return ;
       }
        if(window.confirm("您确定要删除选中的记录吗？")){
            formObj.action="<%=baseURL%>/deleteOnLineHelper_abdf.do";
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
	var editModel_gdcnTemp=editModel_gdcn;
	   editModel_gdcn=false;
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
		   var formObj=document.getElementById("OnLineHelperForm");
		   formObj.action="<%=baseURL%>/moveOnLineHelper_abdf.do";
		   formObj.submit();
		}
	}
}
  
 
</script>
<fe:body>
<fe:topTable>
  <fe:powerTool funCode="abdf_onLine_help" groupName="list"/>
</fe:topTable>
  <fe:span>
    <form action="/saveOnLineHelper_abdf.do"   id="OnLineHelperForm" style="margin: 0">
	<TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
	    <thead>
		<tr>
			<td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllGrid(this,'itemIdCheckBox')"></td>
			
			<td align="center" ><font color="#000000">帮助索引名称</font></td>
			<td align="center" ><font color="#000000">帮助索引编号</font></td>
		</tr>
		</thead>
		<logic:notEmpty name="pageList" scope="request">
		<logic:iterate name="pageList" id="itemOnLineHelper" scope="request" >
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
		
			<td   align="center"><input type="checkbox" onclick="clearAllSelect(this,'itemIdCheckBox_all')" name="itemIdCheckBox"  value="<bean:write name="itemOnLineHelper" property="onLineHelperId"/>" ></td>
			
			<td >
			  <a href="#" onclick="buttomOnClick('<%=baseURL%>/showOnLineHelper_abdf.do?onLineHelperId=<bean:write name="itemOnLineHelper" property="onLineHelperId"/>','self')" >
			     <bean:write name="itemOnLineHelper" property="onLineHelperName"/>
			  </a>
			 </td>
			 <td >
			   <bean:write name="itemOnLineHelper" property="onLineHelperCode"/>
			  
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
	 </fe:span>
	 <fe:bottomTable>
	   <div align="center" ><strong>帮助顶层列表</strong></div>
	 </fe:bottomTable>
</fe:body>
 <script>
	  <%String reloadTree=(String)request.getAttribute("reloadTree");
	  if(reloadTree!=null&&reloadTree.equals("true"))
	  {
	     %>
	      
	       parent.parent.left.location="<%=baseURL%>/control_tree.jsp?treeType=<bean:write name="controlTreeRoot" property="treeType"/>";
	     <%
	  }
	  %>
	  	  
	  <logic:empty name="pageList" scope="request">
     var abdf_help_move = document.getElementById("abdf_help_move");
     if (abdf_help_move!=null) abdf_help_move.style.display = "none";
     
     var abdf_help_del = document.getElementById("abdf_help_del");
     if (abdf_help_del!=null) abdf_help_del.style.display = "none";
 </logic:empty>
 
	</script>
</html>
