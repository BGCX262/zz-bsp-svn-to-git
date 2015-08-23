<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="com.youthor.bsp.view.urss.helper.WebHelper"%>
<html>
<head>
<%@include file="/bsp/abdf/common.jsp"%>

<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/xloadtree/xtree.js"></script>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/xloadtree/xmlextras.js"></script>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/xloadtree/xloadtree.js"></script>
<link type="text/css" rel="stylesheet" href="<%=baseURL%>/bsp/abdf/skins/default/css/tree/xtree.css">
<script type="text/javascript">

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


var tree = new WebFXLoadTree("<bean:write name="orgTreeRoot" property="orgName"/>","<%=baseURL%>/postAssignOrgTree_urss.do?orgParentId=<bean:write name="orgTreeRoot" property="orgId"/>","javascript:doChangeMain('<bean:write name="orgTreeRoot" property="orgId"/>')",null);


  function doChangeMain(orgid,parentId,orgType){
  parent.main.location.href='<%=baseURL%>/showPostAssign_urss.do?orgId='+orgid;  
  }


function doNothing(orgid)
{
  parent.main.location.href='<%=baseURL%>/showPostAssign_urss.do?orgId='+orgid;  
}
</script>
<style type="text/css">
<!--
BODY{
	background-color:#FAF8F6 ;
	margin:0 0 0 0 ;
	font-family: "Arial";
	font-size:12px ; 
	SCROLLBAR-FACE-COLOR: #f6f6f6; SCROLLBAR-HIGHLIGHT-COLOR: #ffffff; SCROLLBAR-SHADOW-COLOR: #cccccc; SCROLLBAR-3DLIGHT-COLOR: #cccccc; SCROLLBAR-ARROW-COLOR: #330000; SCROLLBAR-TRACK-COLOR: #f6f6f6; SCROLLBAR-DARKSHADOW-COLOR: #ffffff; 

}
-->
</style></head>
<body  class="clsTreeBody">
   <script language="javascript" type="text/javascript">
      document.write(tree);
   </script>

</body>
</html>

