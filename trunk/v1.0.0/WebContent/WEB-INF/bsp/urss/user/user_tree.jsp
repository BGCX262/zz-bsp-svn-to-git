<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="com.youthor.bsp.view.urss.helper.WebHelper"%>
<%@page import="com.youthor.bsp.core.urss.common.Constants"%>
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


var tree = new WebFXLoadTree("<bean:write name="orgTreeRoot" property="orgName"/>","<%=baseURL%>/orgTreeUser_urss.do?orgParentId=<bean:write name="orgTreeRoot" property="orgId"/>","javascript:doNothing()",null);


  function doChangeMain(orgId,parentId,orgTypeCode,allParentName,orgName,userId){
   var addUserObj = parent.main.document.getElementById("addUser");
  if(orgTypeCode!='<%=Constants.GLOBAL_ORG_YG%>')
  {
      if (addUserObj!=null && addUserObj.checked) {
         alert("增加身份,只能选择员工!");
         return;
      }
     parent.main.location.href='<%=baseURL%>/listPageUnUserByOrgId_urss.do?orgId='+orgId;  
     return;
  }
 
  if (addUserObj!=null && addUserObj.checked) {
      var userName = parent.main.document.getElementById("userName").value;
       if (userName != orgName) {
           alert("用户名不相同，不能增加为多重身份用户");
           return;
       }
       var deleteUserIdsObj = parent.main.document.getElementById("deleteUserIds");
       if (userId!="" && userId!="N") {
          if (deleteUserIdsObj.value.indexOf(userId) >=0 ){
             alert(allParentName +":"+orgName+",此用户已添加.")
             return;
          }
          else {
             if (deleteUserIdsObj.value == "") {
                 deleteUserIdsObj.value = userId;
             }
             else {
                 deleteUserIdsObj.value = deleteUserIdsObj.value+","+userId;
             }
          }
       }
     
       var usersTableTBodyObj = parent.main.document.getElementById("usersTableTBody");
       var myrow=usersTableTBodyObj.insertRow(usersTableTBodyObj.length);
       var mycell=myrow.insertCell();
       mycell.className="";
	   mycell.innerHTML="<input type='hidden' name='orgId' value='"+orgId+"' id='orgId'>"+allParentName+"&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' name='power_button'  value='删除身份'   class='Button3'  onclick='deleteOrgUer()' >";
	   
	   return;
	  
  }
  else {
     alert("只能选择员工以外的组织!");
    return;
    }
  
 
}


function doNothing()
{
    parent.main.location.href='<%=baseURL%>/listPageUnUserByOrgId_urss.do';  
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

