<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.facade.IUrssServiceFacade"%>
<%@page import="com.youthor.bsp.core.urss.model.CoopArea"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@page import="com.youthor.bsp.view.abdf.common.helper.WebHelper"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.StringHelper"%>

<%@taglib uri="/WEB-INF/fireeagle.tld" prefix="fe"%>
<%
  response.setDateHeader("Expires", (new java.util.Date(0)).getTime());
  String baseURL = request.getContextPath();
%>

<html>
<%!
  private void buildCoopAreaTreeSrc(JspWriter out, HttpServletRequest request,HttpSession session) {
    try {
          String baseURL = request.getContextPath();
         //根据模块名来行分类
         IUrssServiceFacade urssServiceFacade=(IUrssServiceFacade)SpringHelper.getBean("urssServiceFacade");
         out.println("var t0 = new WebFXTree('协同区树','javascript:doChangeMainRoot()')");
        
         List allCoopArea=urssServiceFacade.getAllCoopArea();
             if(allCoopArea!=null&&allCoopArea.size()>0)
             {
                for(int i=0;i<allCoopArea.size();i++)
                {
                   CoopArea coopArea=(CoopArea)allCoopArea.get(i);
                  
                       out.println("var t"+coopArea.getCoopAreaId()+" = new WebFXTreeItem('"+coopArea.getCoopAreaName()+"','javascript:doChangeMain(\\'"+coopArea.getCoopAreaId()+"\\',\\'"+coopArea.getCoopAreaName()+"\\')',t0,'"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/openfolder.png','"+baseURL+"/bsp/abdf/skins/default/img/xloadtree/folder.png')");
                      
                
                }
             }
             
          
        
         
      }
    catch (Exception ex) {
      ex.printStackTrace();
      System.out.println("Exception while buildDictTypeTreeSrc.\n" + ex);
    }
  }

%>

<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="<%=baseURL%>/bsp/abdf/js/tree/xtree.js"></script>
<link rel="stylesheet" type="text/css" href="<%=baseURL%>/bsp/abdf/skins/default/css/mian.css" >
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

function doChangeMain(coopAreaId,coopAreaName){
            document.getElementById("selectCoopName").value=coopAreaName;
             document.getElementById("selectCoopId").value=coopAreaId;
  }
 function doChangeMainRoot()
 {
   
      
 }
function doNothing()
{
  
}
function initSelectData()
{
     document.getElementById("selectCoopName").value=window.dialogArguments.document.getElementById("coopAreaIdName").value;
     document.getElementById("selectCoopId").value=window.dialogArguments.document.getElementById("coopAreaId").value;
}


function clearOk(){
	document.getElementById("selectCoopId").value="";
	document.getElementById("selectCoopName").value="";
	
}
</script>
</head>
<body class="clsTreeBody" onload="initSelectData()">
<INPUT type="hidden" name="selectCoopId" id="selectCoopId" value="">
<INPUT type="text" name="selectCoopName" id="selectCoopName" value="" readOnly="" class="formStyleall" style="width=100%">
<script>
<%   buildCoopAreaTreeSrc(out,request,session);%>
        document.write(t0)
        t0.expandAll(); 
  </script></body>
</html>
