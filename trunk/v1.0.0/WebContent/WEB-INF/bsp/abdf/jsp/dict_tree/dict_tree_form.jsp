<%@ page contentType="text/html;charset=utf-8" language="java"%>
<%@include file="/bsp/abdf/common.jsp"%>
<%@page import="java.util.*"%>
<html>
	<head>
		
		<style type="text/css">
		<!--
		#MOVE_Div {
		position: absolute;
		left: 30%;
		top: 10%;
		width: 120 px;
		height: 10 px;
		background-color: #FFFFFF;
		}
		 -->
	  </style>
	</head>
	<fe:body formId="DictTreeForm" moduleName="abdf">
	<script type="text/javascript" language="javascript">
	 
	
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
	
	  function equalAdd()
    {
      
        var parentId=document.getElementById("parentId").value;
         location.href="<%=baseURL%>/initDictTree_abdf.do?treeType=<bean:write name="dictTreeRoot" property="treeType"/>&parentId="+parentId;
    }
     function downAdd()
    {
       
        var treeId=document.getElementById("treeId").value;
        location.href="<%=baseURL%>/initDictTree_abdf.do?treeType=<bean:write name="dictTreeRoot" property="treeType"/>&parentId="+treeId;
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
	<table <%=tableStyle%> width="100%">
			
			<tr class=ListTableRow>
				<td colspan="4">
				
					<input type='button' name='power_button'  value='保存'   class='Button3'  onclick="submitForm(this,'DictTreeForm',0,'abdf')" id='dict_save'>&nbsp;&nbsp;
                      <logic:notEmpty name="subDictTreeList" scope="request">
                    <input type='button' name='power_button'  value='移动'   class='Button3'  onclick="move()" id='dict_save'>&nbsp;&nbsp;
                    <input type='button' name='power_button'  value='删除'   class='Button3'  onclick="deleteDictTree()" id='dict_save'>&nbsp;&nbsp;
                    </logic:notEmpty>
                     <logic:notEmpty name="DictTreeForm" property="treeId">
                      <input type='button' name='power_button'  value='平级新增'   class='Button3'  onclick="equalAdd()" id='dict_save'>&nbsp;&nbsp;
                      <input type='button' name='power_button'  value='新增下级'   class='Button3'  onclick="downAdd()" id='dict_save'>&nbsp;&nbsp;
                     </logic:notEmpty>
                

                  <input type='button' name='power_button'  value='返回列表'   class='Button3'  onclick="dictTree_list()" id='dict_save'>&nbsp;&nbsp;
                   </td>
			</tr>
	</table>
	<br/>
         <center><font size=4><b>
         <logic:notEmpty name="DictTreeForm" property="treeId">修改<bean:write name="dictTreeRoot" property="treeName"/></logic:notEmpty> 
        <logic:empty name="DictTreeForm" property="treeId">新增<bean:write name="dictTreeRoot" property="treeName"/></logic:empty> 
         </b></font> </center>
    <br /> 
	<html:form action="/saveDictTree_abdf.do"   styleId="DictTreeForm">
		<table border="0" width="96%" align="center">
			<tr>
				<td>
					<div class="tab-pane" id="tabPane1">
						<script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
						<div class="tab-page" id="tabPage2">
							<h2 class="tab">
								基本属性
							</h2>
							<script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
							<table width="100%" <%=tableStyle%>>
								
								<tr >
									<td width="16%" class="edit_td">
										所属父名称：
									</td>
									<td width="29%" colspan="3">
										<html:hidden name="DictTreeForm" property="treeId" styleId="treeId" />
										<html:hidden name="DictTreeForm" property="parentId" styleId="parentId" />
										<html:hidden name="DictTreeForm" property="treeType" styleId="treeType" />
										<html:hidden name="DictTreeForm" property="allParentId" styleId="allParentId" />
										
										<html:text name="DictTreeForm" property="allParentName" styleId="allParentName"  styleClass="formStyleall" size="60" readonly="true"/>
										
									</td>
									
								</tr>
								
								<tr >
									<td width="20%" class="edit_td">
										<font color='red'><span id="treeName_span"><bean:write name="dictTreeRoot" property="treeName"/>名称：</span></font>
									</td>
									<td width="35%">
									    
									    <input type="hidden" name="dictTreeNameOld" value="<bean:write name="DictTreeForm" property="treeName"/>" id="dictTreeNameOld">
										<html:text name="DictTreeForm" property="treeName" styleId="treeName"  styleClass="formStyleall" size="30"  />
										
									</td>
									
									<td width="20%" class="edit_td">
										<span id="orderShow_span">排序号：</span>
									</td>
									<td width="35%">
									 
									  <input type="hidden" name="orderShowOld" value="<bean:write name="DictTreeForm" property="orderShow" format="0.00"/>" id="orderShowOld">
										<html:text name="DictTreeForm" property="orderShow" styleId="orderShow" size="4"  styleClass="formStyleall"/>
										
									</td>
									
								</tr>
							</table>
						
					<table <%=tableStyle%> width="100%">
						<tr >
							<td width='5%' align='center' class='ListTableHeader'>
								<b><font color='#000000'><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllGrid(this,'itemIdCheckBox')"></font></b>
							</td>
							<td width='60%' align='center' class='ListTableHeader'>
								<b><font color='#000000'>所属父名称</font></b>
							</td>
							<td width='35%' align='center' class='ListTableHeader'>
								<b><font color='#000000'><bean:write name="dictTreeRoot" property="treeName"/>名称</font></b>
							</td>
						</tr>	
						
						<logic:notEmpty name="subDictTreeList" scope="request">
		    <logic:iterate name="subDictTreeList" id="itemDictTree" scope="request" >
		   <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
		
			<td class="grid_head"  align="center"><input type="checkbox" onclick="clearAllSelect(this,'itemIdCheckBox_all')" name="itemIdCheckBox"  value="<bean:write name="itemDictTree" property="treeId"/>" ></td>
			<td class="BodyData" >
			    <bean:write name="itemDictTree" property="allParentName"/>
			 </td>

			<td class="BodyData" >
			  <a href="#" onclick="buttomOnClick('<%=baseURL%>/forwardControlTreeForm_abdf.do?treeType=<bean:write name="itemDictTree" property="treeType"/>&treeId=<bean:write name="itemDictTree" property="treeId"/>','parent')" >
			     <bean:write name="itemDictTree" property="treeName"/>
			  </a>
			 </td>
		</tr>
		</logic:iterate>
		</logic:notEmpty>
		
					</table>
						</div>
					</div>
			</td>
		   </tr>
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
		</html:form>
	</fe:body>
    <script>
	  <%String reloadTree=(String)request.getAttribute("reloadTree");
	  if(reloadTree!=null&&reloadTree.equals("true"))
	  {
	     %>
	      
	      parent.left.location="<%=baseURL%>/forwardDictTree_abdf.do?treeType=<bean:write name="dictTreeRoot" property="treeType"/>";
	     <%
	  }
	  %>
	</script>


</HTML>
