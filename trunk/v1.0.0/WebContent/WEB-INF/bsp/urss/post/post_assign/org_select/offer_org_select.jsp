<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ include file="/bsp/abdf/common.jsp"%>
<%@ page import="com.youthor.bsp.core.facade.IUrssServiceFacade"%>


<%@ page import="java.util.*"%>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/xloadtree/xtree.js"></script>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/xloadtree/xmlextras.js"></script>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/xloadtree/xloadtree.js"></script>
<link type="text/css" rel="stylesheet" href="<%=baseURL%>/bsp/abdf/skins/default/css/tree/xtree.css">
<script type="text/javascript">

function changeHandleType(handleTypeValue)
{
  document.getElementById("handleType").value=handleTypeValue;
}
function doChangeMain(orgId,orgName,orgType,allParentIds,allParentNames,allParentTypes)
{
   
   var orgNameObj=document.getElementById("orgName");
   orgNameObj.value=orgName;
   orgNameObj.title=allParentNames;
   orgNameObj.setAttribute("orgId",orgId);
   orgNameObj.setAttribute("orgName",orgName);
   orgNameObj.setAttribute("orgType",orgType);
   orgNameObj.setAttribute("allParentIds",allParentIds);
   orgNameObj.setAttribute("allParentNames",allParentNames);
   orgNameObj.setAttribute("allParentTypes",allParentTypes);
   var orgTypeName=parent.getOrgNameByOrgType(orgType);
  
   orgNameObj.setAttribute("orgTypeName",orgTypeName);
   document.getElementById("orgType").value=orgTypeName;
}

function doRootChange()
{
    var orgNameObj=document.getElementById("orgName");
   orgNameObj.value=parent.orgVo.getOrgName();
   orgNameObj.title=parent.orgVo.getOrgParentName();
   orgNameObj.setAttribute("orgId",parent.orgVo.getOrgId());
   orgNameObj.setAttribute("orgName",parent.orgVo.getOrgName());
   orgNameObj.setAttribute("orgType",parent.orgVo.getOrgType());
   orgNameObj.setAttribute("allParentIds",parent.orgVo.getOrgParentId());
   orgNameObj.setAttribute("allParentNames",parent.orgVo.getOrgParentName());
   orgNameObj.setAttribute("allParentTypes",parent.orgVo.getOrgParentType());
   var orgTypeName=parent.getOrgNameByOrgType(parent.orgVo.getOrgType());
   orgNameObj.setAttribute("orgTypeName",orgTypeName);
   document.getElementById("orgType").value=orgTypeName;
}
webFXTreeConfig.rootIcon    = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/folder.png";
webFXTreeConfig.openRootIcon  = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png";
webFXTreeConfig.folderIcon    = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/folder.png";
webFXTreeConfig.openFolderIcon  = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png";
webFXTreeConfig.fileIcon    = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png";
webFXTreeConfig.lMinusIcon    = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Lminus.png";
webFXTreeConfig.lPlusIcon   = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Lplus.png";
webFXTreeConfig.tMinusIcon    = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Tminus.png";
webFXTreeConfig.tPlusIcon   = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Tplus.png";
webFXTreeConfig.iIcon     = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/I.png";
webFXTreeConfig.lIcon     = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/L.png";
webFXTreeConfig.tIcon     = "<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/T.png";
webFXTreeConfig.blankIcon   = '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/blank.png';
var tree = new WebFXLoadTree(""+parent.orgVo.getOrgName()+"","<%=baseURL%>/orgTree_abdf.do?orgParentId="+parent.orgVo.getOrgId()+"&includeChild="+parent.orgVo.getIncludeChild(),"javascript:doRootChange()",null);
</script>
<html>
	<head>
		<title>可供选择人员</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style type="text/css">
		<!--
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
		}
		-->
</style>

	</head>
	<body>

		<table border="0" width="100%" align="center">
			<tr>
				<td>
					<div class="tab-pane" id="OGR_SELECT_tabPane1" style="height:390">
						<script type="text/javascript">var tp1 = new WebFXTabPane(document.getElementById("OGR_SELECT_tabPane1"));</script>
						<div class="tab-page" id="OGR_SELECT_tabPage2" style="height:390" style="overflow:hidden">
							<h2 class="tab" ><span onclick="changeHandleType('orgTree')">选择组织</span></h2>
							<script type="text/javascript">tp1.addTabPage(document.getElementById("OGR_SELECT_tabPage2" ) );</script>
						     <input type="hidden" id="handleType" name="handleType" value="orgTree"/>
						       <div  id="OGR_Tree" style="height:350" style="overflow:auto">
						       <script language="javascript" type="text/javascript">
						          document.write(tree);
						        </script>
						       </div>
						       操作对象：<input size="16" name="orgName" class="formStyleall" type="text"  id="orgName" readonly="true">
						       类型：<input size="4" name="orgType" class="formStyleall" type="text"  id="orgType" readonly="true">
						     
						</div>
						
						<div class="tab-page" id="OGR_SELECT_tabPage3" style="height:390" style="overflow:hidden">
							<h2 class="tab" >
								<span onclick="changeHandleType('query')">查询</span>
							</h2>
							<script type="text/javascript">tp1.addTabPage( document.getElementById( "OGR_SELECT_tabPage3" ));</script>
							  <div  id="OGR_Query" style="height:350" style="overflow:auto">
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
						       名称/查询码：<input size="18" name="query_para" class="formStyleall" type="text"  id="query_para" >
						       <input type='button' name='Submit'   value='查询' class='Button2' onclick="moveUp()">
						     
						</div>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>

