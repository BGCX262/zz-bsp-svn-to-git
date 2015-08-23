<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
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
    <script>
    function equalAdd()
    {
        var allParentId=document.getElementById("allParentId").value;
        var parentId=document.getElementById("parentId").value;
        
       
         
        location.href="<%=baseURL%>/initOrg_urss.do?parentId="+parentId;
        
         //document.getElementById("OrgEdit").action="<%=baseURL%>/initOrg.do";
        //document.getElementById("OrgEdit").submit();
        
    }
     function downAdd()
    {
        var allParentId=document.getElementById("allParentId").value;
        var parentId=document.getElementById("parentId").value;
        var orgNameOld=document.getElementById("orgNameOld").value;
        var orgId=document.getElementById("orgId").value;
        var allParentCode=document.getElementById("allParentCode").value;
        var orgTypeCodeOld=document.getElementById("orgTypeCodeOld").value;
        if(allParentId=="")
        {
           allParentId=orgId;
        }
        else
        {
           allParentId=allParentId+":"+orgId;
        }
        
         if(allParentCode=="")
        {
           allParentCode=orgTypeCodeOld;
        }
        else
        {
           allParentCode=allParentCode+":"+orgTypeCodeOld;
        }
        
        var allParentName=document.getElementById("allParentName").value;
         if(allParentName=="")
        {
           allParentName=orgNameOld;
        }
        else
        {
           allParentName=allParentName+":"+orgNameOld;
        }
        //document.getElementById("parentId").value=orgId;
        //document.getElementById("allParentId").value=allParentId;
        //document.getElementById("allParentName").value=allParentName;
        //document.getElementById("allParentCode").value=allParentCode;
        
        location.href="<%=baseURL%>/initOrg_urss.do?parentId="+orgId;
        //document.getElementById("OrgEdit").submit();
        
    }
    
     function deleteOrg()
    {
       var count=getCheckBoxNum("itemIdCheckBox");
       if(count <1)
       {
  		alert("请选择一条子记录进行删除！");
        return ;
       }
        if(window.confirm("您确定要删除选中的记录吗？")){
           document.getElementById("OrgEdit").action="<%=baseURL%>/deleteOrg_urss.do";
           document.getElementById("OrgEdit").submit();
        }
      
    }
    function move()
    {
      <logic:notEmpty name="OrgForm" property="orgId">
		 <logic:present name="subOrgList">
            <logic:notEmpty name="subOrgList">
                
             </logic:notEmpty>
           </logic:present>
        </logic:notEmpty> 
                  
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
		   var formObj=document.getElementById("OrgEdit");
		   formObj.action="<%=baseURL%>/moveOrg_urss.do";
		   formObj.submit();
		}
	}
	}
	function submitOrgEdit(obj)
	{
	  
	   document.getElementById("orgTypeCode").disabled=false;
	   
	   submitForm(obj,'OrgEdit',0,'urss')
	}

    </script>
	</head>
	<fe:body moduleName="urss" formId="OrgEdit">
	<fe:topTable>
	  <fe:powerTool funCode="urss_org" groupName="edit"/>
	</fe:topTable>
	<fe:span>
	 <br />
		<center>
			<font size=4><b>组织管理</font>
		</center>
		<br />
	<html:form action="/saveOrg_urss.do"   styleId="OrgEdit" method="post">
	<table border="0" width="96%" align="center">
	<tr>
		<td>
		<div class="tab-pane" id="tabPane1"><script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
		<div class="tab-page" id="tabPage2">
			<h2 class="tab">基本信息</h2>
			<script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
	<table cellspacing="0" cellpadding="3" width="100%" class="tform" align=center>
	
			 <tr >
				<td width="20%" >所属父组织：</td>
				<td width="80%" colspan="3">
				  <html:hidden name="OrgForm" property="parentId" styleId="parentId" />
				  <html:hidden name="OrgForm" property="orgId" styleId="orgId" />
				  
				  <html:hidden name="OrgForm" property="allParentId" styleId="allParentId" />
				  <html:hidden name="OrgForm" property="allParentCode" styleId="allParentCode" />
				  <input type="hidden" name="orgNameOld" size="30" value="<bean:write name="OrgForm"   property="orgName"/>" id="orgNameOld" class="formStyleall">
				 
				  <html:text name="OrgForm" styleClass="formStyleall"  property="allParentName" styleId="allParentName"  size="60" readonly="true"/>
				</td>
			  </tr>
			  <tr >
				<td width="16%" ><span id = "orgName_span">组织名称：</span></td>
				<td width="29%" colspan="1">
					 <html:text name="OrgForm" styleClass="formStyleall"  property="orgName" styleId="orgName"  size="30" />
				</td>
				
				<td width="16%" ><span id = "orgTypeCode_span">组织类型：</span></td>
				<td width="29%" colspan="1">
				 <input type="hidden" name="orgTypeCodeOld" value="<bean:write name="OrgForm"   property="orgTypeCode"/>" id="orgTypeCodeOld" class="formStyleall">
				<logic:empty name="OrgForm" property="parentId" >
				 <fe:dropDown name="OrgForm"  property="orgTypeCode" dictType="orgType" dynamic="true" struts="true" disabled="true"/>
				 </logic:empty>
				 <logic:notEmpty name="OrgForm" property="parentId" >
				 <fe:dropDown name="OrgForm"  property="orgTypeCode" dictType="orgType" dynamic="true" struts="true" />
				 </logic:notEmpty>
				</td>
			  </tr>
			   <tr >
				<td width="16%" ><span id = "orgCode_span">组织编号：</span></td>
				<td width="29%" colspan="1">
					 <html:text name="OrgForm" styleClass="formStyleall"  property="orgCode" styleId="orgCode"  size="30" />
				</td>
				
				<td width="16%" ><span id = "queryCode_span">组织查询码：</span></td>
				<td width="29%" colspan="1">
				<html:text name="OrgForm" styleClass="formStyleall"  property="queryCode" styleId="queryCode"  size="30" readonly=""/>
				</td>
			  </tr>
			  
			   <tr >
				<td width="16%" ><span id = "orderIndex_span">排序号：</span></td>
				<td width="29%" colspan="3" >
					 <html:text name="OrgForm" styleClass="formStyleall"  property="orderIndex" styleId="orderIndex"  size="4" />
				</td>
				
				
			  </tr>
			 
	</table>
	<logic:present name="subOrgList">
	<logic:notEmpty name="subOrgList">
	<TABLE cellspacing="0" cellpadding="3" width="100%" class="tlist" align="center">
	   <thead>
		<tr>
			<td align="center"  width="5%"><input type="checkbox" name="itemIdCheckBox_all"  id="itemIdCheckBox_all" class="checkbox" onclick="selectAllCheckBox(this,'itemIdCheckBox')"></td>
			<td width="25%" align="center"  nowrap="nowrap"><b>组织名称</b></td>
			<td width="20%" align="center"  nowrap="nowrap"><b>组织类型</b></td>
			<td width="20%" align="center"  nowrap="nowrap"><b>组织编号</b></td>
			<td width="20%" align="center"  nowrap="nowrap"><b>组织查询码</b></td>
		</tr>
		</thead>
		<logic:iterate name="subOrgList" id="org" scope="request">
		<bean:define id="orgRequet" name="org" toScope="request"></bean:define>
		<tr onmouseover='mouseovertd(this)' onmouseout='mouseouttd(this)'>
			<td   align="center"><input type="checkbox"  name="itemIdCheckBox"  value="<bean:write name="org" property="orgId"/>" >&nbsp;</td>
			<td >
			<a href="#" onclick="buttomOnClick('<%=baseURL%>/showOrg_urss.do?orgId=<bean:write name="org" property="orgId"/>','self')" >
			  <bean:write name="org" property="orgName"/>&nbsp;
			 </a>
			 </td>
			 <td  >
			 <fe:codeToName dictType="orgType" dynamic="true" name="orgRequet" property="orgTypeCode" struts="true"/>&nbsp;
			 </td>
			 <td  >
			  <bean:write name="org" property="orgCode"/>&nbsp;
			 </td>
			  <td  >
			  <bean:write name="org" property="queryCode"/>&nbsp;
			 </td>
		</tr>
		</logic:iterate>
		
	</table>
	
	</logic:notEmpty>
	</logic:present>
	
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
	

	 </div>
		</td>
	</tr>
</table>
	 </html:form>
	 </fe:span>
	 <fe:bottomTable></fe:bottomTable>
	 </fe:body>
	<script>
	  <%String reloadTree=(String)request.getAttribute("reloadTree");
	  if(reloadTree!=null&&reloadTree.equals("true"))
	  {
	     %>
	      
	       parent.left.location="<%=baseURL%>/forwardOrgTree_urss.do";
	     <%
	  }
	  %>
	  <logic:empty name="OrgForm" property="orgId">
	      var childAddObjButton = document.getElementById("urss_org_child_add");
          if (childAddObjButton!=null) childAddObjButton.style.display="none";
	  </logic:empty> 
	  
		<logic:empty name="OrgForm" property="parentId" >
				  var equalAddObjButton = document.getElementById("urss_org_equals_add");
                   if (equalAddObjButton!=null) equalAddObjButton.style.display="none";
				
		</logic:empty> 
                    
          <logic:present name="subOrgList">
                    <logic:empty name="subOrgList">
                   var moveObjButton = document.getElementById("urss_org_move");
                   if (moveObjButton!=null) moveObjButton.style.display="none";
                 
                   var delObjButton= document.getElementById("urss_org_del");
                   if (delObjButton!=null) delObjButton.style.display="none";
            </logic:empty>
            </logic:present>
       
         
          <logic:notPresent name="subOrgList">
            var moveObjButton = document.getElementById("urss_org_move");
                   if (moveObjButton!=null) moveObjButton.style.display="none";
                 
                   var delObjButton= document.getElementById("urss_org_del");
                   if (delObjButton!=null) delObjButton.style.display="none";
          </logic:notPresent>
                  
	
	</script>
	
</html>


