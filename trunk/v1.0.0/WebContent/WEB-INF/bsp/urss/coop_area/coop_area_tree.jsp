<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.youthor.bsp.core.facade.IUrssServiceFacade"%>
<%@page import="com.youthor.bsp.core.urss.model.CoopArea"%>
<%@page import="com.youthor.bsp.core.abdf.common.helper.SpringHelper"%>
<%@page import="com.youthor.bsp.view.urss.helper.WebHelper"%>
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
     var obj=parent.main.document.getElementById("MOVE_Div")
    if(obj==null||obj.style.display=='none')
        parent.main.location.href="<%=baseURL%>/showCoopArea_urss.do?coopAreaId="+coopAreaId;
     else
     {
       parent.main.document.getElementById("moveToDataId").value=coopAreaId;
       parent.main.document.getElementById("moveToDataName").value=coopAreaName;
     }
        
  }
 function doChangeMainRoot()
 {
     var obj=parent.main.document.getElementById("MOVE_Div")
    if(obj==null||obj.style.display=='none')
        parent.main.location.href="<%=baseURL%>/getTopCoopAreaByComId_urss.do";
     else
     {
        
     }
      
 }
function doNothing()
{
  
}
</script>
</head>
<body class="clsTreeBody" >
<script>
<%   buildCoopAreaTreeSrc(out,request,session);%>
        document.write(t0)
        t0.expandAll(); 
  </script></body>
</html>
