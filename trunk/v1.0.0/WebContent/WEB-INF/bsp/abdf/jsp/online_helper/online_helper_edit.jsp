<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
	<fe:body formId="OnLineHelperForm" moduleName="abdf">
	<script type="text/javascript" language="javascript">
	 
	
	 function deleteOnLineHelper()
    {
       
       var formObj=document.getElementById("OnLineHelperForm");
	   var count=getCheckBoxNum("itemIdCheckBox");
       if(count <1)
       {
  		alert("请选择一条记录进行删除！");
        return ;
       }
        if(window.confirm("您确定要删除选中的记录吗？")){
             var editModel_fireeagleTemp=editModel_fireeagle;
	   editModel_fireeagle=false;
            formObj.action="<%=baseURL%>/deleteOnLineHelper_abdf.do";
		   formObj.submit();
        }
    }
    
    function deleteAttach()
    {
     
       var formObj=document.getElementById("OnLineHelperForm");
	   var count=getCheckBoxNum("itemIdFileCheckBox");
       if(count <1)
       {
  		alert("请选择一条附件记录进行删除！");
        return ;
       }
        if(window.confirm("您确定要删除选中的附件吗？")){
         var editModel_fireeagleTemp=editModel_fireeagle;
	   editModel_fireeagle=false;
            formObj.action="<%=baseURL%>/deleteAttachHelp_abdf.do";
		   formObj.submit();
        }
    }
    
    
	
	  function equalAdd()
    {
      
        var parentId=document.getElementById("parentId").value;
        
         location.href="<%=baseURL%>/initOnLineHelper_abdf.do?parentId="+parentId;
        
    }
     function downAdd()
    {
       
        var onLineHelperId=document.getElementById("onLineHelperId").value;
        if (onLineHelperId!="") {
        location.href="<%=baseURL%>/initOnLineHelper_abdf.do?parentId="+onLineHelperId;
        }
        else {
           alert("不能新增下级");
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
		   var formObj=document.getElementById("OnLineHelperForm");
		   formObj.action="<%=baseURL%>/moveOnLineHelper_abdf.do";
		   formObj.submit();
		}
	}
}

var fileIndex = 0;
	function addFile() 
	{
		fileIndex++;
	    var spanId = "filespan";
	    var fileId = "uploadFile(" +fileIndex+ ")";
	    addInputFile(spanId, fileId,fileIndex);
	}
	function addInputFile(spanId, fileId,index) 
	{
    	var span = document.getElementById(spanId);
    	if (span != null) 
    	{
        	var divObj = document.createElement("div");
        	var fileObj, delObj;
        	divObj.id = fileId;

           	fileObj = document.createElement("<input type=file size=\"80\" style=\"height: 22\" >");
           	delObj = document.createElement("<input type=button onclick=delInputFile('" + spanId + "','" + fileId + "') class=button>");
        	fileObj.name = fileId;
        	fileObj.size = "80";
        	//设置显示风格,input暂时未定义
        	fileObj.className = "input";
        	delObj.value ='删除';
        	divObj.appendChild(document.createTextNode("文件: "));
        	//divObj.appendChild(textObj);
        	divObj.appendChild(document.createTextNode(" "));
        	divObj.appendChild(fileObj);
        	divObj.appendChild(document.createTextNode(" "));
        	divObj.appendChild(delObj);
        	span.appendChild(divObj);
    	}
	}
	 function delInputFile(spanId, fileId) 
	{
    	var span = document.getElementById(spanId);
    	var divObj = document.getElementById(fileId);
    	if (span != null && divObj != null) 
    	{
        	span.removeChild(divObj);
    	}
	}


	</script>
	<fe:topTable>
	  <fe:powerTool funCode="abdf_onLine_help" groupName="edit"/>
	</fe:topTable>
	<fe:span>
	<br/>
         <center><font size=4><b>
        在线帮助管理
         </b></font> </center>
    <br /> 
	<html:form action="/saveOnLineHelper_abdf.do"   styleId="OnLineHelperForm"  enctype="multipart/form-data">
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
							<table cellspacing="0" cellpadding="3" width="96%" class="tform" align="center">
								
								<tr >
									<td width="16%" class="edit_td">
										所属父名称：
									</td>
									<td width="29%" colspan="3">
										<html:hidden name="OnLineHelperForm" property="onLineHelperId" styleId="onLineHelperId" />
										<html:hidden name="OnLineHelperForm" property="parentId" styleId="parentId" />
										
										<html:hidden name="OnLineHelperForm" property="allParentId" styleId="allParentId" />
										
										<html:text name="OnLineHelperForm"  styleClass="formStyleall" property="allParentName" styleId="allParentName"  size="60" readonly="true"/>
										
									</td>
									
								</tr>
								
								<tr >
									<td width="20%" >
										<span id="onLineHelperName_span">帮助索引名称：</span>
									</td>
									<td width="35%">
									    
									    <input type="hidden" name="onLineHelperNameOld" value="<bean:write name="OnLineHelperForm" property="onLineHelperName"/>" id="onLineHelperNameOld">
										<html:text name="OnLineHelperForm"  styleClass="formStyleall" property="onLineHelperName" styleId="onLineHelperName" size="30"  />
										
									</td>
									
									<td width="20%" >
										帮助索引编号：
									</td>
									<td width="35%">
									 <html:text name="OnLineHelperForm"  styleClass="formStyleall" property="onLineHelperCode" styleId="onLineHelperCode" size="30"  />
										
									</td>
									
								</tr>
								
								<tr >
									
									
									<td width="20%" >
										排序号：
									</td>
									<td width="35%" colspan="3">
									 
									  <input type="hidden" name="orderShowOld" value="<bean:write name="OnLineHelperForm" property="orderShow" format="0.00"/>" id="orderShowOld">
										<html:text name="OnLineHelperForm" styleClass="formStyleall" property="orderShow" styleId="orderShow" size="4"  />
										
									</td>
									
								</tr>
							</table>
							<br><br>
							
							<fieldset style='width:100%'><legend>附件</legend>
	     <div>
	     	<iframe id="attacheFrame" name="attacheFrame" style="display: none;"></iframe>
	     <table width="100%" <%=tableStyle%> >
				<tr>
				  <td nowrap id="filespan">文件:&nbsp;<input name="uploadFile(0)" type="file" size="80" style="height: 22"/>
			      <input name="button" type="button" onclick="addFile()" class="button" value="增加" /></td>
			  </tr>
			</table>			
	      <TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
	      <thead>
		<tr>
		
			<td align="center"  width="5%">选择</td>
			<td width="45%" align="center"  nowrap="nowrap"><b>文件名</b></td>
			<td width="7%" align="center"  nowrap="nowrap"><b>上传人</b></td>
			<td width="16%" align="center"  nowrap="nowrap"><b>上传时间</b></td>
			
			<td width="10%" align="center"  nowrap="nowrap"><b>大小(K)</b></td>
		</tr>
		  </thead>
		<logic:present name="attachListData">
		<logic:iterate name="attachListData" id="attach" scope="request"> 
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td   align="center"><input type="checkbox"  name="itemIdFileCheckBox"  value="<bean:write name="attach" property="attachId"/>" >&nbsp;</td>
			<td >
			<A href="<%=request.getContextPath()%>/downloadFile_abdf.do?attachId=<bean:write name="attach" property="attachId"/>" target="attacheFrame"><bean:write name="attach" property="oriFileName"/></a>
			 </td>
			 
			  <td >
			    <bean:write name="attach" property="createName"/>
			 </td>
			  <td >
			   <bean:write name="attach" property="createTime" format="yyyy-MM-dd HH:mm"/>
			 </td>
			 
			<td >
			    <bean:write name="attach" property="fileSize" format="0.0"/>
			 </td>
			
		</tr>
		</logic:iterate>
		</logic:present>
		
	</table>
	     </div>
    </fieldset>
    <br>
    <br>
							<fieldset style='width:100%'><legend>直属子帮助</legend>
					<table cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
					  <thead>
						<tr >
							<td width='5%' align='center' >
								<b><font color='#000000'>选择</font></b>
							</td>
							
							<td width='35%' align='center' >
								<b><font color='#000000'>帮助索引名称</font></b>
							</td>
							<td width='35%' align='center' >
								<b><font color='#000000'>帮助索引编号</font></b>
							</td>
						</tr>	
						 </thead>
						<logic:notEmpty name="subOnLineHelperList" scope="request">
		    <logic:iterate name="subOnLineHelperList" id="itemOnLineHelper" scope="request" >
		   <tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
		
			<td class="grid_head"  align="center"><input type="checkbox"  name="itemIdCheckBox"  value="<bean:write name="itemOnLineHelper" property="onLineHelperId"/>" ></td>
			<td class="BodyData" >
			    <a href="#" onclick="buttomOnClick('<%=baseURL%>/showOnLineHelper_abdf.do?onLineHelperId=<bean:write name="itemOnLineHelper" property="onLineHelperId"/>','self')" >
			     <bean:write name="itemOnLineHelper" property="onLineHelperName"/>
			  </a>
			 </td>

			<td class="BodyData" >
			  <bean:write name="itemOnLineHelper" property="onLineHelperCode"/>
			 
			 </td>
		</tr>
		</logic:iterate>
		</logic:notEmpty>
		
					</table>
					</fieldset>
						</div>
						
						
						
						<div class="tab-page" id="tabPage3">
							<h2 class="tab">
								HTML内容
							</h2>
							<script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage3" ) );</script>
							<table width="96%" align="center" bordercolorlight="#95A4B2" bordercolordark="#FFFFFF" bordercolor="#D7D7D7" border="1" cellspacing="0">
								
								<tr >
									<td width="100%" >
									<html:textarea name="OnLineHelperForm" property="htmlContent" styleId="htmlContent" style="width=100%" rows="25"></html:textarea>
								</td>
									
								</tr>
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

		</fe:span>
		<fe:bottomTable>
		 <logic:notEmpty name="OnLineHelperForm" property="onLineHelperId">修改帮助</logic:notEmpty> 
        <logic:empty name="OnLineHelperForm" property="onLineHelperId">新增帮助</logic:empty> 
		</fe:bottomTable>
		</fe:body>	
    <script>
	  <%String reloadTree=(String)request.getAttribute("reloadTree");
	  if(reloadTree!=null&&reloadTree.equals("true"))
	  {
	     %>
	      
	       parent.left.location="<%=baseURL%>/forwardOnlineHelperTree_abdf";
	     <%
	  }
	  %>
	 
	</script>


</HTML>
