<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.facade.IAbdfServiceFacade"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@page import="com.youthor.bsp.view.abdf.common.helper.WebHelper"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>
<%@page import="com.youthor.bsp.core.abdf.model.MessageFolder"%>

<%
  response.setDateHeader("Expires", (new java.util.Date(0)).getTime());
  String baseURL = request.getContextPath();
%>

<html>

<%!
  private void buildControlTreeTreeSrc(JspWriter out, HttpServletRequest request,HttpSession session) {
    try {
        String baseURL = request.getContextPath(); 
        IAbdfServiceFacade abdfServiceFacade=(IAbdfServiceFacade)SpringHelper.getBean("abdfServiceFacade");
       
         out.println("var t0 = new WebFXTree('我的消息文件夹','javascript:doChangeMainRoot()');");
         
         List allMyMessageFolders=abdfServiceFacade.getUserAllMessageFolder(WebHelper.getOrgId(request.getSession()));
         System.out.println("WebHelper.getOrgId(request.getSession())===" + WebHelper.getOrgId(request.getSession()));
             if(allMyMessageFolders != null && allMyMessageFolders.size()>0)
             {
                for(int i=0;i<allMyMessageFolders.size();i++)
                {
                	MessageFolder messageFolder=(MessageFolder)allMyMessageFolders.get(i);
                   if(messageFolder.getParentId()==null||messageFolder.getParentId().equals(""))
                   {
                       out.println("var t"+messageFolder.getFolderId()+" = new WebFXTreeItem('"+messageFolder.getFolderName()+"','javascript:doChangeMain(\\'"+messageFolder.getFolderId()+"\\',\\'" + messageFolder.getFolderName()+"\\',\\'"+StringHelper.doWithNull(messageFolder.getParentId())+"\\')',t0,'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png');");
                       buildSubFolderTree(messageFolder,allMyMessageFolders,baseURL,out);
                   }
                }
             }
             
          
        
         
      }
    catch (Exception ex) {
      ex.printStackTrace();
      System.out.println("Exception while buildControlTreeSrc.\n" + ex);
    }
  }

 private void buildSubFolderTree(MessageFolder messageFolder,List allMyMessageFolders,String baseURL,JspWriter out) throws Exception{
   if(allMyMessageFolders!=null&&allMyMessageFolders.size()>0){
      for(int i=0;i<allMyMessageFolders.size();i++){
    	  MessageFolder subMessageFolder=(MessageFolder)allMyMessageFolders.get(i);
	      if(!StringHelper.doWithNull(subMessageFolder.getParentId()).equals("")&&subMessageFolder.getParentId().equals(messageFolder.getFolderId()))
	      {
	          out.println("var t"+subMessageFolder.getFolderId()+" = new WebFXTreeItem('"+subMessageFolder.getFolderName()+"','javascript:doChangeMain(\\'"+subMessageFolder.getFolderId()+"\\',\\'"+subMessageFolder.getFolderName()+"\\',\\'"+StringHelper.doWithNull(subMessageFolder.getParentId())+"\\')',t"+subMessageFolder.getFolderId()+",'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png');");
	          buildSubFolderTree(subMessageFolder,allMyMessageFolders,baseURL,out);
	      }
        }
     }
 }
%>

<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/tree/xtree.js"></script>
<link type="text/css" rel="stylesheet" href="<%=baseURL%>/bsp/abdf/skins/default/css/tree/xtree.css">
<script type="text/javascript">
var webFXTreeConfig = {
rootIcon        : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png',
	openRootIcon    : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png',
	folderIcon      : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/folder.png',
	openFolderIcon  : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png',
	fileIcon        : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/openfolder.png',
	iIcon           : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/I.png',
	lIcon           : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/L.png',
	lMinusIcon      : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Lminus.png',
	lPlusIcon       : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Lplus.png',
	tIcon           : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/T.png',
	tMinusIcon      : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Tminus.png',
	tPlusIcon       : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/Tplus.png',
	blankIcon       : '<%=baseURL%>/bsp/abdf/skins/default/img/xloadtree/blank.png',
	defaultText     : 'Tree Item',
	defaultAction   : 'javascript:void(0);',
	defaultBehavior : 'classic',
	usePersistence	: false
};

function doChangeMain(controlTreeId,controlTreeName,allParentId){
    var obj=parent.main.document.getElementById("MOVE_Div")
    if(obj==null||obj.style.display=='none')
        parent.main.location.href="<%=baseURL%>/listUserAllMessageAccept_abdf.do?folderId="+controlTreeId;
     else{
       parent.main.document.getElementById("moveToDataId").value=controlTreeId;
       parent.main.document.getElementById("moveToDataAllId").value=allParentId;
       parent.main.document.getElementById("moveToDataName").value=controlTreeName;
     }   
  }
 function doChangeMainRoot(){
    var obj=parent.main.document.getElementById("MOVE_Div");
    if(obj==null||obj.style.display=='none'){
        parent.main.location.href="<%=baseURL%>/getTopUserFolder_abdf.do";
    }
     else{
        alert("移动时，不能选择根!");
     }
 }
function doNothing(){
  
}
</script>

</head>
<body class="clsTreeBody" >
<script>
<%   
	buildControlTreeTreeSrc(out,request,session);
%>
	document.write(t0);
	t0.expandAll(); 
</script>
</body>
</html>
