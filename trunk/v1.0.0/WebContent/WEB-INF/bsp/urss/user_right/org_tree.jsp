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


var tree = new WebFXLoadTree("<bean:write name="orgTreeRoot" property="orgName"/>","<%=baseURL%>/orgTree_urss.do?orgParentId=<bean:write name="orgTreeRoot" property="orgId"/>","javascript:doChangeMain('','')",null);


  function doChangeMain(orgId,parentId,orgType){
    if(orgType!='YG')
    {
       alert("只能给人员分配权限！");
       return;
    }
    
    parent.main.location.href='<%=baseURL%>/showUserRight_urss.do?orgId='+orgId;  
    
  }


function doNothing()
{
}
</script>
<link rel="stylesheet" type="text/css" href="<%=baseURL%>/bsp/abdf/skins/style.css" >
</head>
<body  class="right_body_left">
   <script language="javascript" type="text/javascript">
      document.write(tree);
   </script>

</body>
</html>

