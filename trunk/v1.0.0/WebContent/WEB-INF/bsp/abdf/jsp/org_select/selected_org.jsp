<%@ page contentType="text/html; charset=UTF-8" language="java"  %>
<%@ include file="/bsp/abdf/common.jsp"%>
<%@page import="java.util.List"%>
<html>
<head>
<title>已选择组织</title>
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></head>
 <body topmargin="0" leftmargin="0" onload="getSelectedOrg()">
    <script>
    //得到以选择的组织
    function getSelectedOrg()
    {
    

        var subOrgList=parent.orgVo.getSubOrgVos();
        for(var i=0;i<subOrgList.length;i++)
        {
          createOrgRow(subOrgList[i]);
        }
    }
    
    function createOrgRow(valueObj)
    {
      var orgSelectTbody=document.getElementById("orgSelectTbody");
      var orgId=valueObj.getOrgId();
      var orgName=valueObj.getOrgName();
      var orgType=valueObj.getOrgType();
      var allParentIds=valueObj.getOrgParentId();
      var allParentNames=valueObj.getOrgParentName();
      var allParentTypes=valueObj.getOrgParentType();
      var orgTypeName=parent.getOrgNameByOrgType(orgType);
      var objTableLength=orgSelectTbody.rows.length;
      var myrow=orgSelectTbody.insertRow(objTableLength);
      var mycell=myrow.insertCell();
      mycell.className="";
	  mycell.setAttribute("align","center");
	  mycell.innerHTML="<input type='checkBox'  name='orgItem' orgId='"+orgId+"' orgName='"+orgName+"' orgType='"+orgType+"' value='"+orgId+"' allParentIds='"+allParentIds+"' allParentNames='"+allParentNames+"' allParentTypes='"+allParentTypes+"'>";
	  mycell=myrow.insertCell();
	  mycell.className="";
	  mycell.innerHTML=orgName;
	  mycell=myrow.insertCell();
	  mycell.className="";
	  mycell.innerHTML=orgTypeName;
	  
    }
  </script>
 <table border="0" width="100%" align="center" >
			<tr>
				<td>
					<div class="tab-pane" id="tabPane1" style="height:390">
					
					  <script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("tabPane1"));</script>
						<div class="tab-page" id="tabPage2" style="height:390" style="overflow:auto">
							<h2 class="tab">
								已选组织
							</h2>
							<script type="text/javascript">tp1.addTabPage(document.getElementById("tabPage2" ) );</script>
							
							       <table width="100%" <%=tableStyle%> align="center" >
								  <tbody id="orgSelectTbody">
								  <tr>
								  	<td width='5%' align='center' nowrap class="ListTableHeader"><input type='CheckBox' id='selectedRowAll' name='selectedRowAll' onclick="selectAllGrid(this,'orgItem')"></td>
								  	<td width='60%'style='cursor:hand'  align='center'  nowrap class="ListTableHeader"><b>名称</b></td>
								  	<td width='35%'style='cursor:hand'  align='center'  nowrap class="ListTableHeader"><b>类型</b></td>
								  </tr>
								 
								  </tbody>
								   </table>
						    
						      
							
						</div>
						
					</div>
		           </td>
		         </tr>
		       </table>

 </body>
</html>

